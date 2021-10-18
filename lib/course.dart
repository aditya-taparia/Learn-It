import 'package:flutter/material.dart';
import 'grid.dart';
import 'package:google_fonts/google_fonts.dart';

class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Project Management",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(children: <Widget>[
                      Text(
                        "ENROLLED",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w900)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: Colors.green,
                        onPressed: () {},
                      )
                    ]),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  color: Color.fromRGBO(0, 74, 140, 1),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('JOIN CLASSROOM'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 74, 140, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
