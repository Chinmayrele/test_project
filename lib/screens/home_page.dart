import 'package:checkbox_field/checkbox_field.dart';
import 'package:flutter/material.dart';
import 'package:slt_dropdown/slt_dropdown.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _checkList = [];
  String textSelect = "";
  String textCheck = "";
  List<String> itemList = ['Chinmay', "Max", "Raj", "Rugved", "Sumit"];
  final textController01 = TextEditingController();
  final textController02 = TextEditingController();

  bool isDone = false;

  _submitItemsList(String items) {
    itemList.add(items);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(itemList.toString());
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Drop-down Select",
        style: TextStyle(color: Colors.white),
      )),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(children: [
            DropdownSearch(
                textController: textController01,
                items: itemList,
                itemsList: _submitItemsList),
            const SizedBox(height: 20),
            // buttonFunction(textController01, true),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    textSelect = textController01.text;
                    textController01.clear();
                  });
                },
                child: const Text("Save Text")),
            Text(
              textSelect,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            CheckboxListTileFormField(
              title: const Text("Raj"),
              onChanged: ((value) {
                setState(() {
                  isDone = false;
                  value
                      ? _checkList.add("Raj")
                      : _checkList.removeWhere((element) => element == "Raj");
                });
              }),
            ),
            CheckboxListTileFormField(
              title: const Text("Chinmay"),
              onChanged: ((value) {
                setState(() {
                  isDone = false;
                  value
                      ? _checkList.add("Chinmay")
                      : _checkList
                          .removeWhere((element) => element == "Chinmay");
                });
              }),
            ),
            CheckboxListTileFormField(
              title: const Text("Sumit"),
              onChanged: ((value) {
                setState(() {
                  isDone = false;
                  value
                      ? _checkList.add("Sumit")
                      : _checkList.removeWhere((element) => element == "Sumit");
                });
              }),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDone = true;
                  });
                },
                child: const Text("Save Checkbox")),
            const SizedBox(height: 50),
            isDone ? Text("Selected Options: $_checkList") : const SizedBox()
          ]),
        ),
      ),
    );
  }
}
