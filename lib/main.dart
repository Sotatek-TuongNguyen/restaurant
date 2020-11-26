import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/app/combine_provider.dart';
import 'package:restaurant/restaurant/restaurant_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: CombineProvider.combine(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RestaurantScreen(),
    );
  }
}
