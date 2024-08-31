import 'dart:convert';
import 'package:gharsewa/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OwnerService {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    final token = await getToken();
    final userId = await getUserId();
    if (token == null) {
      print('no token found');
    }

    print("The token is : $token");
    print("The user id is : $userId");

    final url = Uri.parse('$roomURL/users/$userId');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<void> updateUserDetails(
      int userId, Map<String, dynamic> updatedData) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    print("the user Id is : $userId");

    final url = Uri.parse('$roomURL/user/update/$userId');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.patch(
      url,
      headers: headers,
      body: jsonEncode(updatedData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user details');
    }
  }
}
