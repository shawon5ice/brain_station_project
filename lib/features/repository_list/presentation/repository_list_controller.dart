import 'dart:isolate';

import 'package:get/get.dart';
import 'package:template_project/features/repository_list/data/models/github_repository_llst_response_model.dart';
import 'package:template_project/features/repository_list/data/repository_list_service.dart';

import '../../../core/network/logger.dart';

class RepositoryListController extends GetxController {
  bool repositoryListLoading = true;
  bool repositoryListLoadingMore = false;
  GitHubRepositoryListResponseModel? gitHubRepositoryListResponseModel;
  List<GitHubRepository> gitHubRepositoryList = [];

  void getRepositoryList({required String searchKeyWord, required int page}) async {
    if(page ==1 ){
      repositoryListLoading = true;
    }else{
      repositoryListLoadingMore = true;
    }
    update(['repository_list']);
    try {
      var response = await RepositoryListService.getRepositoryList(
        searchKeyWord: searchKeyWord,
        page: page,
      );

      gitHubRepositoryListResponseModel = await startParsing(response);
      logger.e(gitHubRepositoryListResponseModel!.gitHubRepositoryList.length);
      gitHubRepositoryList
          .addAll(gitHubRepositoryListResponseModel!.gitHubRepositoryList);
    } finally {
      repositoryListLoading = false;
      repositoryListLoadingMore = false;
      update(['repository_list']);
    }
  }

  Future<GitHubRepositoryListResponseModel> startParsing(
      dynamic response) async {
    final resultPort = ReceivePort();
    await Isolate.spawn(
      parseJson,
      [resultPort.sendPort, response],
    );
    return await (resultPort.first);
  }

  static parseJson(List<dynamic> args) async {
    SendPort resultPort = args[0];
    var json = args[1];

    GitHubRepositoryListResponseModel productsModel =
        await GitHubRepositoryListResponseModel.fromJson(json);

    Isolate.exit(resultPort, productsModel);
  }
}
