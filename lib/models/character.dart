class Character {
  final String title;
  final String icon;
  final String description;

  Character({
    required this.title,
    required this.icon,
    required this.description,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      title: json['Title'] ?? '',
      icon: json['Icon'] ?? '',
      description: json['Description'] ?? '',
    );
  }
}
