import 'package:flutter/material.dart';
import '../widgets/topbar.dart';
import '../widgets/sidebar.dart';
import '../models/Meeting.dart';
import 'package:window_size/window_size.dart' as window_size;

class WaitingRoom extends StatefulWidget {
  WaitingRoom({Key key, this.meeting}) : super(key: key);
  final Meeting meeting;

  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {

  @override
  Widget build(BuildContext context) {
    window_size.setWindowTitle("Mirror Call - "+ widget.meeting.title);

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
                  Topbar(title: "Meeting Room - "+ widget.meeting.title),
                  Container(
                    width: (MediaQuery.of(context).size.width - 100.0),
                    height: MediaQuery.of(context).size.height - 80.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text("No one is on the call yet"),
                        ),
                        Container(
                          width: 400,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF45555e),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: FittedBox(child: Image.network(widget.meeting.persons[1].avatar), fit: BoxFit.cover,),
                                height: 300,
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                height: 120,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Column(
                                      children: [
                                        TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<CircleBorder>(CircleBorder())
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.grey)
                                                ),
                                                child: Icon(Icons.mic),
                                                padding: EdgeInsets.all(15),
                                              ),
                                              Positioned(
                                                child:Container(
                                                  width: 5.0,
                                                  height: 5.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                top: 15,
                                                right: 15,
                                              ),

                                            ],
                                          ),
                                          onPressed: ()=>print("Microphone off"),
                                        ),
                                        Text("Microphone", style: TextStyle(color: Colors.black),),
                                        Text("ON", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        TextButton(
                                          onPressed: ()=>print("camera off"),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<CircleBorder>(CircleBorder())
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.grey)
                                                ),
                                                child: Icon(Icons.photo_camera_front),
                                                padding: EdgeInsets.all(15),
                                              ),
                                              Positioned(
                                                child:Container(
                                                  width: 5.0,
                                                  height: 5.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                top: 15,
                                                right: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text("Camera", style: TextStyle(color: Colors.black),),
                                        Text("ON", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFfe7834),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: TextButton(child: Text("Join call", style: TextStyle(color: Colors.white),), onPressed: ()=>print("joinr"),),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )


                      ],
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