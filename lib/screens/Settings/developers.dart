import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Developer extends StatefulWidget {
  const Developer({Key? key}) : super(key: key);

  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Our Developers"),
        backgroundColor: const Color.fromRGBO(0, 74, 140, 1),
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: 350,
            width: 500,
            //color: Color.fromRGBO(0, 74, 140, 1),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(190.0),
                  bottomLeft: Radius.circular(190.0)),
              color: Color.fromRGBO(0, 74, 140, 1),
            ),
          ),
          CarouselSlider(
            items: [
              //item 1
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/sagar.png'),
                    ),
                  ),
                  Text(
                    "Som Sagar",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                  Text("Flutter Developer/Technical Content Writer"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum nisl sit amet ullamcorper eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non diam quis neque viverra mollis et eu ex. Nulla vehicula, nisl ac pellentesque accumsan, mauris libero interdum nisi, sed rhoncus erat urna vel nibh."),
                ],
              ),
              //list 2
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/aditya.png'),
                    ),
                  ),
                  Text(
                    "Aditya Taparia",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                  Text("Flutter Developer/Team Lead"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum nisl sit amet ullamcorper eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non diam quis neque viverra mollis et eu ex. Nulla vehicula, nisl ac pellentesque accumsan, mauris libero interdum nisi, sed rhoncus erat urna vel nibh."),
                ],
              ),
              //item 3
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/jeetesh.png'),
                    ),
                  ),
                  Text(
                    "Jeetesh Gavande",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                  Text("Flutter Developer/Test Lead"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum nisl sit amet ullamcorper eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non diam quis neque viverra mollis et eu ex. Nulla vehicula, nisl ac pellentesque accumsan, mauris libero interdum nisi, sed rhoncus erat urna vel nibh."),
                ],
              ),
              //list 4
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/cyril.png'),
                    ),
                  ),
                  Text(
                    "Cyril Kunjumon",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                  Text("Flutter Developer/Technical Content Writer"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum nisl sit amet ullamcorper eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non diam quis neque viverra mollis et eu ex. Nulla vehicula, nisl ac pellentesque accumsan, mauris libero interdum nisi, sed rhoncus erat urna vel nibh."),
                ],
              ),
              //list 5
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/asui.png'),
                    ),
                  ),
                  Text(
                    "Ringriangsuiyang Pamei",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                  Text("Flutter Developer/Tester"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum nisl sit amet ullamcorper eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non diam quis neque viverra mollis et eu ex. Nulla vehicula, nisl ac pellentesque accumsan, mauris libero interdum nisi, sed rhoncus erat urna vel nibh."),
                ],
              ),
              //list 6
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage('assets/kowsik.png'),
                    ),
                  ),
                  Text(
                    "Saikowsik Vellaturi",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 74, 140, 1),
                      fontSize: 18,
                    ),
                  ),
                  Text("Flutter Developer/Tester"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum nisl sit amet ullamcorper eleifend. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla non diam quis neque viverra mollis et eu ex. Nulla vehicula, nisl ac pellentesque accumsan, mauris libero interdum nisi, sed rhoncus erat urna vel nibh."),
                ],
              ),
            ],
            options: CarouselOptions(
              height: 800.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.9,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(0, 74, 140, 1),
        child: const Icon(
          Icons.mail_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
