import 'package:flutter/material.dart';

import 'package:animated_card/animated_card.dart';

import 'package:cash_swift/shared/models/upi_model.dart';
import 'package:cash_swift/shared/themes/app_colors.dart';
import 'package:cash_swift/shared/themes/app_text_styles.dart';
import 'package:cash_swift/shared/widgets/upi_info/upi_info_widget.dart';
import 'package:cash_swift/shared/widgets/upi_list/upi_list_controller.dart';
import 'package:cash_swift/shared/widgets/upi_list/upi_list_widget.dart';

class MyUpisPage extends StatefulWidget {
  const MyUpisPage({super.key});

  @override
  State<MyUpisPage> createState() => _MyUpisPageState();
}

class _MyUpisPageState extends State<MyUpisPage> {
  final controller = UpiListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ValueListenableBuilder<List<UpiModel>>(
                    valueListenable: controller.upisNotifier,
                    builder: (_, upis, __) => AnimatedCard(
                      direction: AnimatedCardDirection.top,
                      child: UpiInfoWidget(
                        size: upis.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              'My tickets',
              style: AppTextStyles.titleBoldHeading,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: UpiListWidget(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
