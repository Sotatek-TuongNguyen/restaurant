import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/model/restaurant.dart';
import 'package:restaurant/restaurant/item_restaurant.dart';
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
                      String id = snapshot?.data[index]?.id;
                      String title = snapshot?.data[index]?.title;
                      String thumb = snapshot?.data[index]?.thumb;
                      List days = snapshot?.data[index]?.days;
                      return ItemRestaurant(id, title, thumb, days);
                    },
                  ),
                ),
              );
            }
            return children;
          },
        ));
  }
}
