import 'dart:convert';
import 'package:gharsewa/constant/constant.dart';
import 'package:gharsewa/owner/models/property_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PropertyService {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }

  Future<void> createRoom(RoomRequest roomRequest) async {
    final token = await getToken();
    if (token == null) {
      print('no token found');
      return;
    }

    final url = Uri.parse('$roomURL/rooms');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(roomRequest.toJson()),
    );

    if (response.statusCode == 200) {
      print('Room created successfully');
    } else {
      print('Failed to create room: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }

  Future<List<OwnerRoom>> getAllRooms() async {
    final token = await getToken();
    if (token == null) {
      print('no token found');
    }

    final url = Uri.parse('$roomURL/rooms');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((room) => OwnerRoom.fromJson(room)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }
}
