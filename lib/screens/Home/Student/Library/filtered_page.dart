import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:learn_it/shared/course_page.dart';
import 'package:learn_it/shared/loading_course.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  final String searchText;
  final String searchBy;
  const FilterPage({Key? key, required this.searchText, required this.searchBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Course>?>.value(
      value: Filter(searchText: searchText, searchBy: searchBy).filtercourses,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Filter - "$searchText"'),
          backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
          centerTitle: true,
        ),
        body: const FilterList(),
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<List<Course>?>(context);
    if (filter == null) {
      return const Center(
        child: LoadingCourse(),
      );
    }
    if (filter.isEmpty) {
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
        itemCount: filter.length,
        itemBuilder: (context, index) {
          return FilterTile(course: filter[index]);
        },
      );
    }
  }
}

class FilterTile extends StatelessWidget {
  final Course course;
  const FilterTile({Key? key, required this.course}) : super(key: key);

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
