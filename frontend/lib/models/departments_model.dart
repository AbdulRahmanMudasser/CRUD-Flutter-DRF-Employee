class DepartmentsModel {
  final int id;
  final String name;

  DepartmentsModel({required this.id, required this.name});

  // From Json
  factory DepartmentsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentsModel(
      id: json['id'],
      name: json['name'],
    );
  }

  // To Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
