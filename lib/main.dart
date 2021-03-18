import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF1C1F2E)),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  Widget formatHomeIcon(IconData icon, String title, String subtitle, color) {
    return TextButton(
      onPressed: ()=>print(title),
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

  Widget menuIcon(IconData icon, {bool active = false}) {
    BoxDecoration decor = BoxDecoration();
    Color iconColor = Colors.white.withOpacity(0.4);
    if (active) {
      decor = BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF6c6f79).withOpacity(0.3)),
        color: Color(0xFF242736),
      );
      iconColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: decor,
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ))),
          onPressed: () => print("here"),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  Widget formatIcon(IconData icon) {

    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        color: Colors.white.withOpacity(0.2),
      ),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ))),
        onPressed: () => print("here"),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.5, 0.0);
    path.lineTo(size.width * 0.65, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString;
  String _dateString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now(), 'kk:mm');
    _dateString = _formatDateTime(DateTime.now(), 'EEEE, dd MMMM y');
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _timeString = _formatDateTime(now, 'kk:mm');
      _dateString =_formatDateTime(now, 'EEEE, dd MMMM y');
    });
  }

  String _formatDateTime(DateTime dateTime, format) {
    return DateFormat(format).format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.photo_camera_front,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF0e78f9),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                widget.menuIcon(Icons.home_filled, active: true),
                widget.menuIcon(Icons.message_outlined),
                widget.menuIcon(Icons.watch_later_outlined),
              ],
            ),
            decoration: BoxDecoration(
              // color: Colors.white,
              border: Border(
                right: BorderSide(
                  //                    <--- top side
                  color: Color(0xFF6c6f79).withOpacity(0.3),
                  width: 1.0,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width - 100.0,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6c6f79).withOpacity(0.3),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                      )
                    ],
                    //Header
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 100.0) / 2,
                    height: MediaQuery.of(context).size.height - 80.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          //                    <--- top side
                          color: Color(0xFF6c6f79).withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 40.0,
                          runSpacing: 40.0,
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
                    width: (MediaQuery.of(context).size.width - 100.0) / 2,
                    height: MediaQuery.of(context).size.height - 80.0,
                    child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: SingleChildScrollView(
                        child: Column(
                          // spacing: 30.0,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Container(
                                width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
                                height: 170.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
                                      height: 170.0,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                      // color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFF45555e),
                                      ),
                                      child: Image.asset("assets/planta.png"),
                                    ),
                                    ClipPath(
                                      clipper: TrapeziumClipper(),
                                      child: Container(
                                        padding: EdgeInsets.all(20.0),
                                        width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color(0xFF456374),
                                          // color: Color(0xFF446474),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(_timeString, style: TextStyle(color: Colors.white, fontSize: 54.0)),
                                            Text(_dateString, style: TextStyle(color: Colors.white, fontSize: 18.0)),
                                          ],
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  // color: Color(0xFF446474),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Container(
                                width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
                                height: 200.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF212534),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Container(
                                width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
                                height: 200.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF212534),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Container(
                                width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
                                height: 200.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF212534),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                //body
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
