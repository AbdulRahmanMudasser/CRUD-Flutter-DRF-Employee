class SkillsModel {
  final int id;
  final String name;

  SkillsModel({required this.id, required this.name});

  // From Json
  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    return SkillsModel(
      id: json['id'],
      name: json['name'],
    );
  }

  // To Json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
