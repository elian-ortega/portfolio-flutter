import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../shared/colors.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/post_widget.dart';

enum ScreenType { Desktop, Tablet, Mobile }

class HomeScreen extends StatefulWidget {
  static const String id = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBar(),
      ),
      body: _BuildBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _launchURL();
      }),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/elian-ortega/ui-design-challenge';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _BuildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 650) {
      return _MobileBody();
    } else if (width < 1024) {
      return _TabletBody();
    }
    return _DesktopBody();
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(index: index);
        },
      ),
    );
  }
}

class _TabletBody extends StatelessWidget {
  const _TabletBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(index: index);
        },
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 2 / 3,
            child: PostWidget(index: index),
          );
        },
      ),
    );
  }
}
