import 'package:flutter/material.dart';
import 'package:restaurant/model/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetail(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant?.title),
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
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              restaurant?.thumb,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            restaurant?.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      ],
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
                            "${restaurant?.days[index - 1]['type'][0].toUpperCase()}${restaurant?.days[index - 1]['type'].substring(1)} ",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          Restaurant().showTime(restaurant?.days[index - 1]),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: restaurant?.days?.length != null
                    ? restaurant?.days?.length
                    : 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
