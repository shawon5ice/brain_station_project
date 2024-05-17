import 'package:get/get.dart';
import 'package:template_project/core/routes/bindings.dart';
import 'package:template_project/features/repository_list/presentation/repository_details_screen.dart';
import 'package:template_project/features/repository_list/presentation/repository_list.dart';


class AllRoutes {
  static List<GetPage> allRoutes = [

    GetPage(
      name: GitHubRepositoryList.routeName,
      page: () => const GitHubRepositoryList(),
      binding: GitHubRepositoryListBinding(),
    ),

    GetPage(
      name: RepositoryDetailsScreen.routeName,
      page: () => const RepositoryDetailsScreen(),
      binding: GitHubRepositoryListBinding(),
    ),
  ];
}
