class Post {
  int? id;
  String? title;
  String? body;
  String? img_url;
  String? userId;

  Post({this.id, this.title, this.body, this.img_url, this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        img_url = json['img_url'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'img_url': img_url,
        'userId': userId,
      };
}
