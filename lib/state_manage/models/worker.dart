class Worker {
  final String firstName;
  final String lastName;
  final String email;
  final String job;

  Worker({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.job,
  });

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      job: map['job'] as String,
    );
  }
}
