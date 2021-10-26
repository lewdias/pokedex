class FlavorText {
  String flavorText;
  String language;

  FlavorText({
    required this.flavorText,
    required this.language,
  });

  factory FlavorText.fromJson(Map<String, dynamic> json) {
    return FlavorText(
      flavorText: json['flavor_text'],
      language: json['language']['name'],
    );
  }
}
