import 'package:flutter/material.dart';

class CategoryError extends StatelessWidget {
  const CategoryError({Key? key, required this.error, required this.onRefresh})
      : super(key: key);
  final String error;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onRefresh,
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Text(error),
      ),
    );
  }
}
