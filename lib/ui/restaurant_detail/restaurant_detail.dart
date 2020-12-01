import 'package:flutter/material.dart';
import 'package:restaurant/model/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetail(this.restaurant);

  @override
  Widget build(BuildContext context) {
    final List<String> weekdays = Restaurant().listWeekDays();

    final arrayTime =
        Restaurant().showListOperatingHours(restaurant?.operatingHours);

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant?.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            restaurant?.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              // "${restaurant?.days[index - 1]['type'][0].toUpperCase()}${restaurant?.days[index - 1]['type'].substring(1)} ",
                              weekdays[index - 1],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            arrayTime[weekdays[index - 1]] != null
                                ? arrayTime[weekdays[index - 1]]
                                : 'Closed',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: weekdays.length + 1),
            ),
          ],
        ),
      ),
    );
  }
}
