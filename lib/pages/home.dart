import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../widgets/topbar.dart';
import '../widgets/sidebar.dart';
import '../widgets/clock.dart';
import '../widgets/meeting_card.dart';
import 'package:mirror/models/Meeting.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  Widget formatHomeIcon(IconData icon, String title, String subtitle, color) {
    return TextButton(
      onPressed: () => print(title),
      child: Container(
        width: 180.0,
        height: 180.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 26.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  Text(subtitle, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          color: Color(color).withOpacity(0.9),
        ),
      ),
    );
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Meeting> meetings = [];

  loadJson() async {
    String data = await rootBundle.loadString('assets/data/meetings.json');
    return json.decode(data);
  }

  @override
  void initState() {
    loadMeetings();
    super.initState();
  }

  void loadMeetings() async {
    final jsonResponse = await loadJson();
    final met = List.from(jsonResponse).map((element) => Meeting.fromJSON(element)).where((element) => element.startAt.isAfter(DateTime.now())).toList();
    met.sort((a, b) => a.startAt.millisecondsSinceEpoch.compareTo(b.startAt.millisecondsSinceEpoch));
    setState(() {
      meetings = met;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Sidebar(),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Topbar(title: "Home"),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 100.0) * 0.45,
                          height: MediaQuery.of(context).size.height - 80.0,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                color: Color(0xFF6c6f79).withOpacity(0.3),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(45.0),
                            child: SingleChildScrollView(
                              child: Wrap(
                                spacing: 30.0,
                                runSpacing: 30.0,
                                children: [
                                  widget.formatHomeIcon(Icons.photo_camera_front, "New Metting", "set up new metting", 0xFFff742e),
                                  widget.formatHomeIcon(Icons.add_box_rounded, "Join Metting", "via invitation link", 0xFF0e78f9),
                                  widget.formatHomeIcon(Icons.more_time, "Schedule", "plan your mettings", 0xFF0e78f9),
                                  widget.formatHomeIcon(Icons.screen_share, "Share Screen", "show your work", 0xFF0e78f9),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 100.0) * 0.55,
                          height: MediaQuery.of(context).size.height - 80.0,
                          child: Padding(
                            padding: const EdgeInsets.all(45.0),
                            child: SingleChildScrollView(
                              child: Wrap(
                                  runSpacing: 20.0,
                                  children: [
                                    Clock(),
                                  ]..addAll(meetings.map((item) => MeetingCard(meeting: item)).toList())),
                            ),
                          ),
                        ),
                      ],
                      //body
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}