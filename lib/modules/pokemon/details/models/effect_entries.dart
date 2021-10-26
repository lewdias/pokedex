class EffectEntries {
  String effect;
  String shortEffect;
  String language;

  EffectEntries({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  factory EffectEntries.fromJson(Map<String, dynamic> json) {
    return EffectEntries(
      effect: json['effect'],
      shortEffect: json['short_effect'],
      language: json['language']['name'],
    );
  }
}
