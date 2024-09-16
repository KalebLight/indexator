class AddUrlResponse {
  final String url;
  final int userId;
  final int id;

  AddUrlResponse({
    required this.url,
    required this.userId,
    required this.id,
  });

  factory AddUrlResponse.fromMap(Map<String, dynamic> json) => AddUrlResponse(
        url: json["url"],
        id: json["id"],
        userId: json["user_id"],
      );
}
