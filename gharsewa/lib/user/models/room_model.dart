class Room {
  final int id;
  final String roomNumber;
  final String roomType;
  final double price;
  final String description;
  final bool availability;
  final int maxOccupancy;
  final List<String> images;
  final List<String> amenities;
  final String createdDate;
  final String updatedDate;
  final String address;

  Room({
    required this.id,
    required this.roomNumber,
    required this.roomType,
    required this.price,
    required this.description,
    required this.availability,
    required this.maxOccupancy,
    required this.images,
    required this.amenities,
    required this.createdDate,
    required this.updatedDate,
    required this.address,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomNumber: json['room_number'],
      roomType: json['room_type'],
      price: json['price'].toDouble(),
      description: json['description'],
      availability: json['availability'],
      maxOccupancy: json['max_occupancy'],
      images: List<String>.from(json['images']),
      amenities: List<String>.from(json['amenities']),
      createdDate: json['created_date'],
      updatedDate: json['updated_date'],
      address: json['address'],
    );
  }
}
