class VendorModel {
  String? id;
  String? name;
  String? email;
  String? streetName;
  num? number;
  double? latitude;
  double? longitude;
  num? totalPrice;
  int? totalOrders;
  String? vendorImageUrl;

  VendorModel({
    required this.id,
    required this.email,
    required this.streetName,
    required this.totalOrders,
    required this.totalPrice,
    required this.vendorImageUrl,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.number,
  });

  // Convert a Vendor object into a map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'streetName': streetName,
      'email': email,
      'totalOrders': totalOrders,
      'totalPrice': totalPrice,
      'vendorImageUrl': vendorImageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'number': number,
    };
  }

  // Extract a Vendor object from a map object
  factory VendorModel.fromMap({required Map<String, dynamic> map}) {
    return VendorModel(
      id: map['id'] ?? '',
      streetName: map['streetName'] ?? '',
      email: map['email'] ?? '',
      totalOrders: map['totalOrders'] ?? '',
      totalPrice: map['totalPrice'] ?? '',
      vendorImageUrl: map['vendorImageUrl'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      name: map['name'] ?? '',
      number: map['number']?.toInt() ?? 0,
    );
  }
}
