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
        appBar: AppBar(
          title: Text("Our Developers"),
          backgroundColor: Color.fromRGBO(0, 74, 140, 1),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                //item 1
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/sagar.png',
                      height: 280.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text("Som Sagar"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/aditya.png',
                      height: 280.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text("Aditya Taparia"),
                  ],
                ),
              ],
              options: CarouselOptions(
                height: 500.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            )
          ],
        ));
  }
}
