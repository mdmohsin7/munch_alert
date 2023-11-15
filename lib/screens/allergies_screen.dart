import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AllergiesScreen extends StatefulWidget {
  const AllergiesScreen({super.key});

  @override
  State<AllergiesScreen> createState() => _AllergiesScreenState();
}

class _AllergiesScreenState extends State<AllergiesScreen> {
  int selectedAllergy = 0;
  List allergies = [];
  bool hasError = false;
  @override
  void initState() {
    getAllergiesList();
    super.initState();
  }

  Future getAllergiesList() async {
    try {
      var res =
          await http.get(Uri.parse('http://127.0.0.1:8080/getAllergiesList'));
      List allergiesList = jsonDecode(res.body);
      setState(() {
        allergies.addAll(allergiesList);
        hasError = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Most Common Allergies"),
        backgroundColor: Colors.blue,
      ),
      body: hasError
          ? const Center(
              child: Text("Something went wrong! Please try again later."),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allergies[index]),
                );
              },
              itemCount: allergies.length,
            ),
    );
  }
}
