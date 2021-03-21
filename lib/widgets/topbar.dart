import 'package:flutter/material.dart';

class Topbar extends StatefulWidget {
  Topbar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TopbarState createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ),
      ),
    );
  }
}