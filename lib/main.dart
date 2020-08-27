import 'package:flutter/material.dart';
import 'package:guia_turistico/src/pages/continent.dart';
import 'package:guia_turistico/src/pages/listcity.dart';
import 'package:guia_turistico/src/pages/search.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/splash.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'splash': (context) => SplashPage(),
        'home': (context) => HomePage(),
        'search': (context) => SearchPage(),
        'continent': (context) => ContinentPage(),
        'listcity': (context) => ListCityPage()
      },
      initialRoute: 'splash',
    );
  }
}
