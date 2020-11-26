// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantStore on _RestaurantStore, Store {
  final _$pageAtom = Atom(name: '_RestaurantStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$limitAtom = Atom(name: '_RestaurantStore.limit');

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  final _$listRestaurantsAtom = Atom(name: '_RestaurantStore.listRestaurants');

  @override
  ObservableList<Restaurant> get listRestaurants {
    _$listRestaurantsAtom.reportRead();
    return super.listRestaurants;
  }

  @override
  set listRestaurants(ObservableList<Restaurant> value) {
    _$listRestaurantsAtom.reportWrite(value, super.listRestaurants, () {
      super.listRestaurants = value;
    });
  }

  final _$getListRestaurantAsyncAction =
      AsyncAction('_RestaurantStore.getListRestaurant');

  @override
  Future<List<Restaurant>> getListRestaurant([BuildContext context]) {
    return _$getListRestaurantAsyncAction
        .run(() => super.getListRestaurant(context));
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
listRestaurants: ${listRestaurants}
    ''';
  }
}
