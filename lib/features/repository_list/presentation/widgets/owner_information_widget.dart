import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_project/core/constants/colors.dart';

import '../../../../core/helper/size_box_extension.dart';
import '../../data/models/github_repository_llst_response_model.dart';
import 'link_widget.dart';

class OwnerInformation extends StatelessWidget {
  final Owner owner;

  const OwnerInformation({super.key, required this.owner});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          child: ClipOval(
            child: Image.network(
              owner.avatarUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        addHeight(4),
        Text('Name : ${owner.login}'),
        addHeight(4),
        Text('Type : ${owner.type}'),
        addHeight(4),
        LinkWidget(title: 'Follower\'s url', link: owner.followersUrl,),
      ],
    );
  }
}
