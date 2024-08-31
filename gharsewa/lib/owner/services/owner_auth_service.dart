import 'dart:convert';
import 'package:gharsewa/constant/constant.dart';
import 'package:gharsewa/owner/models/login_model.dart';
import 'package:gharsewa/owner/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<OwnerRegisterRequestResponse> register(User user) async {
    final url = Uri.parse('$authURL/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return OwnerRegisterRequestResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', token);
  }

  Future<void> storeUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
  }

  Future<OwnerLoginRequestResponse> login(
      OwnerLoginRequest loginRequest) async {
    final url = Uri.parse('$authURL/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print("This is reesponse body: $responseData");
      final String token = responseData['accessToken'];
      final int userId =
          responseData['id']; // Assuming 'id' is the key for userId

      // Store token and userId
      await storeToken(token);
      await storeUserId(userId);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isOwnerLoggedIn', true);
      await prefs.setString('accessToken', responseData['accessToken']);
      await prefs.setString('refreshToken', responseData['refreshToken']);

      return OwnerLoginRequestResponse.fromJson(responseData);
    } else {
      return OwnerLoginRequestResponse(
        message: jsonDecode(response.body)['message'] ?? 'Failed to login',
        statusCode: response.statusCode,
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOwnerLoggedIn', false);
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
    await prefs.remove('userId'); // Remove userId on logout
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }
}
