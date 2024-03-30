import 'package:flutter/material.dart';

import 'package:cash_swift/shared/models/upi_model.dart';
import 'package:cash_swift/shared/widgets/upi_list/upi_list_controller.dart';
import 'package:cash_swift/shared/widgets/upi_tile/upi_tile_widget.dart';

class UpiListWidget extends StatefulWidget {
  const UpiListWidget({
    super.key,
    required this.controller,
  });

  final UpiListController controller;

  @override
  State<UpiListWidget> createState() => _UpiListWidgetState();
}

class _UpiListWidgetState extends State<UpiListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UpiModel>>(
      valueListenable: widget.controller.upisNotifier,
      builder: (_, upis, __) => Column(
        children: upis
            .map(
              (upi) => UpiTileWidget(data: upi),
            )
            .toList(),
      ),
    );
  }
}
