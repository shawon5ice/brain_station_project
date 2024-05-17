import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_project/features/repository_list/data/models/github_repository_llst_response_model.dart';
import 'package:template_project/features/repository_list/presentation/repository_details_screen.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/helper/size_box_extension.dart';

class RepositoryListItemWidget extends StatelessWidget {
  GitHubRepository item;

  RepositoryListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RepositoryDetailsScreen.routeName, arguments: item);
      },
      child: Card(
        color: AppColors.cardColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: Image.network(
                        item.owner.avatarUrl,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  addWidth(10),
                  Expanded(
                      child: Text(
                    item.name,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                  )),
                  Text('Stars: ${item.stargazersCount}'),
                ],
              ),
              addHeight(8),
              Text('Owner: ${item.owner.login}'),
              addHeight(8),
            ],
          ),
        ),
      ),
    );
  }
}
