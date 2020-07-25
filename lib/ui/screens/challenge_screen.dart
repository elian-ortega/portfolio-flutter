import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_elian_ortega/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/post.dart';
import '../widgets/my_app_bar.dart';

class ChallengeScreen extends StatelessWidget {
  static const String id = '/challenge';

  const ChallengeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context).settings.arguments;
    final Post selectedPost = index == null ? posts[0] : posts[index];
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: MyAppBar(
          title: selectedPost.title,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * .1),
        child: Column(
          children: [
            Container(
              height: screenSize.height * .6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 2 / 4,
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0, bottom: 10.0),
                      child: Image.network(
                        selectedPost.imgesSources[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: selectedPost.imgesSources.length,
              ),
            ),
            SizedBox(height: 20.0),
            Row(children: [
              _IconTile(
                title: 'Code',
                awesomeIcon: FontAwesomeIcons.github,
                url: selectedPost.github,
              ),
              selectedPost.codepen.isNotEmpty
                  ? _IconTile(
                      title: 'App',
                      awesomeIcon: FontAwesomeIcons.codepen,
                      url: selectedPost.codepen,
                    )
                  : SizedBox(),
            ]),
          ],
        ),
      ),
    );
  }
}

class _IconTile extends StatelessWidget {
  final String title;
  final IconData awesomeIcon;
  final String url;

  const _IconTile({Key key, this.title, this.awesomeIcon, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => _launchURL(url),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(awesomeIcon),
              SizedBox(width: 5.0),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
