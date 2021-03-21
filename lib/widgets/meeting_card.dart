import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirror/models/Meeting.dart';
import 'package:mirror/models/Person.dart';

import 'package:mirror/pages/waiting_room.dart';

class MeetingCard extends StatelessWidget {
  final Meeting meeting;
  final key = GlobalKey();

  MeetingCard({Key key, this.meeting}) : super(key: key);

  Widget participant(Person person) {
    return Container(
      width: 40.0,
      height: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Tooltip(
        // waitDuration: Duration(seconds: 1),
        showDuration: Duration(seconds: 1),
        padding: EdgeInsets.all(10),
        message: person.name,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            person.avatar,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }

  Widget countMoreParticipants(int more) {
    if (more > 0) {
      return Container(
        width: 40.0,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey.withOpacity(0.1)),
          color: Color(0xFF0e78f9),
        ),
        child: Text(
          "+" + more.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return Container();
    }
  }

  final List<PopupMenuEntry<Object>> choices = [
    PopupMenuItem(
      value: "copy_id",
      child: Text("Copy ID", style: TextStyle(color: Colors.white)),
    ),
    PopupMenuDivider(
      height: 5,
    ),
    PopupMenuItem(
      value: "share",
      child: Text("Share Meeting", style: TextStyle(color: Colors.white)),
    ),
    PopupMenuDivider(
      height: 5,
    ),
    PopupMenuItem(
      value: "cancel",
      child: Text("Cancel Meeting", style: TextStyle(color: Colors.white)),
    ),
  ];

  void popUpChoose(choice) {
    switch (choice) {
      case "copy_id":
        Clipboard.setData(new ClipboardData(text: meeting.id));
        break;
      case "share":
        Clipboard.setData(new ClipboardData(text: meeting.id));
        break;
      case "cancel":
        Clipboard.setData(new ClipboardData(text: meeting.id));
        break;
    }
  }

  Widget _simplePopup() => PopupMenuButton(
        icon: Icon(
          Icons.more_horiz_outlined,
          color: Colors.grey,
        ),
        onSelected: popUpChoose,
        padding: EdgeInsets.zero,
        color: Color(0xFF1C1F2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
        // initialValue: choices[_selection],
        itemBuilder: (BuildContext context) {
          return choices;
        },
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WaitingRoom(meeting: meeting))),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Container(
          width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
          height: 170.0,
          // margin: new EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            color: Color(0xFF242736).withOpacity(0.9),
            // color: Colors.white.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            meeting.title,
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.watch_later_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              meeting.getTime(),
                              style: TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                            Text(
                              meeting.getTimeUntil(),
                              style: TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 5.0,
                      children: []
                        ..addAll(meeting.persons.sublist(0, meeting.persons.length > 3 ? 3 : meeting.persons.length).map((item) => participant(item)).toList())
                        ..add(countMoreParticipants(meeting.persons.length - 3)),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF6c6f79).withOpacity(0.3)),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: _simplePopup(),
                      // child: TextButton(
                      //   style: ButtonStyle(
                      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //   ))),
                      //   onPressed: () => _simplePopup(),
                      //   child: Icon(
                      //     Icons.more_horiz_outlined,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFF6c6f79).withOpacity(0.3)),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: Tooltip(
                              // waitDuration: Duration(seconds: 1),
                              showDuration: Duration(seconds: 1),
                              padding: EdgeInsets.all(5),
                              message: "Click to copy the Meeting ID!",
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                                onPressed: () => Clipboard.setData(new ClipboardData(text: meeting.id)),
                                child: Text(
                                  "id",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => print("Start Meeting"),
                          child: Container(
                            width: 80.0,
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.grey.withOpacity(0.1)),
                              color: Color(0xFF0e78f9),
                            ),
                            child: Text(
                              "Start",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
