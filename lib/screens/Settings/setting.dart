// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:learn_it/screens/Settings/developers.dart';
import 'package:learn_it/services/auth.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

final AuthService _auth = AuthService();

//user setting accounts
final List<String> user_entries = <String>[
  'Update Profile',
  'Completed Course'
];
final user_setting_screen = [
  const Center(),
  const Center(),
];
final account_unison = [
  const Icon(
    Icons.edit_sharp,
    color: Color.fromRGBO(0, 74, 140, 1),
  ),
  const Icon(
    Icons.check_box,
    color: Color.fromRGBO(0, 74, 140, 1),
  ),
];
//settings application
final List<String> entries = <String>[
  'About Us',
  'Privacy Policy',
  'Developers',
];

final useicon = [
  const Icon(
    Icons.person,
    color: Color.fromRGBO(0, 74, 140, 1),
  ),
  const Icon(
    Icons.verified_user,
    color: Color.fromRGBO(0, 74, 140, 1),
  ),
  const Icon(
    Icons.developer_board,
    color: Color.fromRGBO(0, 74, 140, 1),
  ),
];
final setting_screen = [
  Scaffold(
    appBar: AppBar(
        title: const Text("Our Story"),
        backgroundColor: const Color.fromRGBO(0, 74, 140, 1)),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Done as a part of CSE 312 Software Engeneering and Project Management",
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(0, 74, 140, 1)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "By a group of jobless people who got together to form team Aviat’O",
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(0, 74, 140, 1)),
          ),
        ],
      ),
    ),
  ),
  Scaffold(
    appBar: AppBar(
      title: const Text("Privacy Policy"),
      backgroundColor: const Color.fromRGBO(0, 74, 140, 1),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Secure logging in information:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "We might provide our users with logging in capability to create a profile for themselves on our application. These accounts will be password protected and it is the responsibility of the customers to make sure that they protect their logging in information by limiting access to your computer and by signing off  on the browser after use. We work towards protecting your user information and to ensure that the user accounts are kept private and secure however, the company cannot guarantee the security of user account information. Unauthorized entry or use, hardware or software failure, and other factors from the user side, may compromise the security of users information at any time. With the user profile capability, the users will be able to access their personal profile information such as name, phone number and email address etc. and change them at any time."),
            SizedBox(
              height: 20,
            ),
            Text(
              "E-mails:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "When a customer receives any communication from LEARNIt Pvt Ltd or any of its associated or employees, we generally receive a confirmation, given the second party’s computer support such programs. This information is collected with the purpose of improving the emails send from us and to make it more interesting and helpful.  Customers can opt out of receiving emails by using the unsubscribing option available with every email sent."),
            SizedBox(
              height: 20,
            ),
            Text(
              "Privacy policy updates or changes:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "We reserve the right to update or revise this privacy policy. Information collected now is subject to the current version of Privacy policy in effect. Any changes in the privacy policy will be notified on the company’s website, but it is suggested that the users go through them from time to time to keep themselves updated.  The current version governs our information collection and privacy policy and by using our services you agree to be bound by the current privacy policy."),
          ],
        ),
      ),
    ),
  ),
  const Developer(),
];

//state
class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color.fromRGBO(0, 74, 140, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // account setting
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Account",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: user_entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  user_setting_screen[index]));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white30, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[200],
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: account_unison[index],
                                ),
                                Text(
                                  user_entries[index],
                                  style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 74, 140, 1)),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: Color.fromRGBO(0, 74, 140, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // application setting
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Application",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17),
                ),
              ),
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white30, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[200],
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: useicon[index],
                                ),
                                Text(
                                  entries[index],
                                  style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 74, 140, 1)),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: Color.fromRGBO(0, 74, 140, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          const Color.fromRGBO(0, 74, 140, 1), // background
                      onPrimary: Colors.white,
                    ),
                    onPressed: () async {
                      await _auth.signout();
                    },
                    child: const Text("Logout")),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
