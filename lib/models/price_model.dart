class PriceModel {
  PriceModel({
    required this.id,
    required this.priceTypeId,
    required this.price,
    required this.sale,
    required this.isActive,
  });

  int? id;
  int? priceTypeId;
  int? price;
  int? sale;
  int? isActive;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        id: json["id"],
        priceTypeId: json["price_type_id"],
        price: json["price"],
        sale: json["sale"],
        isActive: json["is_active"],
      );
}
