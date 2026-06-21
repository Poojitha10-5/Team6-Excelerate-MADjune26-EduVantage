class ApplicationModel {
  final String id;
  final String programTitle;
  final String programType; // 'program' | 'internship'
  final String applicantName;
  final String applicantEmail;
  final double progress;
  final int? appliedAtMillis;

  ApplicationModel({
    required this.id,
    required this.programTitle,
    required this.programType,
    required this.applicantName,
    required this.applicantEmail,
    this.progress = 0.0,
    this.appliedAtMillis,
  });

  factory ApplicationModel.fromMap(Map<String, dynamic> map, String id) {
    return ApplicationModel(
      id: id,
      programTitle: map['programTitle'] ?? '',
      programType: map['programType'] ?? 'program',
      applicantName: map['applicantName'] ?? '',
      applicantEmail: map['applicantEmail'] ?? '',
      progress: (map['progress'] ?? 0.0).toDouble(),
      appliedAtMillis: map['appliedAtMillis'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'programTitle': programTitle,
        'programType': programType,
        'applicantName': applicantName,
        'applicantEmail': applicantEmail,
        'progress': progress,
        'appliedAtMillis': appliedAtMillis,
      };
}
