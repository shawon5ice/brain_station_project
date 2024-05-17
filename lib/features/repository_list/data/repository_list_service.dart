import 'package:template_project/core/constants/urls.dart';
import 'package:template_project/core/network/logger.dart';
import 'package:template_project/core/network/network_client.dart';
import 'package:template_project/features/repository_list/data/models/github_repository_llst_response_model.dart';

class RepositoryListService{
  static Future<dynamic> getRepositoryList({required String searchKeyWord, required int page}) async {
    var response = await NetworkClient.getData(
      apiEndPoint: NetworkUrls.repositorySearchEndPoint,
      queryParameters: {
        'q': searchKeyWord,
        'per_page': 10,
        'page': page,
      }
    );
    return response;
  }
}