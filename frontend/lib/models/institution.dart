class Institution {
  final String id;
  final String name;
  final String domain;

  Institution({
    required this.id,
    required this.name,
    required this.domain,
  });

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(
      id: json['id'],
      name: json['name'],
      domain: json['domain'],
    );
  }
}