import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobiletest_app/providers/palindrome_provider.dart';
import 'package:suitmedia_mobiletest_app/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PalindromeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Second Screen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              '${provider.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 210,
            ),
            Center(
              child: Text(
                'Selected User Name ${provider.selectedUserName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
              ),
            ),
            const SizedBox(
              height: 340,
            ),
            Container(
              width: double.infinity,
              child: Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    },
                    child: Text(
                      'Choose a User',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
