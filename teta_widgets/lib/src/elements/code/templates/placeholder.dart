// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:teta_widgets/src/elements/code/snippets.dart';
import 'package:teta_widgets/src/elements/controls/key_constants.dart';
import 'package:teta_widgets/src/elements/features/fill.dart';
import 'package:teta_widgets/src/elements/features/sizes.dart';
import 'package:teta_widgets/src/elements/features/text_type_input.dart';
import 'package:teta_widgets/src/elements/nodes/node.dart';
import 'package:teta_widgets/src/elements/nodes/node_body.dart';

/// Placeholder Template
String placeholderCodeTemplate(
  final BuildContext context,
  final NodeBody body,
  final CNode? child,
  final int? loop,
) {
  final abstract = body.attributes[DBKeys.value] as FTextTypeInput;
  final value = abstract.toCode(loop);
  final strokeWidth =
      double.tryParse(value) != null ? double.parse(value) : 2.0;
  final fill = body.attributes[DBKeys.fill] as FFill;
  final hex = fill.getHexColor(context);
  return '''
    Placeholder(
      strokeWidth: $strokeWidth,
      color: Color(0xFF$hex).withOpacity(${fill.levels?.first.opacity ?? '1'}),
      fallbackWidth: ${(body.attributes[DBKeys.width] as FSize).size},
      fallbackHeight: ${(body.attributes[DBKeys.height]as FSize).size},
      ${CS.child(context, child, comma: true)}
    )
  ''';
}
