import 'package:automated_test_poc/third_screen.dart';
import 'package:automated_test_poc/home_screen.dart';
import 'package:automated_test_poc/widgets_keys.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isChecked = false;
  String _dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      drawer: Drawer(
        key: Key(kDrawer),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer"),
            ),
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Contact Us'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: Key(kTextField),
              decoration: InputDecoration(
                labelText: "Start Typing",
              ),
            ),
            SizedBox(height: 20),
            Checkbox(
                key: Key(kCheckbox),
                value: _isChecked,
                onChanged: (_) {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                }),
            SizedBox(height: 20),
            _dropDown(),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()));
              },
              child: Text(
                "To Third Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text(
                "Back Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropDown() {
    return DropdownButton<String>(
      key: Key(kDropdown),
      value: _dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
