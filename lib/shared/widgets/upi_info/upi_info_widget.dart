import 'package:flutter/material.dart';

import 'package:cash_swift/shared/themes/app_colors.dart';
import 'package:cash_swift/shared/themes/app_images.dart';
import 'package:cash_swift/shared/themes/app_text_styles.dart';

class UpiInfoWidget extends StatelessWidget {
  const UpiInfoWidget({
    super.key,
    required this.size,
  });

  final int size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(TextSpan(
              text: 'You have ',
              style: AppTextStyles.captionBackground,
              children: [
                TextSpan(
                  text: '$size Upis\n',
                  style: AppTextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: 'registered to pay',
                  style: AppTextStyles.captionBackground,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
