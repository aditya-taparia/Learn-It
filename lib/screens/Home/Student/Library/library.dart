import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/screens/Home/Student/Library/filtered_page.dart';
import 'package:learn_it/shared/course_page.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:learn_it/shared/loading_course.dart';
import 'package:provider/provider.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _list = <String>['Course Name', 'Teacher Name'];
  final List<String> _searchbylist = <String>['coursename', 'teachername'];
  late String _searchText = '';
  late String _selectedItem = 'Course Name';
  late String _searchby = 'coursename';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Course>?>.value(
      value: CourseDatabase().courses,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Library'),
          centerTitle: true,
          /* actions: <Widget>[
            IconButton(
              onPressed: () async {
                await _auth.signout();
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 32,
              ),
            )
          ], */
          backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
        ),
        body: const CourseList(),
        backgroundColor: const Color(0x00CCCCCC),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.5),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    title: const Center(
                      child: Text(
                        'Filter Your Choice',
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 75, 141, 1),
                        ),
                      ),
                    ),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 0.0,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Keyword';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _searchText = value;
                                });
                              },
                              initialValue: _searchText,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Color.fromRGBO(0, 75, 141, 1),
                                  size: 30.0,
                                ),
                                prefixIconColor: Color.fromRGBO(0, 75, 141, 1),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                ),
                                hintText: 'Search',
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 3.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            'Search By',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 75, 141, 1),
                            ),
                          ),
                          Wrap(
                            spacing: 5.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: List<Widget>.generate(
                              _list.length,
                              (index) {
                                return ChoiceChip(
                                  label: Text(
                                    _list[index],
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 75, 141, 1),
                                    ),
                                  ),
                                  selected: _selectedItem == _list[index],
                                  onSelected: (selected) {
                                    setState(() {
                                      _selectedItem = _list[index];
                                      _searchby = _searchbylist[index];
                                    });
                                  },
                                  selectedColor: Colors.blue[100],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilterPage(
                                searchText: _searchText,
                                searchBy: _searchby,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 75, 141, 1),
                          ),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blue.withOpacity(0.25)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.red[600],
                          ),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.red.withOpacity(0.25)),
                        ),
                      ),
                    ],
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                  );
                });
              },
            );
          },
          child: const Icon(
            Icons.filter_list_rounded,
            color: Colors.white,
            size: 32,
          ),
          backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
        ),
      ),
    );
  }
}

// Course List
class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<List<Course>?>(context);
    if (courses == null) {
      return const Center(
        child: LoadingCourse(),
      );
    }
    if (courses.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/No Result.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          const Center(
            child: Text(
              'No Course Found',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseTile(course: courses[index]);
        },
      );
    }
  }
}

// CourseTile
class CourseTile extends StatelessWidget {
  final Course course;
  const CourseTile({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add this to use user db
    final user = Provider.of<Users?>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoursePage(course: course),
                ),
              );
            },
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/student.png'),
            ),
            title: Text(course.coursename),
            subtitle: Text('Taught by ${course.teachername}'),
            // Adding enrolled tag if the user is enrolled
            trailing: course.students.contains(user!.userid)
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[100],
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: const Text("Enrolled"),
                  )
                : null),
      ),
    );
  }
}
