import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
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

class _ClockState extends State<Clock> {
  String _timeString;
  String _dateString;

  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _timeString = _formatDateTime(now, 'kk:mm');
      _dateString = _formatDateTime(now, 'EEEE, dd MMMM y');
    });
  }

  String _formatDateTime(DateTime dateTime, format) {
    return DateFormat(format).format(dateTime);
  }

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now(), 'kk:mm');
    _dateString = _formatDateTime(DateTime.now(), 'EEEE, dd MMMM y');
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width - 100.0) / 2 - 110),
      height: 180.0,
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
    );
  }
}