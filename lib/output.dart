import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutputPage extends StatefulWidget {
  const OutputPage({super.key});

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  String? password;

  void getPrefs() async {
    final passPrefs = await prefs;
    final dataPass = passPrefs.getString("password");
    password = dataPass;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Output Page")),
      body: Center(
        child: Text("${password}"),
      ),
    );
  }
}
