class Country {
  String flagLink;
  String nameCommon;
  String nameOfficial;
  String capital;
  String region;
  String languageNno;
  String languageNob;
  String languageSmi;
  int population;

  Country({
    required this.flagLink,
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.region,
    required this.languageNno,
    required this.languageNob,
    required this.languageSmi,
    required this.population,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flagLink: json['flags']['png'],
      nameCommon: json['name']['common'],
      nameOfficial: json['name']['official'],
      capital: json['capital'][0],
      region: json['region'],
      languageNno: json['languages']['nno'] ?? '',
      languageNob: json['languages']['nob'] ?? '',
      languageSmi: json['languages']['smi'] ?? '',
      population: json['population'],
    );
  }
}
