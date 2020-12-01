import 'package:flutter/material.dart';
import 'package:restaurant/ui/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant/model/restaurant.dart';

class ItemRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  ItemRestaurant(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('item $restaurant.name'),
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
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        restaurant?.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Text(
                      Restaurant()
                          .checkOperatingHours(restaurant.operatingHours),
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
