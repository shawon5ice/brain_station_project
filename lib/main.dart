import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_project/core/routes/router.dart';
import 'package:template_project/features/repository_list/presentation/repository_list.dart';

import 'core/theme/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark/Light Theme Example',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      getPages: AllRoutes.allRoutes,
      initialRoute: GitHubRepositoryList.routeName,
      initialBinding: BindingsBuilder(() {
        Get.put(ThemeController());
      }),
    );
  }
}
