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

  static Future<void> setSecuredBool(String key, bool value) async {
    await _flutterSecureStorage.write(key: key, value: value.toString());
  }

  static Future<bool> getSecuredBool(String key) async {
    final value = await _flutterSecureStorage.read(key: key);
    return value?.toLowerCase() == 'true';
  }

  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
    // ✅ إنشاء نسخة احتياطية في SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    if (key == AppSharedKeys.userToken) {
      await prefs.setString(AppSharedKeys.userTokenBackup, value);
    }
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

  static Future<void> setDriverStatus(int status) async {
    await _flutterSecureStorage.write(
      key: AppSharedKeys.driverStatusKey,
      value: status.toString(), // 0 / 1 / 2
    );
  }

  static Future<int> getDriverStatus() async {
    final value = await _flutterSecureStorage.read(
      key: AppSharedKeys.driverStatusKey,
    );

    return int.tryParse(value ?? '0') ?? 0;
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

  // static getSecuredString(String key) async {
  //   //  const flutterSecureStorage = FlutterSecureStorage();
  //   debugPrint('FlutterSecureStorage : getSecuredString with key :');
  //   return await _flutterSecureStorage.read(key: key) ?? '';
  // }

  /// قراءة قيمة مؤمنة
  static Future<String> getSecuredString(String key) async {
    String? value = await _flutterSecureStorage.read(key: key);
    if (value == null || value.isEmpty) {
      // إذا اختفت القيمة المؤمنة، استرجع من النسخة الاحتياطية
      final prefs = await SharedPreferences.getInstance();
      value = prefs.getString(AppSharedKeys.userTokenBackup) ?? '';
      if (value.isNotEmpty && key == AppSharedKeys.userToken) {
        // إعادة حفظها في التخزين الآمن
        await _flutterSecureStorage.write(key: key, value: value);
      }
    }
    return value;
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

  // =======================
  // 🔐 Secure String List
  // =======================

  static Future<void> setSecuredStringList(
    String key,
    List<String> value,
  ) async {
    try {
      final encoded = jsonEncode(value);
      await _flutterSecureStorage.write(key: key, value: encoded);
      debugPrint('Secure list saved for key: $key => $value');
    } catch (e) {
      debugPrint('Error saving secured string list: $e');
    }
  }

  static Future<List<String>?> getSecuredStringList(String key) async {
    try {
      final encoded = await _flutterSecureStorage.read(key: key);

      if (encoded == null || encoded.isEmpty) {
        return null;
      }

      final List<dynamic> decoded = jsonDecode(encoded);

      return decoded.cast<String>();
    } catch (e) {
      debugPrint('Error reading secured string list: $e');
      return null;
    }
  }
}
