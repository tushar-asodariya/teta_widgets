// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:teta_widgets/src/elements/code/snippets.dart';
import 'package:teta_widgets/src/elements/controls/key_constants.dart';
import 'package:teta_widgets/src/elements/features/fill.dart';
import 'package:teta_widgets/src/elements/features/text_type_input.dart';
import 'package:teta_widgets/src/elements/nodes/node.dart';
import 'package:teta_widgets/src/elements/nodes/node_body.dart';

/// Card Template
String cardCodeTemplate(
  final BuildContext context,
  final NodeBody body,
  final CNode? child,
  final int? loop,
) {
  final abstract = body.attributes[DBKeys.value] as FTextTypeInput;
  final value = abstract.toCode(loop);
  final elevation = double.tryParse(value) != null ? double.parse(value) : '1';
  final fill = body.attributes[DBKeys.fill] as FFill;
  final hex = fill.getHexColor(context);

  return '''
    Card(
      elevation: $elevation,
      color: Color(0xFF$hex).withOpacity(${fill.levels?.first.opacity ?? '1'}),
      ${CS.shapeCardBorderRadius(context, body)}
      ${CS.child(context, child, comma: true)}
    )
  ''';
}
