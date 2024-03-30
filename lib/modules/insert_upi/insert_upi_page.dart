import 'package:flutter/material.dart';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cash_swift/modules/insert_upi/insert_upi_controller.dart';
import 'package:cash_swift/shared/themes/app_colors.dart';
import 'package:cash_swift/shared/themes/app_text_styles.dart';
import 'package:cash_swift/shared/widgets/input_text/input_text_widget.dart';
import 'package:cash_swift/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertUpiPage extends StatefulWidget {
  const InsertUpiPage({
    super.key,
    required this.barcode,
  });

  final String barcode;

  @override
  State<InsertUpiPage> createState() => _InsertUpiPageState();
}

class _InsertUpiPageState extends State<InsertUpiPage> {
  final formKey = GlobalKey<FormState>();
  final controller = InsertUpiController();
  final barcodeInputTextController = TextEditingController();
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: '\$',
    initialValue: 0,
    decimalSeparator: ',',
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: const BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(93, 24, 93, 24),
                child: Text(
                  'Fill in the payment slip data',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: 'Upi name',
                      icon: Icons.description_outlined,
                      onChanged: (value) => controller.onChange(name: value),
                      validator: controller.validateName,
                      keyboardType: TextInputType.name,
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: 'Due date',
                      icon: FontAwesomeIcons.circleXmark,
                      onChanged: (value) => controller.onChange(dueDate: value),
                      validator: controller.validateDueDate,
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: 'Price',
                      icon: FontAwesomeIcons.wallet,
                      validator: (_) => controller.validateValue(
                        moneyInputTextController.numberValue,
                      ),
                      onChanged: (value) => controller.onChange(
                        value: moneyInputTextController.numberValue,
                      ),
                    ),
                    InputTextWidget(
                      controller: barcodeInputTextController,
                      label: 'Code',
                      icon: FontAwesomeIcons.barcode,
                      validator: controller.validateCode,
                      onChanged: (value) => controller.onChange(barcode: value),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            enableSecondaryColor: true,
            labelPrimary: 'Cancel',
            onTapPrimary: () {
              Navigator.pop(context);
            },
            labelSecondary: 'Register',
            onTapSecondary: () async {
              if (formKey.currentState?.validate() ?? false) {
                await controller.saveUpi();
                if (!mounted) return;
                Navigator.pop(context);
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
