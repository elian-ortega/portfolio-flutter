import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../shared/colors.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({
    Key key,
    this.title = 'Flutter UI Showcase by Elian Ortega',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kAppBarColor,
      title: Row(
        children: [
          FlatButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(HomeScreen.id),
            child: Image.asset(
              'assets/images/flutter_logo.png',
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
