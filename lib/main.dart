import 'package:flutter/material.dart';
import 'package:portfolio_elian_ortega/ui/screens/challenge_screen.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elian Ortega',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomeScreen.id: (_) => HomeScreen(),
        ChallengeScreen.id: (_) => ChallengeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
