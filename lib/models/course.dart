class Course {
  final String coursename;
  final String teachername;
  final String description;
  final List students;
  final String teacherid;
  final String courseid;
  final String url;

  Course(
      {required this.coursename,
      required this.courseid,
      required this.teachername,
      required this.description,
      required this.students,
      required this.teacherid,
      required this.url});

  Map<String, dynamic> toMap() {
    return {
      'coursename': coursename,
      'teachername': teachername,
      'description': description,
      'enrolled_students': students,
      'teacherid': teacherid,
      'courseid': courseid,
      'url': url
    };
  }
}
