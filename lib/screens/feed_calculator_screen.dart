import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/ingredient_row.dart';
class FeedCalculatorScreen extends StatefulWidget {
  const FeedCalculatorScreen({super.key});

  @override
  State<FeedCalculatorScreen> createState() =>
      _FeedCalculatorScreenState();
}

class _FeedCalculatorScreenState extends State<FeedCalculatorScreen> {

String selectedFeedType = "Broiler";
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
void loadFormula() {
  if (selectedFeedType == "Pigeon") {
    wheatQtyController.text = "6";
    riceQtyController.text = "4";
    cornQtyController.text = "4";
    mustardQtyController.text = "0.5";
    peasQtyController.text = "0.5";
  }
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

Card(
  elevation: 4,
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "📦 Total Weight : ${totalWeight.toStringAsFixed(2)} Kg",
          style: const TextStyle(fontSize: 18),
        ),

        const SizedBox(height: 10),

        Text(
          "💰 Total Cost : ৳${totalCost.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 18),
        ),

        const SizedBox(height: 10),

        Text(
          "🏷 Cost / Kg : ৳${costPerKg.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    ),
  ),
),
          ],
        ),
      ),
    ),
  );
}
}