import 'package:flutter/material.dart';
import 'package:flutter_map/providers/info_provider.dart';
import 'package:flutter_map/providers/offices_Provider.dart';
import 'package:flutter_map/screens/home_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OfficesProvider>(
          create: (context) => OfficesProvider(),
        ),
        ChangeNotifierProvider<InfoWindowModel>(
          create: (context) => InfoWindowModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Map Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
