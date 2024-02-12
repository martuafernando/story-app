class StoryListRequest {
  final int? page;
  final int? size;
  final int? location;

  StoryListRequest({
    this.page,
    this.size,
    this.location,
  });
}

class StoryListResponse {
    final bool error;
    final String message;
    final List<StoryList> storyList;

    StoryListResponse({
        required this.error,
        required this.message,
        required this.storyList,
    });

    factory StoryListResponse.fromJson(Map<String, dynamic> json) => StoryListResponse(
        error: json["error"],
        message: json["message"],
        storyList: List<StoryList>.from(json["listStory"].map((x) => StoryList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "listStory": List<dynamic>.from(storyList.map((x) => x.toJson())),
    };
}

class StoryList {
    final String id;
    final String name;
    final String description;
    final String photoUrl;
    final DateTime createdAt;
    final double lat;
    final double lon;

    StoryList({
        required this.id,
        required this.name,
        required this.description,
        required this.photoUrl,
        required this.createdAt,
        required this.lat,
        required this.lon,
    });

    factory StoryList.fromJson(Map<String, dynamic> json) => StoryList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photoUrl": photoUrl,
        "createdAt": createdAt.toIso8601String(),
        "lat": lat,
        "lon": lon,
    };
}