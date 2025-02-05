import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // method to store the user name and email in shared preferences
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // create an instance of shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // sotre the user name and email as key value pairs
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      // show an alert message if the user name and email are stored successfully
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Your data stored successfully"),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (error) {
      error.toString();
    }
  }

  // method to check whether the username  is save in the shared pref
  static Future<bool> checkUsername() async {
    // create an instance for shred preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString("username");
    return username != null;
  }
}
