import 'package:financesok/scenes/home/HomePage.dart';
import 'package:financesok/scenes/login/LoginPage.dart';
import 'package:financesok/trans/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder> {
        '/' : (BuildContext contex) => HomePage(),
        '/login': (BuildContext contex) => LoginPage()
      },
      localizationsDelegates: [
        TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FallbackCupertinoLocalisationsDelegate(),
      ],
      supportedLocales: [
         Locale('zh', 'CH'),
         Locale('en', 'US'),
      ],
    );
  }
}
