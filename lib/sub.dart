import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Sub extends StatefulWidget {
  const Sub({Key? key}) : super(key: key);

  @override
  _SubState createState() => _SubState();
}

class _SubState extends State<Sub> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Submission Deadline 00:00:00",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Color.fromRGBO(0, 74, 140, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          ElevatedButton(
            child: Text("UPLOAD"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 74, 140, 1),
            ),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result == null) {
                return;
              }

              final file = result.files.first;
              openFile(file);
            },
          ),
        ],
      ),
    );
  }
}

void openFile(PlatformFile file) {
  openFile(file);
}
