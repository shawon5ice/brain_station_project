import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_project/core/helper/size_box_extension.dart';
import 'package:template_project/features/repository_list/data/models/github_repository_llst_response_model.dart';

import 'widgets/owner_information_widget.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  static String routeName = '/repository_details_screen';

  const RepositoryDetailsScreen({super.key});

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState extends State<RepositoryDetailsScreen> {
  late GitHubRepository repository;

  @override
  void initState() {
    repository = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OwnerInformation(
              owner: repository.owner,
            ),
            Text('Last Updated at : ${repository.updatedAt}'),
            addHeight(8),
            Text(repository.description),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Topics: ',
                style: context.textTheme.titleMedium,
              ),
            ),
            Wrap(
              children: repository.topics.map((text) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      text,
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                );
              }).toList(),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
