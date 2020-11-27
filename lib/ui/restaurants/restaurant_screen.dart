import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/model/restaurant.dart';
import 'package:restaurant/ui/widgets/item_restaurant.dart';
import 'package:restaurant/stores/restaurant_store/restaurant_store.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  RestaurantStore _restaurantStore;
  var listRestaurants;

  @override
  Widget build(BuildContext context) {
    _restaurantStore = Provider.of<RestaurantStore>(context);
    listRestaurants = _restaurantStore.getListRestaurant(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: listRestaurants,
        builder:
            (BuildContext context, AsyncSnapshot<List<Restaurant>> snapshot) {
          Widget children;
          if (!snapshot.hasData) {
            children = Center(
              child: CircularProgressIndicator(),
            );
          } else {
            children = Container(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 2));
                },
                child: ListView.builder(
                  itemCount: snapshot?.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    Restaurant restaurant = snapshot?.data[index];
                    return ItemRestaurant(restaurant);
                  },
                ),
              ),
            );
          }
          return children;
        },
      ),
    );
  }
}
