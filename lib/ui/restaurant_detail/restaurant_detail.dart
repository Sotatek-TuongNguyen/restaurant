import 'package:flutter/material.dart';
import 'package:restaurant/model/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant data;

  RestaurantDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data?.title),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  data?.thumb,
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                ))),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            data?.title,
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
                                "${data?.days[index - 1]['type'][0].toUpperCase()}${data?.days[index - 1]['type'].substring(1)} ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              Restaurant().showTime(data?.days[index - 1]),
                              style: TextStyle(fontSize: 16),
                            )
                          ]));
                },
                itemCount: data?.days?.length != null ? data?.days?.length : 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
