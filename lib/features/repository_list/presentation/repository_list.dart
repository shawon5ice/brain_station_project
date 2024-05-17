import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_project/core/constants/colors.dart';
import 'package:template_project/core/constants/strings.dart';
import 'package:template_project/core/helper/pager_list_view.dart';
import 'package:template_project/core/helper/size_box_extension.dart';
import 'package:template_project/features/repository_list/presentation/repository_list_controller.dart';
import 'package:template_project/features/repository_list/presentation/widgets/repository_list_item_widget.dart';

class GitHubRepositoryList extends StatefulWidget {
  static String routeName = '/github_repository_list';

  const GitHubRepositoryList({super.key});

  @override
  State<GitHubRepositoryList> createState() => _GitHubRepositoryListState();
}

class _GitHubRepositoryListState extends State<GitHubRepositoryList> {
  RepositoryListController repositoryListController = Get.find();

  @override
  void initState() {
    repositoryListController.getRepositoryList(
        searchKeyWord: 'Flutter', page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Repository List'),
        elevation: 2,
      ),
      body: GetBuilder<RepositoryListController>(
        id: 'repository_list',
        builder: (controller) {
          if (controller.repositoryListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.gitHubRepositoryListResponseModel == null) {
            return Center(
              child: Text(AppStrings.wentWrong),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PagerListView(
                  items: controller.gitHubRepositoryList,
                  itemBuilder: (context, item) {
                    return RepositoryListItemWidget(item: item);
                  },
                  isLoading: controller.repositoryListLoadingMore,
                  onNewLoad: (data, page) {
                    controller.getRepositoryList(
                        searchKeyWord: 'Flutter', page: page);
                  },
                  totalPage: (controller
                              .gitHubRepositoryListResponseModel!.totalCount /
                          10)
                      .ceil(),
                  totalSize:
                      controller.gitHubRepositoryListResponseModel!.totalCount,
                  itemPerPage: 10),
            );
          }
        },
      ),
    );
  }
}
