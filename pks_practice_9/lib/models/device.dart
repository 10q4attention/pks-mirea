class Device {
  final int id;
  final String description;
  final String title;
  final String imageUrl;
  final int price;

  Device({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['ID'],
      title: json['Name'],
      description: json['Description'],
      price: (json['Price'] as num).toInt(),
      imageUrl: json['ImageURL'],
    );
  }
}