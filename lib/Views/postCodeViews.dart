import 'dart:io';

import 'package:flutter/material.dart';
import 'package:postcodeapp/Services/postCodeService.dart';

import '../Models/postCodeModels.dart';

class PostCodePage extends StatefulWidget {
  const PostCodePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PostCodePage> createState() => _PostCodePageState();
}

class _PostCodePageState extends State<PostCodePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PTT İSTANBUL"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: Image.asset("assets/images/ibb.png")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(
              onPressed: () {
                exit(0);
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Icon(Icons.cancel),
        backgroundColor: Colors.red,
      ),
    );
  }
}

FutureBuilder<List<PostCode>> _buildBody(BuildContext context) {
  final PostCodeService httpService = PostCodeService();
  return FutureBuilder<List<PostCode>>(
      future: httpService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<PostCode>? posts = snapshot.data;
          return _buildPosts(context, posts!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

ListView _buildPosts(BuildContext context, List<PostCode> posts) {
  return ListView.builder(
    itemCount: posts.length,
    padding: const EdgeInsets.all(8),
    itemBuilder: (context, index) {
      return Card(
        elevation: 4,
        child: ListTile(
          title: Text(posts[index].il!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(posts[index].ilce! +
              ":" +
              posts[index].mahalle! +
              "\n" +
              "Posta Kodu:" +
              posts[index].pk!),
          leading: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 16,
              child: Text(posts[index].plaka!.toString(),
                  style: const TextStyle(color: Colors.white))),
        ),
      );
    },
  );
}
