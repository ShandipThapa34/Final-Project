import 'dart:convert';
import 'package:gharsewa/constant/constant.dart';
import 'package:gharsewa/user/models/user_login_model.dart';
import 'package:gharsewa/user/models/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<RegisterRequestResponse> register(User user) async {
    final url = Uri.parse('$authURL/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return RegisterRequestResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<LoginRequestResponse> login(LoginRequest loginRequest) async {
    final url = Uri.parse('$authURL/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isUserLoggedIn', true);
      await prefs.setString('accessToken', responseData['accessToken']);
      await prefs.setString('refreshToken', responseData['refreshToken']);
      return LoginRequestResponse.fromJson(responseData);
    } else {
      return LoginRequestResponse(
        message: jsonDecode(response.body)['message'] ?? 'Failed to login',
        statusCode: response.statusCode,
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLoggedIn', false);
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  // Future<String?> getAccessToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('accessToken');
  // }

  // Future<Map<String, String>> _getHeaders() async {
  //   final token = await getAccessToken();
  //   if (token == null) {
  //     throw Exception('No JWT token found');
  //   }
  //   return {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  // }
}
