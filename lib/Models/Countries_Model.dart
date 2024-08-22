//models country,languges ,native names
class Country {
  String flagLink;
  String nameCommon;
  String nameOfficial;
  Map<String, NativeName> nativeNames;
  String capital;
  String region;
  Map<String, Language> languages;
  int population;

  Country({
    required this.flagLink,
    required this.nameCommon,
    required this.nameOfficial,
    required this.nativeNames,
    required this.capital,
    required this.region,
    required this.languages,
    required this.population,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flagLink: json['flags']['png'],
      nameCommon: json['name']['common'],
      nameOfficial: json['name']['official'],
      nativeNames: (json['name']['nativeName'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, NativeName.fromJson(value))),
      capital: json['capital'][0],
      region: json['region'],
      languages: (json['languages'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, Language.fromJson(key, value))),
      population: json['population'],
    );
  }
}

class NativeName {
  String official;
  String common;

  NativeName({
    required this.official,
    required this.common,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) {
    return NativeName(
      official: json['official'],
      common: json['common'],
    );
  }
}

class Language {
  String code;
  String name;

  Language({
    required this.code,
    required this.name,
  });

  factory Language.fromJson(String code, String name) {
    return Language(
      code: code,
      name: name,
    );
  }
}
