import 'package:flutter/material.dart';
import 'package:melhores_praticas/features/category/controller/category_controller.dart';
import 'package:melhores_praticas/features/category/view/pages/category_error.dart';
import 'package:melhores_praticas/features/category/view/pages/category_loading.dart';
import 'package:melhores_praticas/features/category/view/pages/category_page.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key, required this.controller})
      : super(key: key);
  final ICategoryController controller;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.isLoading) {
          return CategoryLoading();
        }

        if (controller.hasError) {
          return CategoryError(
            error: controller.error,
            onRefresh: controller.fetchList,
          );
        }

        return CategoryPage(
          list: controller.list,
          onRefresh: () => controller.fetchList(isError: true),
        );
      },
    );
  }
}
