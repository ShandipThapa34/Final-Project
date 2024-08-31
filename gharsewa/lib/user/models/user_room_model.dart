class UserRoom {
  final int id;
  final String roomNumber;
  final String roomType;
  final String price;
  final String description;
  final bool availability;
  final String maxOccupancy;
  final List<String> images;
  final Map<String, bool> amenities;
  final String address;

  UserRoom({
    required this.id,
    required this.roomNumber,
    required this.roomType,
    required this.price,
    required this.description,
    required this.availability,
    required this.maxOccupancy,
    required this.images,
    required this.amenities,
    required this.address,
  });

  factory UserRoom.fromJson(Map<String, dynamic> json) {
    return UserRoom(
      id: json['id'],
      roomNumber: json['roomNumber'],
      roomType: json['roomType'],
      price: json['price'],
      description: json['description'],
      availability: json['availability'],
      maxOccupancy: json['maxOccupancy'],
      images: List<String>.from(json['images']),
      amenities: Map<String, bool>.from(json['amenities']),
      address: json['address'],
    );
  }
}
