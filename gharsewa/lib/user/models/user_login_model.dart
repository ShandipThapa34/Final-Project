class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class LoginRequestResponse {
  final String message;
  final int statusCode; // Updated to statusCode

  LoginRequestResponse({required this.message, required this.statusCode});

  factory LoginRequestResponse.fromJson(Map<String, dynamic> json) {
    return LoginRequestResponse(
      message: json['message'] ?? 'No message provided',
      statusCode:
          json['statusCode'] ?? 500, // Assuming default status code is 500
    );
  }
}
