import 'package:get/get.dart';
import 'package:template_project/features/repository_list/presentation/repository_list_controller.dart';

class GitHubRepositoryListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepositoryListController());
  }
}