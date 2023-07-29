import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "apptheme.dart";
import "canvas.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // dropdownlist
  List<String> items = ["Triangle", "Rectangle"];
  String selectedItem = "Triangle";

  //controller
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtWidth = TextEditingController();

  // variables
  late String result = "";

  // theme ıcon

  Icon iconLight = const Icon(Icons.wb_sunny);
  Icon iconDark = const Icon(Icons.nights_stay);


  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<DarkMode>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Area Calculator"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                thmode.changemode();
                
              },
              icon: thmode.darkMode ? iconLight : iconDark),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: dropdownButton(),
              ),
              ShapeContainer(shape: selectedItem),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: txtHeight,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.border_left),
                    hintText: "Height",
                    labelText: "Enter the value of height",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: txtWidth,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.border_bottom),
                    hintText: "Width",
                    labelText: "Enter the value of width",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: ElevatedButton.icon(
                  style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(200, 30))),
                  onPressed: calculateArea,
                  icon: const Icon(Icons.all_inclusive_sharp),
                  label: const Text("Calculate"),
                ),
              ),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> dropdownButton() {
    return DropdownButton(
      onChanged: (value) {
        setState(() {
          selectedItem = value ?? "Triangle";
        });
      },
      value: selectedItem,
      items: items
          .map(
            (element) => DropdownMenuItem(
              value: element,
              child: Text(element),
            ),
          )
          .toList(),
    );
  }

  void calculateArea() {
    switch (selectedItem) {
      case "Triangle":
        double areaTriangle =
            (double.parse(txtHeight.text) * double.parse(txtWidth.text)) / 2;
        setState(() {
          result = " Result is Triangle  $areaTriangle";
        });
        break;
      case "Rectangle":
        double areaRectangle =
            (double.parse(txtHeight.text) * double.parse(txtWidth.text));
        setState(() {
          result = " Result is Rectangle $areaRectangle";
        });
        break;
      default:
    }
    // txtHeight.text = "";
    // txtWidth.text = "";
  }
}
