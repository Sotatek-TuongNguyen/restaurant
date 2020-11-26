import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends StatelessWidget {
  final id, title, thumb, days;

  String showTime(day) {
    if (day != null &&
        !["", null].contains(day["open"]) &&
        !["", null].contains(day["close"])) {
      var now = new DateTime.now();
      final startTime =
          DateTime.parse('${now.year}-${now.month}-${now.day} ${day["open"]}');
      final endTime =
          DateTime.parse('${now.year}-${now.month}-${now.day} ${day["close"]}');
      return "${DateFormat.jm().format(startTime)} - ${DateFormat.jm().format(endTime)}";
    } else {
      return 'Closed';
    }
  }

  Restaurant(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.thumb,
      @required this.days})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      thumb,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ))),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 40,
                              child: Text(
                                "${days[index]['type'][0].toUpperCase()}${days[index]['type'].substring(1)} ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              showTime(days[index]),
                              style: TextStyle(fontSize: 16),
                            )
                          ]));
                },
                itemCount: days.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
