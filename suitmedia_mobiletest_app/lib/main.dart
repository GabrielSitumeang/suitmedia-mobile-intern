import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobiletest_app/providers/palindrome_provider.dart';
import 'package:suitmedia_mobiletest_app/screens/first_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PalindromeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: FirstScreen(),
    );
  }
}
