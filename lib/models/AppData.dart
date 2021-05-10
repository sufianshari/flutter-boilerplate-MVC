
import 'User.dart';


class AppData{


  final int BUILD_VERSION = 130;


  int minBuildVersion;
  User user;

  AppData(this.minBuildVersion,this.user);

  static AppData fromJson(Map<String, dynamic> jsonObject){
    int minBuildVersion = int.parse(jsonObject['min_build_version'].toString());

    User user;
    if(jsonObject['user']!=null){
      user = User.fromJson(jsonObject['user']);
    }

    return AppData(minBuildVersion,user);
  }

  bool isAppUpdated(){
    return BUILD_VERSION >= minBuildVersion;
  }

  @override
  String toString() {
    return 'AppData{BUILD_VERSION: $BUILD_VERSION, minBuildVersion: $minBuildVersion, user: $user}';
  }
}