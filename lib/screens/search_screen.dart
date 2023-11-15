import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool? canCauseAllergy;
  String allergyName = '';

  Future checkForAllergy() async {
    var res =
        await http.get(Uri.parse('http://127.0.0.1:8080/canCauseAllergy'));
    Map json = jsonDecode(res.body);
    setState(() {
      canCauseAllergy = json['causesAllergy'];
      allergyName = json['allergyName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Allergic Product"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Product Name",
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
              controller: searchController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: const Color(0xFF00E1B4),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () async {
                  await checkForAllergy();
                },
                child: const Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Result",
            style: TextStyle(fontSize: 30),
          ),
          canCauseAllergy == null
              ? const Text(
                  "Enter a product name to find out if it causes any allergy")
              : canCauseAllergy == true
                  ? Text(
                      "${searchController.text} can cause $allergyName allergy. Avoid consuming it if you are allergic to $allergyName")
                  : Text(
                      "${searchController.text} does not cause any type of allergy.")
        ],
      ),
    );
  }
}
