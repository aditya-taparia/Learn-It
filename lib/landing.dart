import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(const Landing());
}

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        child: Center(
          child: LoginPage(),
        ),
      )),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundcolor = Colors.white;
  var _headingcolor = const Color.fromRGBO(0, 75, 141, 1);
  double _headingTop = 100;
  double width = 0;
  double height = 0;
  double _Yoffset = 0;
  double rYoffset = 0;
  bool _kvisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _kvisible = visible;
        });
      },
    );
  }

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    switch (_pageState) {
      case 0:
        _backgroundcolor = Colors.white;
        _headingcolor = const Color.fromRGBO(0, 75, 141, 1);
        _Yoffset = height;
        rYoffset = height;
        _headingTop = 100;

        break;
      case 1:
        _backgroundcolor = const Color(0xFFBBA8C63);
        _headingcolor = Colors.white;
        _Yoffset = _kvisible ? 60 : 270;
        rYoffset = height;
        _headingTop = 90;

        break;

      case 2:
        _backgroundcolor = const Color(0xFFBBA8C63);
        _headingcolor = Colors.white;
        _Yoffset = _kvisible ? 60 : 300;
        rYoffset = 250;
        _headingTop = 90;

        break;
    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          color: _backgroundcolor,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          margin: EdgeInsets.only(
                            top: _headingTop,
                          ),
                          child: Column(
                            children: <Widget>[
                              Text("LearnIt",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: _headingcolor,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(30, 25, 30, 20),
                                  child: Text(
                                      "Welcome to LearnIt, the platform where you can select and learn courses you wish taught by highly qualified mentors at low prices",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(60, 60, 60, 60),
                                  child: Image.asset('assets/Learn It Logo.png',
                                      height: 250, width: 250)),
                            ],
                          )),
                    ],
                  )),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 75, 141, 1),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(20),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _Yoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Container(
              child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Login page",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InputWithIcon(
                        icon: Icons.email,
                        hint: "Enter EmailID",
                      ),
                      SizedBox(height: 20),
                      InputWithIcon(
                        icon: Icons.vpn_key,
                        hint: "Enter Password",
                      ),
                      SizedBox(height: 20),
                      RadioBtn(),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(text: "Login  "),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutlineBtn(text: "Create New Account"),
                  )
                ],
              ),
            ],
          )),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(20),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, rYoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Container(
              child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Register page",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InputWithIcon(
                        icon: Icons.email,
                        hint: "Enter EmailID",
                      ),
                      SizedBox(height: 20),
                      InputWithIcon(
                        icon: Icons.vpn_key,
                        hint: "Enter Password",
                      ),
                      SizedBox(height: 20),
                      InputWithIcon(
                        icon: Icons.vpn_key,
                        hint: "Re-Enter Password",
                      ),
                      SizedBox(height: 20),
                      RadioBtn(),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(text: "Create Account"),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineBtn(text: "Already have an Account"),
                  )
                ],
              ),
            ],
          )),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String text;
  PrimaryButton({required this.text});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFBBA8C63),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({required this.icon, required this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              widget.icon,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RadioBtn extends StatefulWidget {
  const RadioBtn({Key? key}) : super(key: key);

  @override
  _RadioBtnState createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text("Login As:"),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = int.parse(value.toString());
                  print(_value);
                });
              },
            ),
            Text("Student"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = int.parse(value.toString());
                  print(_value);
                });
              },
            ),
            Text("Lecturer"),
          ],
        )
      ],
    ));
  }
}

class OutlineBtn extends StatefulWidget {
  final String text;
  OutlineBtn({required this.text});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFBBA8C63),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
