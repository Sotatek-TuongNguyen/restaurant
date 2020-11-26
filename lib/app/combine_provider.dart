import 'package:provider/provider.dart';
import 'package:restaurant/stores/restaurant_store/restaurant_store.dart';

class CombineProvider {
  static List<Provider> combine() {
    return [
      Provider<RestaurantStore>(create: (_) => RestaurantStore()),
    ];
  }
}
