class Course {
  final String coursename;
  final String teachername;
  final String description;
  final List students;
  final String teacherid;

  Course(
      {required this.coursename,
      required this.teachername,
      required this.description,
      required this.students,
      required this.teacherid});

  Map<String, dynamic> toMap() {
    return {
      'coursename': coursename,
      'teachername': teachername,
      'description': description,
      'enrolled_students': students,
      'teacherid': teacherid,
    };
  }
}
