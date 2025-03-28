// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:teta_widgets/src/elements/controls/key_constants.dart';
import 'package:teta_widgets/src/elements/features/fill.dart';
import 'package:teta_widgets/src/elements/nodes/node_body.dart';

/// CircularProgressIndicator Template
String circularProgressIndicatorCodeTemplate(
  final BuildContext context,
  final NodeBody body,
  final int? loop,
) {
  final fill = body.attributes[DBKeys.fill] as FFill;
  final hex = fill.getHexColor(context);

  return '''
    CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFF$hex).withOpacity(${fill.levels?.first.opacity ?? '1'})),
    )
  ''';
}
