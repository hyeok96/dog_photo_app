import 'package:dog_photo_app/model/dog_mode.dart';
import 'package:flutter/material.dart';

class DogImageItem extends StatelessWidget {
  const DogImageItem({
    super.key,
    required this.dog,
  });
  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(dog.message),
    );
  }
}
