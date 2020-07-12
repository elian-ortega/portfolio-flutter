import 'package:flutter/foundation.dart';

class Post {
  final String title;
  final String description;
  final String codepen;
  final String github;
  final List<String> imgesSources;

  const Post({
    @required this.imgesSources,
    @required this.title,
    @required this.description,
    @required this.codepen,
    @required this.github,
  });
}
