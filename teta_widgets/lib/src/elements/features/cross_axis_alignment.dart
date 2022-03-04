// Flutter imports:
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';

class FCrossAxisAlignment {
  /// Constructor
  FCrossAxisAlignment({
    this.value = CrossAxisAlignment.start,
  });

  /// The value in [CrossAxisAlignment] of [FCrossAxisAlignment]
  CrossAxisAlignment? value;

  /// Get a [CrossAxisAlignment] value
  /// Includes optionality checks
  CrossAxisAlignment get get => value ?? CrossAxisAlignment.start;

  String getString(BuildContext context) => _convertValueToDropDown(get);

  void set(String value) => _convertDropDownToValue(value);

  //FCrossAxisAlignment set(BuildContext context, String text) => copyWith(value: )

  FCrossAxisAlignment fromJson(String? json) {
    if (json != null) {
      return FCrossAxisAlignment(
        value: _convertJsonToValue(json),
      );
    } else {
      return FCrossAxisAlignment();
    }
  }

  String toJson() => _convertValueToJson(get);

  FCrossAxisAlignment clone() => FCrossAxisAlignment(value: value);

  FCrossAxisAlignment copyWith({CrossAxisAlignment? value}) =>
      FCrossAxisAlignment(value: value ?? this.value);

  CrossAxisAlignment _convertJsonToValue(String key) {
    switch (key) {
      case 'e':
        return CrossAxisAlignment.end;
      case 'c':
        return CrossAxisAlignment.center;
      case 'st':
        return CrossAxisAlignment.stretch;
      case 'b':
        return CrossAxisAlignment.baseline;
      default:
        return CrossAxisAlignment.start;
    }
  }

  String _convertValueToJson(CrossAxisAlignment value) {
    switch (value) {
      case CrossAxisAlignment.end:
        return 'e';
      case CrossAxisAlignment.center:
        return 'c';
      case CrossAxisAlignment.stretch:
        return 'st';
      case CrossAxisAlignment.baseline:
        return 'b';
      case CrossAxisAlignment.start:
        return 's';
    }
  }

  String _convertValueToDropDown(CrossAxisAlignment value) {
    switch (value) {
      case CrossAxisAlignment.end:
        return 'End';
      case CrossAxisAlignment.center:
        return 'Center';
      case CrossAxisAlignment.stretch:
        return 'Stretch';
      case CrossAxisAlignment.baseline:
        return 'Baseline';
      case CrossAxisAlignment.start:
        return 'Start';
    }
  }

  void _convertDropDownToValue(String newValue) {
    switch (newValue) {
      case 'Start':
        value = CrossAxisAlignment.start;
        break;
      case 'End':
        value = CrossAxisAlignment.end;
        break;
      case 'Center':
        value = CrossAxisAlignment.center;
        break;
      case 'Stretch':
        value = CrossAxisAlignment.stretch;
        break;
      case 'Baseline':
        value = CrossAxisAlignment.baseline;
        break;
      default:
        value = CrossAxisAlignment.start;
        break;
    }
  }

  String _convertValueToCode(CrossAxisAlignment? value) {
    switch (value) {
      case CrossAxisAlignment.end:
        return 'CrossAxisAlignment.end';
      case CrossAxisAlignment.center:
        return 'CrossAxisAlignment.center';
      case CrossAxisAlignment.stretch:
        return 'CrossAxisAlignment.stretch';
      case CrossAxisAlignment.baseline:
        return 'CrossAxisAlignment.baseline';
      case CrossAxisAlignment.start:
        return 'CrossAxisAlignment.start';
      case null:
        return 'CrossAxisAlignment.start';
    }
  }

  String toCode() => _convertValueToCode(get);

  /*String toCode() =>
      "FCrossAxisAlignment(aligns: [${convertValueToCode(aligns?[0])},${convertValueToCode(aligns?[1])},${convertValueToCode(aligns?[2])}])";*/
}
