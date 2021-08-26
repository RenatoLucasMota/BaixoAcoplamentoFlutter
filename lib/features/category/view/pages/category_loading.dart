import 'package:flutter/material.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}