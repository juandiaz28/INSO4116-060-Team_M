// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:remote_study/screens/new_meeting_form.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../helpers/data_source.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}

class AddMeeting extends StatelessWidget {
  const AddMeeting({key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewMeetingForm()));
            },
            label: const Text('Add Meeting'),
            icon: const Icon(Icons.add_outlined),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AdaptiveNavBar(
        automaticallyImplyLeading: false,
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
            text: "Add Meeting",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewMeetingForm()));
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
      body: Row(children: [
        SfCalendar(
            view: CalendarView.week,
            backgroundColor: Colors.white,
            dataSource: MeetingDataSource(_getDataSource())),
      ])
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    meetings.add(Meeting(
        'INSO 4151 - Study Session',
        DateTime(2022, 11, 29, 9, 0, 0),
        DateTime(2022, 11, 29, 11, 0, 0),
        Colors.green,
        false));
    meetings.add(Meeting(
        'CIIC 4070 - Study Session',
        DateTime(2022, 11, 30, 11, 0, 0),
        DateTime(2022, 11, 30, 13, 0, 0),
        Colors.deepPurple,
        false));
    meetings.add(Meeting(
        'CIIC 4060 - Study Session',
        DateTime(2022, 12, 1, 16, 0, 0),
        DateTime(2022, 12, 1, 19, 0, 0),
        Colors.blue,
        false));
    meetings.add(Meeting(
        'INGE 3016 - Study Session',
        DateTime(2022, 12, 2, 18, 0, 0),
        DateTime(2022, 12, 2, 21, 0, 0),
        Colors.red,
        false));
    meetings.add(Meeting(
        'MATE 3032 - Study Session',
        DateTime(2022, 12, 3, 13, 0, 0),
        DateTime(2022, 12, 3, 16, 0, 0),
        Colors.orange,
        false));
    return meetings;
  }
}
