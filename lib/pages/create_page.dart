import 'package:flutter/material.dart';
import 'package:flutter_advanced/service/auth_service.dart';
import 'package:flutter_advanced/service/rtdb_service.dart';

import '../model/post_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var isLoading = false;
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  _createPost() {
    String title = titleController.text.toString();
    String body = contentController.text.toString();
    if (title.isEmpty || body.isEmpty) return;

    _apiCreatePost(title, body);
  }

  _apiCreatePost(String title, String body) {
    setState(() {
      isLoading = true;
    });
    var post =
        Post(title: title, body: body, userId: AuthService.currentUserId());
    RTDBService.addPost(post).then((value) => {
          _resAddPost(),
        });
  }

  _resAddPost() {
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop({'data': 'done'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a post"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(hintText: "Body"),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    _createPost();
                  },
                  color: Colors.blue,
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
