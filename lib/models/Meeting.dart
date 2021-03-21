import 'package:intl/intl.dart';
import 'package:calendar_time/calendar_time.dart';
import 'Person.dart';

class Meeting {

  List<dynamic> persons;
  String title;
  String id;
  DateTime startAt;
  DateTime finishAt;
  Meeting();

  Meeting.fromJSON(Map<String, dynamic> jsonMap) {
    try{
      id = jsonMap['id'];
      title = jsonMap['title'];
      startAt = DateTime.parse(jsonMap['start_at']);
      finishAt = DateTime.parse(jsonMap['finish_at']);
      persons = List.from(jsonMap['persons'])
          .map((element) => Person.fromJson(element))
          .toList();
    }catch (e){
      id = null;
      persons = <Person>[];
      title = "";
      startAt = DateTime.now();
      finishAt = DateTime.now();
    }
  }

  String getTime(){
    final calendarTime = CalendarTime(startAt);
    return calendarTime.format("HH:mm")+" - "+ CalendarTime(finishAt).format("HH:mm");
  }

  String getTimeUntil(){
    if(startAt.difference(DateTime.now()).inDays == 0){
      return "starts in "+ startAt.difference(DateTime.now()).inHours.toString()+" hours";
    }
    return CalendarTime(startAt).toHuman;
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    return diff == 0 && now.day == date.day;
  }

}