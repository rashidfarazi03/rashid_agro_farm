import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/default_formulas.dart';
import '../widgets/ingredient_row.dart';
import '../widgets/result_card.dart';
class FeedCalculatorScreen extends StatefulWidget {
  const FeedCalculatorScreen({super.key});

  @override
  State<FeedCalculatorScreen> createState() =>
      _FeedCalculatorScreenState();
}

class _FeedCalculatorScreenState extends State<FeedCalculatorScreen> {

String selectedFeedType = "Broiler";
String selectedFormula = "Starter";
final wheatQtyController = TextEditingController();
final wheatPriceController = TextEditingController();

final riceQtyController = TextEditingController();
final ricePriceController = TextEditingController();

final cornQtyController = TextEditingController();
final cornPriceController = TextEditingController();

final soybeanQtyController = TextEditingController();
final soybeanPriceController = TextEditingController();

final mustardQtyController = TextEditingController();
final mustardPriceController = TextEditingController();

final riceBranQtyController = TextEditingController();
final riceBranPriceController = TextEditingController();

final wheatBranQtyController = TextEditingController();
final wheatBranPriceController = TextEditingController();

final peasQtyController = TextEditingController();
final peasPriceController = TextEditingController();

final khesariQtyController = TextEditingController();
final khesariPriceController = TextEditingController();

final fishMealQtyController = TextEditingController();
final fishMealPriceController = TextEditingController();

final meatBoneQtyController = TextEditingController();
final meatBonePriceController = TextEditingController();

final limestoneQtyController = TextEditingController();
final limestonePriceController = TextEditingController();

double totalWeight = 0;
double totalCost = 0;
double costPerKg = 0;
void calculateFeed() {
  double weight = 0;
  double cost = 0;

  void addItem(
      TextEditingController qty,
      TextEditingController price) {

    double q = double.tryParse(qty.text) ?? 0;
    double p = double.tryParse(price.text) ?? 0;

    weight += q;
    cost += q * p;
  }
  
  addItem(wheatQtyController, wheatPriceController);
  addItem(riceQtyController, ricePriceController);
  addItem(cornQtyController, cornPriceController);
  addItem(soybeanQtyController, soybeanPriceController);
  addItem(mustardQtyController, mustardPriceController);
  addItem(riceBranQtyController, riceBranPriceController);
  addItem(wheatBranQtyController, wheatBranPriceController);
  addItem(peasQtyController, peasPriceController);
  addItem(khesariQtyController, khesariPriceController);
  addItem(fishMealQtyController, fishMealPriceController);
  addItem(meatBoneQtyController, meatBonePriceController);
  addItem(limestoneQtyController, limestonePriceController);

  setState(() {
    totalWeight = weight;
    totalCost = cost;
    costPerKg = weight == 0 ? 0 : cost / weight;
 });
 savePrices();
}
Future<void> saveFormula() async {
  final prefs = await SharedPreferences.getInstance();

  String key = '${selectedFeedType}_${selectedFormula}';

  await prefs.setString('${key}_wheatQty', wheatQtyController.text);
  await prefs.setString('${key}_riceQty', riceQtyController.text);
  await prefs.setString('${key}_cornQty', cornQtyController.text);
  await prefs.setString('${key}_soybeanQty', soybeanQtyController.text);
  await prefs.setString('${key}_mustardQty', mustardQtyController.text);

  await prefs.setString('${key}_riceBranQty', riceBranQtyController.text);
  await prefs.setString('${key}_wheatBranQty', wheatBranQtyController.text);
  await prefs.setString('${key}_peasQty', peasQtyController.text);
  await prefs.setString('${key}_khesariQty', khesariQtyController.text);
  await prefs.setString('${key}_fishMealQty', fishMealQtyController.text);
  await prefs.setString('${key}_meatBoneQty', meatBoneQtyController.text);
  await prefs.setString('${key}_limestoneQty', limestoneQtyController.text);
}
    void clearAll() {
  wheatQtyController.clear();
  wheatPriceController.clear();

  riceQtyController.clear();
  ricePriceController.clear();

  cornQtyController.clear();
  cornPriceController.clear();

  soybeanQtyController.clear();
  soybeanPriceController.clear();

  mustardQtyController.clear();
  mustardPriceController.clear();

  riceBranQtyController.clear();
  riceBranPriceController.clear();

  wheatBranQtyController.clear();
  wheatBranPriceController.clear();

  peasQtyController.clear();
  peasPriceController.clear();

  khesariQtyController.clear();
  khesariPriceController.clear();

  fishMealQtyController.clear();
  fishMealPriceController.clear();

  meatBoneQtyController.clear();
  meatBonePriceController.clear();

  limestoneQtyController.clear();
  limestonePriceController.clear();

  setState(() {
    totalWeight = 0;
    totalCost = 0;
    costPerKg = 0;
  });
}
Future<void> loadFormula() async {
  final prefs = await SharedPreferences.getInstance();

  String key = '${selectedFeedType}_${selectedFormula}';

  // Load Saved Formula
  wheatQtyController.text =
      prefs.getString('${key}_wheatQty') ?? '';

  riceQtyController.text =
      prefs.getString('${key}_riceQty') ?? '';

  cornQtyController.text =
      prefs.getString('${key}_cornQty') ?? '';

  soybeanQtyController.text =
      prefs.getString('${key}_soybeanQty') ?? '';

  mustardQtyController.text =
      prefs.getString('${key}_mustardQty') ?? '';

  riceBranQtyController.text =
      prefs.getString('${key}_riceBranQty') ?? '';

  wheatBranQtyController.text =
      prefs.getString('${key}_wheatBranQty') ?? '';

  peasQtyController.text =
      prefs.getString('${key}_peasQty') ?? '';

  khesariQtyController.text =
      prefs.getString('${key}_khesariQty') ?? '';

  fishMealQtyController.text =
      prefs.getString('${key}_fishMealQty') ?? '';

  meatBoneQtyController.text =
      prefs.getString('${key}_meatBoneQty') ?? '';

  limestoneQtyController.text =
      prefs.getString('${key}_limestoneQty') ?? '';

  // Load Default Formula if no saved formula exists
  final formula = defaultFormulas[selectedFeedType];

  if (formula != null) {
    wheatQtyController.text =
        wheatQtyController.text.isEmpty ? (formula["wheat"] ?? "") : wheatQtyController.text;

    riceQtyController.text =
        riceQtyController.text.isEmpty ? (formula["rice"] ?? "") : riceQtyController.text;

    cornQtyController.text =
        cornQtyController.text.isEmpty ? (formula["corn"] ?? "") : cornQtyController.text;

    soybeanQtyController.text =
        soybeanQtyController.text.isEmpty ? (formula["soybean"] ?? "") : soybeanQtyController.text;

    mustardQtyController.text =
        mustardQtyController.text.isEmpty ? (formula["mustard"] ?? "") : mustardQtyController.text;

    riceBranQtyController.text =
        riceBranQtyController.text.isEmpty ? (formula["riceBran"] ?? "") : riceBranQtyController.text;

    wheatBranQtyController.text =
        wheatBranQtyController.text.isEmpty ? (formula["wheatBran"] ?? "") : wheatBranQtyController.text;

    peasQtyController.text =
        peasQtyController.text.isEmpty ? (formula["peas"] ?? "") : peasQtyController.text;

    khesariQtyController.text =
        khesariQtyController.text.isEmpty ? (formula["khesari"] ?? "") : khesariQtyController.text;

    fishMealQtyController.text =
        fishMealQtyController.text.isEmpty ? (formula["fishMeal"] ?? "") : fishMealQtyController.text;

    meatBoneQtyController.text =
        meatBoneQtyController.text.isEmpty ? (formula["meatBone"] ?? "") : meatBoneQtyController.text;

    limestoneQtyController.text =
        limestoneQtyController.text.isEmpty ? (formula["limestone"] ?? "") : limestoneQtyController.text;
  }

  setState(() {});
}

Future<void> savePrices() async {
  
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString(
      'wheatPrice', wheatPriceController.text);
  await prefs.setString(
      'ricePrice', ricePriceController.text);
  await prefs.setString(
      'cornPrice', cornPriceController.text);
  await prefs.setString(
      'soybeanPrice', soybeanPriceController.text);
  await prefs.setString(
      'mustardPrice', mustardPriceController.text);
}
Future<void> loadPrices() async {
  final prefs = await SharedPreferences.getInstance();

  wheatPriceController.text =
      prefs.getString('wheatPrice') ?? '';

  ricePriceController.text =
      prefs.getString('ricePrice') ?? '';

  cornPriceController.text =
      prefs.getString('cornPrice') ?? '';

  soybeanPriceController.text =
      prefs.getString('soybeanPrice') ?? '';

  mustardPriceController.text =
      prefs.getString('mustardPrice') ?? '';
}
@override
void initState() {
  super.initState();
  loadPrices();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FEED CALCULATOR"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
          body: SingleChildScrollView(
  child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Feed Type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              initialValue: selectedFeedType,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Broiler",
                  child: Text("🐔 Broiler"),
                ),
                DropdownMenuItem(
                  value: "Layer",
                  child: Text("🥚 Layer"),
                ),
                DropdownMenuItem(
                  value: "Sonali",
                  child: Text("🐓 Sonali"),
                ),
                DropdownMenuItem(
                  value: "Duck",
                  child: Text("🦆 Duck"),
                ),
                DropdownMenuItem(
                  value: "Pigeon",
                  child: Text("🕊️ Pigeon"),
                ),
              ],
              onChanged: (value) {
  setState(() {
    selectedFeedType = value!;
  });

  clearAll();
  loadFormula();
},
            ),
