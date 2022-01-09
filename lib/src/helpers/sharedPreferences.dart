/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:01:47 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:01:47 
 */
// ignore_for_file: file_names, avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final String _isFirstOpen = "firstOpen";
  final String _token = "token";

  Future<bool> setIsFirstOpen(String first) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_isFirstOpen, first);
    print('First Open ' + res.toString());
    return res;
  }

  Future<String> getIsFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String res = prefs.getString(_isFirstOpen) ?? 'oui';
    print('First Open ' + res.toString());
    return res;
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_token, token);
    print('Token ' + res.toString());
    return res;
  }

  Future<bool> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.remove(_token);
    print('Token ' + res.toString());
    return res;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? res = prefs.getString(_token);
    print('Token ' + res.toString());
    return res;
  }
}
