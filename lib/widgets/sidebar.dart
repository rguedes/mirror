import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  Sidebar({Key key}) : super(key: key);

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

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}