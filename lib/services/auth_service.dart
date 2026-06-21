import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream: broadcasts auth state changes (login / logout)
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Current user (null if logged out)
  User? get currentUser => _auth.currentUser;

  // Sign Up
  Future<AuthResult> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        await user.updateDisplayName(name.trim());
        await user.reload();

        // UserService.getCurrentUser() reads from on every screen.
        await _db.collection('users').doc(user.uid).set(
              UserModel(
                uid: user.uid,
                name: name.trim(),
                email: email.trim(),
              ).toMap(),
            );
      }

      return AuthResult.success(user);
    } on FirebaseAuthException catch (e) {
      return AuthResult.error(_mapFirebaseError(e.code));
    } catch (_) {
      return AuthResult.error('Something went wrong. Please try again.');
    }
  }

  // Sign In
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return AuthResult.success(credential.user);
    } on FirebaseAuthException catch (e) {
      return AuthResult.error(_mapFirebaseError(e.code));
    } catch (_) {
      return AuthResult.error('Something went wrong. Please try again.');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Forgot Password
  Future<AuthResult> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return AuthResult.success(null);
    } on FirebaseAuthException catch (e) {
      return AuthResult.error(_mapFirebaseError(e.code));
    } catch (_) {
      return AuthResult.error('Something went wrong. Please try again.');
    }
  }

  // Error mapper
  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'An account with this email already exists.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}

// Result wrapper
class AuthResult {
  final User? user;
  final String? error;
  bool get isSuccess => error == null;

  AuthResult.success(this.user) : error = null;
  AuthResult.error(this.error) : user = null;
}
