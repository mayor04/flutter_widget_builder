import 'package:fb_components/fb_components.dart';
import 'package:fb_core/fb_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Column code formatted correctly', () {
    final formatter = WidgetFormatter();
    final columnConfig = FbColumnConfig();

    formatter.formatWidget(columnConfig.generateCode(''));

    columnConfig
      ..mainAxisInput.value = MainAxisAlignment.spaceAround
      ..crossAxisInput.value = CrossAxisAlignment.start
      ..mainAxisSizeInput.value = MainAxisSize.min;

    formatter.formatWidget(
      columnConfig.generateCode(columnConfig.generateCode('')),
    );
  });
}
