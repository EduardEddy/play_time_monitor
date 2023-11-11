class GuestsAtraction {
  final int id;
  final String childFullname;
  final String childDescription;
  final String parentFullname;
  final String cellphone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String entryTime;
  final String departureTime;
  final bool isActive;
  final int guestAttractionId;

  GuestsAtraction({
    required this.id,
    required this.childFullname,
    required this.childDescription,
    required this.parentFullname,
    required this.cellphone,
    required this.createdAt,
    required this.updatedAt,
    required this.entryTime,
    required this.departureTime,
    required this.isActive,
    required this.guestAttractionId,
  });

  factory GuestsAtraction.fromJson(Map<String, dynamic> json) =>
      GuestsAtraction(
          id: json["id"],
          childFullname: json["child_fullname"],
          childDescription: json["child_description"],
          parentFullname: json["parent_fullname"],
          cellphone: json["cellphone"],
          createdAt: DateTime.parse(json["created_at"]),
          updatedAt: DateTime.parse(json["updated_at"]),
          entryTime: json["entry_time"],
          departureTime: json["departure_time"],
          isActive: json["is_active"] == 1 ? true : false,
          guestAttractionId: json['guest_attraction_id']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "child_fullname": childFullname,
        "child_description": childDescription,
        "parent_fullname": parentFullname,
        "cellphone": cellphone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "entry_time": entryTime,
        "departure_time": departureTime,
        "is_active": isActive,
        "guest_attraction_id": guestAttractionId
      };
}
