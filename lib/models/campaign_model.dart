class CampaignModel {
  final int? id;
  final int? user_id;
  final int? campaign_type_id;
  final int? campaign_category_id;
  final String? link;
  final int? current_views;
  final int? current_subscribes;
  final int? watch_time;
  final int? number_of_subscribes;
  final String? method_payment;
  final int? price;
  final int? discount;
  final int? total;

  CampaignModel(
      {required this.id,
      required this.user_id,
      required this.campaign_type_id,
      required this.campaign_category_id,
      required this.link,
      required this.current_views,
      required this.current_subscribes,
      required this.watch_time,
      required this.number_of_subscribes,
      required this.method_payment,
      required this.price,
      required this.discount,
      required this.total});

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
        id: json['id'],
        user_id: json['user_id'],
        campaign_type_id: json['campaign_type_id'],
        campaign_category_id: json['campaign_category_id'],
        link: json['link'],
        current_views: json['current_views'],
        current_subscribes: json['current_subscribes'],
        watch_time: json['watch_time'],
        number_of_subscribes: json['number_of_subscribes'],
        method_payment: json['method_payment'],
        price: json['price'],
        discount: json['discount'],
        total: json['total']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "campaign_type_id": campaign_type_id,
        "campaign_category_id": campaign_category_id,
        "link": link,
        "current_views": current_views,
        "current_subscribes": current_subscribes,
        "watch_time": watch_time,
        "number_of_subscribes": number_of_subscribes,
        "method_payment": method_payment,
        "price": price,
        "discount": discount,
        "total": total,
      };
}