const SizedBox(height: 15),

const Text(
  "Formula",
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

DropdownButtonFormField<String>(
  value: selectedFormula,
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
  ),
  items: const [
    DropdownMenuItem(
      value: "Starter",
      child: Text("Starter"),
    ),
    DropdownMenuItem(
      value: "Grower",
      child: Text("Grower"),
    ),
    DropdownMenuItem(
      value: "Finisher",
      child: Text("Finisher"),
    ),
  ],
  onChanged: (value) {
    setState(() {
      selectedFormula = value!;
    });

    loadFormula();
  },
),

const SizedBox(height: 20),

IngredientRow(
  ingredientName: "🌾 Wheat",
  quantityController: wheatQtyController,
  priceController: wheatPriceController,
),
const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🍚 Rice",
  quantityController: riceQtyController,
  priceController: ricePriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🌽 Corn",
  quantityController: cornQtyController,
  priceController: cornPriceController,
),
const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🌱 Soybean Meal",
  quantityController: soybeanQtyController,
  priceController: soybeanPriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🌿 Mustard Cake",
  quantityController: mustardQtyController,
  priceController: mustardPriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🌾 Rice Bran",
  quantityController: riceBranQtyController,
  priceController: riceBranPriceController,
),
const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🌾 Wheat Bran",
  quantityController: wheatBranQtyController,
  priceController: wheatBranPriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🟢 Peas",
  quantityController: peasQtyController,
  priceController: peasPriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🌿 Khesari",
  quantityController: khesariQtyController,
  priceController: khesariPriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🐟 Fish Meal",
  quantityController: fishMealQtyController,
  priceController: fishMealPriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🦴 Meat & Bone Meal",
  quantityController: meatBoneQtyController,
  priceController: meatBonePriceController,
),

const SizedBox(height: 15),

IngredientRow(
  ingredientName: "🪨 Limestone",
  quantityController: limestoneQtyController,
  priceController: limestonePriceController,
),
const SizedBox(height: 30),

SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    onPressed: calculateFeed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
    child: const Text(
      "CALCULATE",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  ),
),
const SizedBox(height: 15),

SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    onPressed: clearAll,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ),
    child: const Text(
      "CLEAR ALL",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  ),
),

const SizedBox(height: 20),

ResultCard(
  totalWeight: totalWeight,
  totalCost: totalCost,
  costPerKg: costPerKg,
),


          ],
        ),
      ),
    ),
  );
}
}