import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends StatelessWidget {
  final data;

  String showTime(day) {
    if (data["days"][day] != null &&
        !["", null].contains(data["days"][day]["open"]) &&
        !["", null].contains(data["days"][day]["close"])) {
      var now = new DateTime.now();
      final startTime = DateTime.parse(
          '${now.year}-${now.month}-${now.day} ${data["days"][day]["open"]}');
      final endTime = DateTime.parse(
          '${now.year}-${now.month}-${now.day} ${data["days"][day]["close"]}');
      return "${DateFormat.jm().format(startTime)} - ${DateFormat.jm().format(endTime)}";
    } else {
      return 'Closed';
    }
  }

  Restaurant({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data["title"]),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Container(
                      height: MediaQuery.of(context).size.width * 9 / 16,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(data['thumb']),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    data['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Mon ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("mon"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Tue ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("tue"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Wed ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("wed"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Thu ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("thu"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Fri ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("fri"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Sat ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("sat"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              "Sun ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            showTime("sun"),
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
              ],
            ),
          ),
        ));
  }
}
