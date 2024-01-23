import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'detailsPage_1.dart';
import 'homepage.dart';

class categoryPage_3 extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/aveeno.jpg',
    'assets/babySyrup.png',
    'assets/diaper.jpeg',
    'assets/dropper.jpg',
    'assets/feeder.png',
    'assets/dymadon.png',
  ];

  final List<String> imageNames = [
    'Aveeno',
    'Cough Syrup',
    'Diaper',
    'Dropper',
    'Feeder',
    'Dymadon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Care'),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Handle search input change
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      Image.asset(
                        imagePaths[index],
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        imageNames[index],
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            detailsPage_1(category: imageNames[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}