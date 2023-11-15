import 'package:munch_alert/screens/allergies_screen.dart';
import 'package:munch_alert/screens/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Welcome to Munch Alert! ${widget.name}"),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner_sharp,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Scan",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SearchScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.health_and_safety_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Remedies",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AllergiesScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medical_information,
                          size: 50,
                          color: Colors.white,
                        ),
                        Center(
                          child: Text(
                            "Allergies",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Emergency SOS",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
