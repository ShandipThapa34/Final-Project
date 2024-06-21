class OwnerLoginRequest {
  final String email;
  final String password;

  OwnerLoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class OwnerLoginRequestResponse {
  final String message;
  final int statusCode; // Updated to statusCode

  OwnerLoginRequestResponse({required this.message, required this.statusCode});

  factory OwnerLoginRequestResponse.fromJson(Map<String, dynamic> json) {
    return OwnerLoginRequestResponse(
      message: json['message'] ?? 'No message provided',
      statusCode:
          json['statusCode'] ?? 500, // Assuming default status code is 500
    );
  }
}
