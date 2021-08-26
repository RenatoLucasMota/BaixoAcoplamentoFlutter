import 'package:flutter/material.dart';
import 'package:melhores_praticas/features/category/controller/category_controller.dart';
import 'package:melhores_praticas/features/category/repository/category_repository.dart';
import 'package:melhores_praticas/features/category/view/container/category_container.dart';

class CategoryRouter extends StatelessWidget {
  const CategoryRouter({Key? key, required this.repository}) : super(key: key);
  final ICategoryRepository repository;
  @override
  Widget build(BuildContext context) {
    return CategoryContainer(
      controller: CategoryController(
        repository: repository,
        onError: (error) => _showErrorDialog(error, context),
      )..fetchList(),
    );
  }

  Future<void> _showErrorDialog(String error, BuildContext context) async {
    await showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(error),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        },
        context: context);
  }
}
