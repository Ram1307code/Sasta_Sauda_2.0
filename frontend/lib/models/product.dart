class Product {
  final String id;
  final String name;
  final String description;
  final String category;
  final double farmerPrice;
  final double marketPrice;
  final String imageUrl;
  final String farmerId;
  final String farmerName;
  final String unit; // kg, quintal, dozen, etc.
  final int stockQuantity;
  final DateTime listedDate;
  bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.farmerPrice,
    required this.marketPrice,
    required this.imageUrl,
    required this.farmerId,
    required this.farmerName,
    required this.unit,
    required this.stockQuantity,
    required this.listedDate,
    this.isAvailable = true,
  });

  double get discount {
    if (marketPrice > 0) {
      return ((marketPrice - farmerPrice) / marketPrice) * 100;
    }
    return 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'farmerPrice': farmerPrice,
      'marketPrice': marketPrice,
      'imageUrl': imageUrl,
      'farmerId': farmerId,
      'farmerName': farmerName,
      'unit': unit,
      'stockQuantity': stockQuantity,
      'listedDate': listedDate.toIso8601String(),
      'isAvailable': isAvailable,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      farmerPrice: json['farmerPrice'].toDouble(),
      marketPrice: json['marketPrice'].toDouble(),
      imageUrl: json['imageUrl'],
      farmerId: json['farmerId'],
      farmerName: json['farmerName'],
      unit: json['unit'],
      stockQuantity: json['stockQuantity'],
      listedDate: DateTime.parse(json['listedDate']),
      isAvailable: json['isAvailable'] ?? true,
    );
  }
}
