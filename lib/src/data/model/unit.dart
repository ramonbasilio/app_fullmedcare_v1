class Unit {
  final String id;
  final String name;
  final String simbol;

  Unit({
    required this.id,
    required this.name,
    required this.simbol,
  });

  factory Unit.fromMap(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      name: json['name'],
      simbol: json['simbol'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'simbol': simbol,
    };
  }
}