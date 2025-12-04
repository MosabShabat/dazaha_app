import 'dart:convert';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/auth/user_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedData {
  AppSharedData._();

  static const FlutterSecureStorage _flutterSecureStorage =
      FlutterSecureStorage();

  // Instance of SharedPreferences
  static Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }

  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<bool> isUserLogin() async {
    try {
      final token = await _flutterSecureStorage.read(
        key: AppSharedKeys.userToken,
      );
      return token != null && token.isNotEmpty;
    } catch (e) {
      debugPrint('Error checking user login status: $e');
      return false;
    }
  }

  // static Future<bool> isUserLogin() async {
  //   try {
  //     final prefs = await _getSharedPreferences();
  //     return prefs.getBool(AppSharedKeys.isUserLoggedInKey) ?? false;
  //   } catch (e) {
  //     debugPrint('Error checking user login status: $e');
  //     return false;
  //   }
  // }

  static Future<bool> isOpenBefore() async {
    try {
      final value = await _flutterSecureStorage.read(
        key: AppSharedKeys.isOpenBeforeKey,
      );
      return value == "true";
    } catch (e) {
      debugPrint('Error checking openBefore: $e');
      return false;
    }
  }

  // static Future<bool> isOpenBefore() async {
  //   try {
  //     final prefs = await _getSharedPreferences();
  //     return prefs.getBool(AppSharedKeys.isOpenBeforeKey) ?? false;
  //   } catch (e) {
  //     debugPrint('Error checking user login status: $e');
  //     return false;
  //   }
  // }

  static getSecuredString(String key) async {
    //  const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await _flutterSecureStorage.read(key: key) ?? '';
  }

  // Save user login status

  static Future<void> setUserLogin(bool isLoggedIn) async {
    try {
      await _flutterSecureStorage.write(
        key: AppSharedKeys.isUserLoggedInKey,
        value: isLoggedIn.toString(),
      );
      debugPrint('User login status saved: $isLoggedIn');
    } catch (e) {
      debugPrint('Error saving user login status: $e');
    }
  }

  // static Future<void> setUserLogin(bool isLoggedIn) async {
  //   try {
  //     final prefs = await _getSharedPreferences();
  //     await prefs.setBool(AppSharedKeys.isUserLoggedInKey, isLoggedIn);
  //     debugPrint('User login status saved: $isLoggedIn');
  //   } catch (e) {
  //     debugPrint('Error saving user login status: $e');
  //   }
  // }

  static UserData? currentUserInfo;

  static Future<void> setUserInfo(UserData user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await _flutterSecureStorage.write(
        key: AppSharedKeys.userData,
        value: userJson,
      );
      // Cache the user info
      currentUserInfo = user;
      debugPrint('User info saved and cached: $userJson');
    } catch (e) {
      debugPrint('Error saving user info: $e');
    }
  }

  // Remove all keys and values from SharedPreferences
  static Future<void> clearAllData() async {
    try {
      final prefs = await _getSharedPreferences();
      await prefs.clear();
      debugPrint('All SharedPreferences data cleared.');
    } catch (e) {
      debugPrint('Error clearing all SharedPreferences data: $e');
    }
  }

  // Remove all keys and values from FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    try {
      await _flutterSecureStorage.deleteAll();
      debugPrint('All secure storage data cleared.');
    } catch (e) {
      debugPrint('Error clearing all secure storage data: $e');
    }
  }

  // Save user openBefore status

  static Future<void> setOpenBefore(bool isOpenBefore) async {
    try {
      await _flutterSecureStorage.write(
        key: AppSharedKeys.isOpenBeforeKey,
        value: isOpenBefore.toString(),
      );
    } catch (e) {
      debugPrint('Error saving openBefore status: $e');
    }
  }

  // static Future<void> setOpenBefore(bool isOpenBefore) async {
  //   try {
  //     final prefs = await _getSharedPreferences();
  //     await prefs.setBool(AppSharedKeys.isOpenBeforeKey, isOpenBefore);
  //     debugPrint('User login status saved: $isOpenBefore');
  //   } catch (e) {
  //     debugPrint('Error saving user login status: $e');
  //   }
  // }

  // Retrieve UserData from cache or FlutterSecureStorage
  static Future<UserData?> getUserInfo() async {
    if (currentUserInfo != null) {
      return currentUserInfo; // Return cached data
    }
    try {
      final userJson = await _flutterSecureStorage.read(
        key: AppSharedKeys.userData,
      );
      if (userJson != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        currentUserInfo = UserData.fromJson(userMap); // Cache the data
        return currentUserInfo;
      }
      return null;
    } catch (e) {
      debugPrint('Error retrieving user info: $e');
      return null;
    }
  }

  // Remove specific key and value from FlutterSecureStorage
  static Future<void> removeSecuredData(String key) async {
    try {
      await _flutterSecureStorage.delete(key: key);
      debugPrint('Secure storage data for key $key removed.');
    } catch (e) {
      debugPrint('Error removing secure storage data for key $key: $e');
    }
  }
}
