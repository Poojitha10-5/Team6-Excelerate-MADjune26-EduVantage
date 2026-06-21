import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/application_model.dart';

class ApplicationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _applicationsRef =>
      _db.collection('applications');

  // Submit a new application for a program/internship
  Future<String?> submitApplication({
    required String programTitle,
    required String programType,
    required String name,
    required String email,
  }) async {
    try {
      final uid = _auth.currentUser?.uid ?? 'anonymous';
      await _applicationsRef.add({
        'uid': uid,
        'programTitle': programTitle,
        'programType': programType,
        'applicantName': name.trim(),
        'applicantEmail': email.trim(),
        'progress': 0.0,
        'appliedAt': FieldValue.serverTimestamp(),
        'appliedAtMillis': DateTime.now().millisecondsSinceEpoch,
      });
      return null; // null = success
    } catch (e) {
      return 'Failed to submit application. Please try again.';
    }
  }

  // Fetch all applications for the current user
  Future<List<ApplicationModel>> getMyApplications() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return [];

    final snapshot = await _applicationsRef.where('uid', isEqualTo: uid).get();

    final apps = snapshot.docs
        .map((doc) => ApplicationModel.fromMap(doc.data(), doc.id))
        .toList();

    // Sort newest first
    apps.sort((a, b) {
      final aTime = a.appliedAtMillis ?? 0;
      final bTime = b.appliedAtMillis ?? 0;
      return bTime.compareTo(aTime);
    });

    return apps;
  }
}
