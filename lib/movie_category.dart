class MovieCategory {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  double averageRating;
  int totalRatings;

  MovieCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    this.averageRating = 0.0,
    this.totalRatings = 0,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'description': description,
    'averageRating': averageRating,
    'totalRatings': totalRatings,
  };

  factory MovieCategory.fromJson(Map<String, dynamic> json) => MovieCategory(
    id: json['id'],
    name: json['name'],
    imageUrl: json['imageUrl'],
    description: json['description'],
    averageRating: json['averageRating'] ?? 0.0,
    totalRatings: json['totalRatings'] ?? 0,
  );

  void addRating(int newRating) {
    double totalScore = averageRating * totalRatings;
    totalRatings++;
    totalScore += newRating;
    averageRating = totalScore / totalRatings;
  }
}