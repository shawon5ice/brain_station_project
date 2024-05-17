import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:template_project/core/helper/size_box_extension.dart';

import '../constants/colors.dart';

class HelperMethods {
  static void showSnackBar({
    required String message,
    bool? isSuccess,
    SnackPosition? position,
    int? duration,
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      isSuccess != null ? 'Success' : 'Error Occurred!',
      message,
      icon: Icon(
        isSuccess != null ? Icons.check_box_outlined : Icons.error,
        // color: isSuccess != null ? Colors.green : Colors.red,
        color: Colors.white,
      ),
      snackPosition: position ?? SnackPosition.TOP,
      animationDuration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      duration: Duration(seconds: duration ?? 2),
      backgroundColor: isSuccess != null ? Colors.green : Colors.red,
      colorText: Colors.white,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  static DropdownMenuItem<dynamic> getDDMenuItem({
    required dynamic item,
    required String txt,
  }) {
    return DropdownMenuItem(
      value: item,
      child: Row(
        children: [
          addWidth(15),
          Text(
            txt.substring(0, txt.length > 40 ? 40 : txt.length),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Image Uploading Methods
  static Widget buildDPAlertDialog({
    required Future<void> Function(bool) onPressedFn,
    required BuildContext ctx,
  }) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.symmetric(horizontal: 10),
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 30),
      backgroundColor: Colors.transparent,
      title: Container(
        // height: 148,
        width: MediaQuery.of(ctx).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            buildImgSelectBtn(
              onPressedFn: onPressedFn,
              title: "Camera",
              galleryFlag: false,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              height: 0,
            ),
            buildImgSelectBtn(
              onPressedFn: onPressedFn,
              title: "Choose from gallery",
              galleryFlag: true,
            ),
          ],
        ),
      ),
      content: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          ),
          fixedSize: MaterialStateProperty.all(Size(double.infinity, 60)),
        ),
        onPressed: () {
          Get.back();
        },
        child: Text(
          "Cancel",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  static TextButton buildImgSelectBtn({
    required Future<void> Function(bool) onPressedFn,
    required String title,
    required bool galleryFlag,
  }) {
    return TextButton(
      onPressed: () async {
        onPressedFn(galleryFlag);
        Get.back();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(double.infinity, 54)),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
