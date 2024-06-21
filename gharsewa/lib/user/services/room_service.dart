import 'dart:convert';
import 'package:gharsewa/constant/constant.dart';
import 'package:gharsewa/user/models/room_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RoomService {
  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> _clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<List<Room>> getAllRooms() async {
    try {
      String? token = await _getToken();
      if (token == null) {
        throw Exception('Token is null');
      }

      final response = await http.get(
        Uri.parse('$roomURL/rooms'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        return list.map((model) => Room.fromJson(model)).toList();
      } else if (response.statusCode == 401) {
        // Handle unauthorized (e.g., token expired)
        await _clearToken();
        throw Exception('Unauthorized');
      } else {
        throw Exception('Failed to load rooms: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load rooms: $e');
    }
  }
}
