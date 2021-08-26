import 'package:flutter/material.dart';
import 'package:melhores_praticas/features/category/model/category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.list,required this.onRefresh}) : super(key: key);
  final List<Category> list;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index].name),
            );
          },
        ),
      ),
    );
  }
}
