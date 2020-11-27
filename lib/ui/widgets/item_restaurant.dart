import 'package:flutter/material.dart';
import 'package:restaurant/ui/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant/model/restaurant.dart';

class ItemRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  ItemRestaurant(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('item $restaurant.id'),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetail(restaurant),
            ),
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    restaurant?.thumb,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        restaurant?.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Text(
                      Restaurant().checkTime(restaurant?.days),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20)
            ],
          ),
        ),
      ),
    );
  }
}
