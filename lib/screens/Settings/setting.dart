import 'package:flutter/material.dart';
import 'package:learn_it/screens/Settings/developers.dart';
import 'package:learn_it/services/auth.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

final AuthService _auth = AuthService();
final List<String> entries = <String>[
  'Developers',
  'About Us',
  'Privacy Ploicy',
];
final setting_screen = [
  const Developer(),
  const Developer(),
  const Developer(),
];

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Color.fromRGBO(0, 74, 140, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => setting_screen[index]));
                        },
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Center(child: Text('${entries[index]}')),
                        ),
                      );
                    }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 74, 140, 1), // background
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        await _auth.signout();
                      },
                      child: Text("Logout")),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ));
  }
}
