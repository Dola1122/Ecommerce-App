import 'package:ecommerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageData extends GetxController {
  final String _userKey = 'user';

  Future<void> setUser(UserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userJson = jsonEncode(userModel.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString(_userKey);
    if (userJson != null) {
      final Map<String, dynamic> userData = jsonDecode(userJson);
      return UserModel.fromJson(userData);
    }
    return null;
  }

  Future<void> deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
