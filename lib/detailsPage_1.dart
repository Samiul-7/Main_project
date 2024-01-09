import 'package:flutter/material.dart';
import 'categoryPage_1.dart';

class detailsPage_1 extends StatelessWidget {
  final String category;

  detailsPage_1({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Products'),
      ),
      body: Center(
        child: Text('Products for $category will be displayed here.'),
      ),
    );
  }
}