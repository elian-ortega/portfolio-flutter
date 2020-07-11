import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { Desktop, Tablet, Mobile }
final numbers = [1, 2, 3, 4, 5, 6, 7, 8];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _screenType = ScreenType.Desktop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _BuildBody(),
      ),
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
    print('built Desktop');
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blue,
          child: Center(
            child: Text('${numbers[index]}'),
          ),
        );
      },
    );
  }
}

class _TabletBody extends StatelessWidget {
  const _TabletBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('built Tablet');

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blue,
          child: Center(
            child: Text('${numbers[index]}'),
          ),
        );
      },
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 3 / 2,
          child: Card(
            color: Colors.blue,
            child: Center(
              child: Text('${numbers[index]}'),
            ),
          ),
        );
      },
    );
  }
}
