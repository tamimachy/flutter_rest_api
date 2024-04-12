import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:flutter_rest_api/services/user_api.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API Call"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            // final color = user.gender == 'male' ? Colors.blue : Colors.green;
            final phone = user.phone;
            final name = user.name;
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.location.country),
              // tileColor: color,
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserAPI.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
