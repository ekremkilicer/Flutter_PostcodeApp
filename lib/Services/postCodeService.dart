import 'dart:convert';

import 'package:http/http.dart';

import '../Models/postCodeModels.dart';

class PostCodeService {
  final String postsURL =
      "https://raw.githubusercontent.com/oguzhanmavii/postCodeApi/main/postCode.json";
  Future<List<PostCode>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<PostCode> posts = body
          .map(
            (dynamic item) => PostCode.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw "gonderilere ulaşilamadi !";
    }
  }
}
