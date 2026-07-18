class FormulaModel {
  final String name;
  final Map<String, String> ingredients;

  FormulaModel({
    required this.name,
    required this.ingredients,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "ingredients": ingredients,
    };
  }

  factory FormulaModel.fromJson(Map<String, dynamic> json) {
    return FormulaModel(
      name: json["name"],
      ingredients: Map<String, String>.from(
        json["ingredients"],
      ),
    );
  }
}