class ItemTYpe {
  String id;
  String type;

  ItemTYpe({
    required this.id,
    required this.type,
  });

  factory ItemTYpe.fromJson(Map<String, dynamic> json) => ItemTYpe(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}
