import 'package:financesok/scenes/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';


class HomePage extends StatelessWidget {

  final pages = [
    PageViewModel(
        pageColor: Colors.white,
        body: Text(
          'Ofrecemos resultados y te acompañamos en la interpretacion de Informes, para que tomes las mejores decisiones',
        ),
        title: Text(
          '',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black54, fontSize: 19),
        bubbleBackgroundColor: Colors.grey,
        mainImage: Image.asset(
          'assets/F1.png',
          height: 300.0,
          width: 300.0,
          alignment: Alignment.center,
        )
    ),
    PageViewModel(
        pageColor: Colors.white,
        body: Text(
          'Somos tu apoyo para que tu negocio crezca y permanezca en la Cima',
        ),
        title: Text(
          '',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black54, fontSize: 19),
        bubbleBackgroundColor: Colors.grey,
        mainImage: Image.asset(
          'assets/F2.png',
          height: 350.0,
          width: 350.0,
          alignment: Alignment.center,
        )
    ),
    PageViewModel(
        pageColor: Colors.white,
        body: Text(
          'Gestionamos tu tiempo, reinventamos tus proyectos, aprovechamos tus recursos',
        ),
        title: Text(
          '',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black54, fontSize: 19),
        bubbleBackgroundColor: Colors.grey,
        mainImage: Image.asset(
          'assets/F3.png',
          height: 300.0,
          width: 300.0,
          alignment: Alignment.center,
        )
    ),
    PageViewModel(
        pageColor: Colors.white,
        body: Text(
          'Planeamos y controlamos tus tareas para llevar tu negocio cada vez mas alto',
        ),
        title: Text(
          '',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black54, fontSize: 19),
        bubbleBackgroundColor: Colors.grey,
        mainImage: Image.asset(
          'assets/F4.png',
          height: 350.0,
          width: 350.0,
          alignment: Alignment.center,
        )
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intro',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Builder(builder: (context) => IntroViewsFlutter(
        pages,
        onTapDoneButton: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        pageButtonTextStyles: TextStyle(
            color: Colors.grey,
            fontSize: 18.0
        ),
      )
      ),
    );
  }

}
