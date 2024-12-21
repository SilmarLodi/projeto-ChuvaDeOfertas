class Offer {
  final int id;
  final String name;
  final double price;
  final String supermarket;

  Offer({
    required this.id,
    required this.name,
    required this.price,
    required this.supermarket,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      supermarket: json['supermarket'],
    );
  }
}
