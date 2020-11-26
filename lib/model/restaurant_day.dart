class RestaurantDays {
  final String id;
  final String restaurantId;
  final String type;
  final String open;
  final String close;

  RestaurantDays(
      {this.id, this.restaurantId, this.type, this.open, this.close});

  RestaurantDays.fromJson(Map<String, dynamic> jsonObject)
      : id = jsonObject['id'],
        restaurantId = jsonObject['restaurantId'],
        type = jsonObject['type'],
        close = jsonObject['close'],
        open = jsonObject['open'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'restaurantId': restaurantId,
        'type': type,
        'open': open,
        'close': close
      };
}
