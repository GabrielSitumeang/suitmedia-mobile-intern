import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobiletest_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suitmedia_mobiletest_app/providers/palindrome_provider.dart';

class ThirdScreen extends StatelessWidget {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> usersJson = data['data'];

    return usersJson.map((json) => User.fromMap(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Third Screen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No data available'),
              );
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text(user.fullName),
                        subtitle: Text(user.email),
                        onTap: () {
                          context
                              .read<PalindromeProvider>()
                              .setSelectedUserName(user.fullName);
                          Navigator.pop(context);
                        },
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
