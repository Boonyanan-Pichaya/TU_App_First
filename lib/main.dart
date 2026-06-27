import 'package:first_app/models/login_model.dart';
import 'package:first_app/models/userpref_model.dart';
import 'package:first_app/pages/00_GridPage.dart';
import 'package:first_app/pages/01_MyHomePage.dart';
import 'package:first_app/pages/02_ListPage.dart';
import 'package:first_app/pages/03_FormPage.dart';
import 'package:first_app/pages/04_form_two_page.dart';
import 'package:first_app/pages/05.Chosecardpage.dart';
import 'package:first_app/pages/99_BlankPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => UserPrefernceModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 183, 131),
        ),
      ),

      initialRoute: '/0',
      routes: {
        '/0': (context) => GridPage(),
        '/1': (context) => MyHomePage(title: "Home - Pichaya"),
        '/2': (context) => ListPage(),
        '/3': (context) => FormPage(),
        '/4': (context) => FormTwoPage(),
        '/5': (context) => ChoosecardPage(),
        '/6': (context) => BlankPage(),
      },
    );
  }
}
