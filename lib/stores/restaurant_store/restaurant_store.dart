import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant/model/restaurant.dart';
import 'package:restaurant/repository/network/network.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStore with _$RestaurantStore;

abstract class _RestaurantStore with Store {
  @observable
  int page = 0;

  @observable
  int limit = 10;

  @observable
  ObservableList<Restaurant> listRestaurants;

  @action
  Future<List<Restaurant>> getListRestaurant([BuildContext context]) async {
    List<Restaurant> result = List<Restaurant>();
    try {
      var response = await Network.fetchData();
      Iterable list = json.decode(response)['restaurants'];
      result = list.map((model) => Restaurant.fromJson(model)).toList();
    } catch (exception) {
      print('getListRestaurant exception = ' + exception.toString());
    }
    return result;
  }
}
