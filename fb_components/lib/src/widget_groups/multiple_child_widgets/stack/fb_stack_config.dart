import 'package:fb_components/src/base/base_fb_config.dart';
import 'package:fb_components/src/base/base_input.dart';
import 'package:fb_components/src/base/code_logic_mixin.dart';
import 'package:fb_components/src/base/fb_enum.dart';
import 'package:fb_core/fb_core.dart';
import 'package:flutter/material.dart';

const _type = FbWidgetType.stack;

class FbStackConfig extends BaseFbConfig<FbStackStyles> with CodeGeneratorLogic {
  FbStackStyles? styles;

  FbStackConfig({int? id, this.styles})
      : super(
          _type,
          FbChildType.multiple,
          id: id,
        );

  factory FbStackConfig.fromJson(Map<String, dynamic> json) {
    return FbStackConfig(
      id: json['id'] as int,
      styles: FbStackStyles.fromJson(json['styles']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': widgetType.name,
        'fit': styles?.stackFit.name,
      };

  @override
  List<BaseFbInput> getInputs() {
    return [
      // fitInput,
    ];
  }

  @override
  getWidgetStyles() {
    return styles ??= FbStackStyles(
      id,
      stackFit: StackFit.loose,
    );
  }

  @override
  String generateCode(String? childCode) {
    final styles = getWidgetStyles();

    final widgetCode = {
      '_name': 'Stack',
      'mainAxisAlignment': nullMapper(
        value: styles.stackFit.toString(),
        returnNullChecks: [(v) => v == 'StackFit.loose'],
      ),
      'children': '[$childCode]',
    };

    return getCode(widgetCode) ?? '';
  }

  @override
  void updateStyles(FbStackStyles styles) {
    this.styles = styles;
  }
}

class FbStackStyles extends BaseFbStyles {
  final StackFit stackFit;

  FbStackStyles(
    int id, {
    this.stackFit = StackFit.loose,
  }) : super(id, _type);

  factory FbStackStyles.fromJson(Map<String, dynamic> json) {
    return FbStackStyles(
      json['id'] as int,
      stackFit: (json['stackFit'] as String).toEnum(StackFit.values) ?? StackFit.loose,
    );
  }

  FbStackStyles copyWith({
    StackFit? stackFit,
  }) {
    return FbStackStyles(
      id,
      stackFit: stackFit ?? this.stackFit,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': widgetType.name,
        'stackFit': stackFit.name,
      };
}
