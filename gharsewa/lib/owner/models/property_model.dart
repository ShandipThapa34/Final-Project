class RoomRequest {
  final String roomNumber;
  final String roomType;
  final String price;
  final String description;
  final bool availability;
  final String maxOccupancy;
  final List<String> images;
  final Map<String, dynamic> amenities;
  final String address;

  RoomRequest({
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

  Map<String, dynamic> toJson() => {
        'roomNumber': roomNumber,
        'roomType': roomType,
        'price': price,
        'description': description,
        'availability': availability,
        'maxOccupancy': maxOccupancy,
        'images': images,
        'amenities': amenities,
        'address': address,
      };
}

class OwnerRoom {
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

  OwnerRoom({
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

  factory OwnerRoom.fromJson(Map<String, dynamic> json) {
    return OwnerRoom(
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
