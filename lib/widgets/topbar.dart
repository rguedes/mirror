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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(left: 60.0),
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 40.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF6c6f79).withOpacity(0.3)),
                  color: Color(0xFF242736),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}