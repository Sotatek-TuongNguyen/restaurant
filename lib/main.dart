import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:restaurant/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    print(DateTime.parse("1969-07-20 20:18").minute);
    final startTime = DateTime(2018, 6, 23, 10, 30);
    final endTime = DateTime(2018, 6, 23, 13, 00);

    final currentTime = DateTime.now();

    if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
      // do something
    }
    switch (now.weekday) {
      case 1:
        break;
      default:
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RestaurantList(),
    );
  }
}

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  // List restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant List'),
        ),
        body: Center(
          child: FutureBuilder(
            future: Future<String>.delayed(
                Duration(seconds: 2),
                () => DefaultAssetBundle.of(context)
                    .loadString('assets/json/restaurants.json')),
            builder: (context, snapshort) {
              if (snapshort.hasData) {
                var newData = json.decode(snapshort.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return RestaurantListItem(newData, index);
                  },
                  itemCount: newData == null ? 0 : newData.length,
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 30,
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}

class RestaurantListItem extends StatelessWidget {
  RestaurantListItem(this.newData, this.index) : super(key: ObjectKey(newData));

  final newData;
  final index;

  String checkTime(day) {
    var restaurant = newData[index];
    if (restaurant["days"][day] != null &&
        restaurant["days"][day]["open"] != "" &&
        restaurant["days"][day]["close"] != "") {
      var now = new DateTime.now();
      final startTime = DateTime.parse(
          '${now.year}-${now.month}-${now.day} ${restaurant["days"][day]["open"]}');
      final endTime = DateTime.parse(
          '${now.year}-${now.month}-${now.day} ${restaurant["days"][day]["close"]}');
      if (now.isAfter(startTime) && now.isBefore(endTime)) {
        return 'Opening';
      } else {
        return 'Closed';
      }
    } else {
      return 'Closed';
    }
  }

  String getStatus(BuildContext context) {
    var now = new DateTime.now();
    switch (now.weekday) {
      case 1:
        return checkTime("mon");
        break;
      case 2:
        return checkTime("tue");
        break;
      case 3:
        return checkTime("wed");
        break;
      case 4:
        return checkTime("thu");
        break;
      case 5:
        return checkTime("fri");
        break;
      case 6:
        return checkTime("sat");
        break;
      case 7:
        return checkTime("sun");
        break;
      default:
        return 'Close';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Restaurant(data: newData[index])));
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(newData[index]['thumb']),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    newData[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Text(
                  getStatus(context),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            )),
            SizedBox(width: 20)
          ],
        ),
      ),
    ));
  }
}
