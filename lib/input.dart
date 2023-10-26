import 'package:flutter/material.dart';
import 'package:my_shared_prefs/output.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  TextEditingController passController = TextEditingController();

  void savePrefs(String password) async {
    final passPrefs = await prefs;
    passPrefs.setString("password", password);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: passController,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              savePrefs(passController.text);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OutputPage(),
                  ));
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
