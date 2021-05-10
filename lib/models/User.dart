import 'package:Boilerplate/utils/TextUtils.dart';

class User {
  int id;
  String name, email, avatarUrl;

  User(this.id, this.name, this.email, this.avatarUrl);

  static User fromJson(Map<String, dynamic> jsonObject) {
    int id = int.parse(jsonObject['id'].toString());

    String name = jsonObject['name'];
    String email = jsonObject['email'];
    String avatarUrl = jsonObject['avatar_url'];

    return User(id, name, email, avatarUrl);
  }

  static List<User> getListFromJson(List<dynamic> jsonArray) {
    List<User> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(User.fromJson(jsonArray[i]));
    }
    return list;
  }

  getAvatarUrl() {
    return TextUtils.getImageUrl(avatarUrl);
  }

  static String getPlaceholderImage(){
    return './assets/images/placeholder/no-product-image.png';
  }
}
