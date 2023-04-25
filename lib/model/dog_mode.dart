class DogModel {
  String message;
  String status;

  DogModel({required this.message, required this.status});

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      message: map["message"],
      status: map["status"],
    );
  }
}


// 2번
// class DogModel {
//   String message;
//   String status;

//   DogModel.fromJson(Map<String, dynamic> map)
//       : message = map["message"],
//         status = map["status"];
// }
