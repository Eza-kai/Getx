import 'package:fgetx/app/data/models/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailView extends StatelessWidget {
  final Post post;

  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Post #${post.id}"),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[900],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  post.body,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "👤 User ID: ${post.userId}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.pink[400],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
