import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String selected = "Happy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emotional TTS"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter your text"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            DropdownButton(
              value: selected,
              items: [
                DropdownMenuItem(
                  child: Text("Happy"),
                  value: "Happy",
                ),
                DropdownMenuItem(
                  child: Text("Sad"),
                  value: "Sad",
                ),
                DropdownMenuItem(
                  child: Text("Angry"),
                  value: "Angry",
                ),
              ],
              onChanged: (selected) {
                setState(() {
                  this.selected = selected;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
