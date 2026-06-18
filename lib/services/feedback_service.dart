import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedbackService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> submitFeedback({
    required String name,
    required String email,
    required String comments,
  }) async {
    try {
      await _db.collection('feedback').add({
        'name': name.trim(),
        'email': email.trim(),
        'comments': comments.trim(),
        'uid': _auth.currentUser?.uid ?? 'anonymous',
        'submittedAt': FieldValue.serverTimestamp(),
      });
      return null; // null = success
    } catch (e) {
      return 'Failed to submit feedback. Please try again.';
    }
  }
}
