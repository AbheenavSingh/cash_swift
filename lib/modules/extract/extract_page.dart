import 'package:flutter/material.dart';

import 'package:cash_swift/shared/themes/app_colors.dart';
import 'package:cash_swift/shared/themes/app_text_styles.dart';
import 'package:cash_swift/shared/widgets/upi_list/upi_list_controller.dart';
import 'package:cash_swift/shared/widgets/upi_list/upi_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({super.key});

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = UpiListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text(
                  'My extracts',
                  style: AppTextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.stroke),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: UpiListWidget(controller: controller),
          )
        ],
      ),
    );
  }
}
