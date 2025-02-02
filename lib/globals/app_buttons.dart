import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtons {

  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: Colors.lightBlue,
      splashColor: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: AppColors.themeColor,
          width: 0.8,
        ),
      ),
      hoverColor: AppColors.themeColor,
      elevation: 7,
      height: 46,
      minWidth: 130,
      focusElevation: 12,
      child: Text(
        buttonName,
        style: AppTextStyles.headerTextStyle(color: Colors.black),
      ),
    );
  }
}
