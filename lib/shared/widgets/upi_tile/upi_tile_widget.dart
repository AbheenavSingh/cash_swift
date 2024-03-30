import 'package:flutter/material.dart';

import 'package:animated_card/animated_card.dart';

import 'package:cash_swift/shared/models/upi_model.dart';
import 'package:cash_swift/shared/themes/app_text_styles.dart';

class UpiTileWidget extends StatelessWidget {
  const UpiTileWidget({
    super.key,
    required this.data,
  });

  final UpiModel data;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            data.name,
            style: AppTextStyles.titleListTile,
          ),
          subtitle: Text(
            'Expires on: ${data.dueDate}',
            style: AppTextStyles.captionBody,
          ),
          trailing: Text.rich(TextSpan(
            text: '\$ ',
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: data.value.toStringAsFixed(2),
                style: AppTextStyles.trailingBold,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
