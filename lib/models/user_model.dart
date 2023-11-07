class UserModel
{
  late String username;
  late String email;
  late String uId;
  late String phone;
  late String bio;
  late String image;
  late String cover;

  UserModel({
    required this.email,
    required this.username,
    required this.phone,
    required this.uId,
    required this.image,
    required this.bio,
    required this.cover,
  });

  UserModel.fromJson(Map<String,dynamic> json)
  {
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    uId = json['uId'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'email': email,
        'username': username,
        'phone': phone,
        'uId': uId,
        'bio': bio,
        'image': image,
        'cover': cover,
      };
  }

}