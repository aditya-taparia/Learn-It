import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item0 = new Items(
      title: "Proffesor",
      subtitle: "Dr Divya Sindhu Lekha",
      event: "",
      img: "assets/dr.png");

  Items item1 = new Items(
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "Assignments",
    subtitle: "topic#1, topic#2",
    event: "4 Items",
    img: "assets/assignment.png",
  );
  Items item3 = new Items(
    title: "Stats",
    subtitle: "BABUSHQA",
    event: "",
    img: "assets/stats.png",
  );
  Items item4 = new Items(
    title: "Activity",
    subtitle: "BABABOI",
    event: "",
    img: "assets/social.png",
  );
  Items item5 = new Items(
    title: "To do",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
  );
  Items item6 = new Items(
    title: "Syllabus",
    subtitle: "",
    event: "2 Items",
    img: "assets/syllabus.png",
  );
  Items item7 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item0,
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            data.img,
                            width: 42,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            data.title,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            data.subtitle,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            data.event,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      )),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}