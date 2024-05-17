import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';

class LinkWidget extends StatelessWidget {
  final String title;
  final String link;

  const LinkWidget({super.key, required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: (){
          launchUrl(Uri.parse(link));
        },
        child: Text(
          '$title: $link',
          style: context.textTheme.bodySmall?.copyWith(color: AppColors.linkColor),
        ),
      ),
    );
  }
}
