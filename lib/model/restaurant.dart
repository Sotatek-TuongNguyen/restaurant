class Restaurant {
  final String id;
  final String title;
  final String thumb;
  final List days;

  Restaurant({this.id, this.title, this.thumb, this.days});

  Restaurant.fromJson(Map<String, dynamic> jsonObject)
      : id = jsonObject['id'],
        title = jsonObject['title'],
        thumb = jsonObject['thumb'],
        days = jsonObject['days'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'thumb': thumb, 'days': days};
}
