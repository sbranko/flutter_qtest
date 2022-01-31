import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meritas/models/comment/comment.dart';

/// List item representing a single Character with its photo and name.
class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    required this.character,
    Key? key,
  }) : super(key: key);

  final Comment character;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(character.id.toString()),
          Text(character.postId.toString()),
          Text(character.email.toString()),
          SizedBox(child: Text(character.body.toString())),
        ],
      );
}
