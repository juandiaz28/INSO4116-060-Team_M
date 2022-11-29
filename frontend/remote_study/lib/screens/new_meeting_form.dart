import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class NewMeetingForm extends StatefulWidget {
  @override
  _NewMeetingFormState createState() => _NewMeetingFormState();
}

class _NewMeetingFormState extends State<NewMeetingForm> {
  String _course;
  String _selectedCourse;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _course = '';
    _selectedCourse = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _selectedCourse = _course;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AdaptiveNavBar(
        backgroundColor: Colors.green,
        screenWidth: sw,
        title: const Text("Remote Study"),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Classes",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Settings",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8.0),
            Text(
              "Add meeting",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: DropDownFormField(
                      titleText: 'Course',
                      hintText: 'Select',
                      value: _course,
                      onSaved: (value) {
                        setState(() {
                          _course = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _course = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "ININ4010",
                          "value": "ININ4010",
                        },
                        {
                          "display": "CIIC4050",
                          "value": "CIIC4050",
                        },
                        {
                          "display": "INSO4116",
                          "value": "INSO4116",
                        },
                        {
                          "display": "CIIC5140",
                          "value": "CIIC5140",
                        },
                        {
                          "display": "INSO4115",
                          "value": "INSO4115",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Add participants",
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'From:',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabled: false,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'MM/DD/YYYY',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '00:00',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Until:',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabled: false,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'MM/DD/YYYY',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '00:00',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText:
                          'Add location (for virtual meeting write "Remote")',
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    maxLines: 7,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Meeting details...",
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  MaterialButton(
                    height: 60.0,
                    minWidth: double.infinity,
                    color: Colors.green,
                    onPressed: () {},
                    child: Text("Save",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
