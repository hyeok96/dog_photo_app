import 'package:dio/dio.dart';
import 'package:dog_photo_app/model/dog_mode.dart';
import 'package:dog_photo_app/widget/dog_image_item.dart';

import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({super.key});
  var dio = Dio();

  // https://dog.ceo/api/breeds/image/random

  Future<DogModel?> getData() async {
    var res = await dio.get("https://dog.ceo/api/breeds/image/random");
    if (res.statusCode == 200) {
      var result = DogModel.fromMap(res.data);
      return result;
    }
    return null;
  }

  void _onTabDogImage(BuildContext context, DogModel dog) {
    showDialog(
        context: context,
        builder: (context) {
          return DogImageItem(dog: dog);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data?.message == null
                    ? Container()
                    : GestureDetector(
                        onTap: () => _onTabDogImage(context, snapshot.data!),
                        child: Image.network(
                          snapshot.data!.message,
                          fit: BoxFit.cover,
                        ),
                      );
              }
              return const CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
