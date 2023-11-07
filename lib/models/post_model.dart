class PostModel
{
  late String username;
  late String uId;
  late String dateTime;
  late String postImage;
  late String image;
  late String text;

  PostModel({
    required this.dateTime,
    required this.username,
    required this.text,
    required this.uId,
    required this.image,
    required this.postImage,
  });

  PostModel.fromJson(Map<String,dynamic> json)
  {
    postImage = json['postImage'];
    username = json['username'];
    text = json['text'];
    uId = json['uId'];
    dateTime = json['dateTime'];
    image = json['image'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'postImage': postImage,
        'username': username,
        'text': text,
        'uId': uId,
        'dateTime': dateTime,
        'image': image,
      };
  }

}