import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            image: NetworkImage(
              post.imgesSources[1],
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            var height = constraints.maxHeight;
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: -10,
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: height - height / 3),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Spacer(),
                  Row(children: [
                    _IconTile(
                      title: 'Code',
                      awesomeIcon: FontAwesomeIcons.github,
                      url: post.github,
                    ),
                    _IconTile(
                      title: 'App',
                      awesomeIcon: FontAwesomeIcons.codepen,
                      url: post.codepen,
                    ),
                  ]),
                ],
              ),
            );
          },
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
    return GestureDetector(
      onTap: () => _launchURL(url),
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
