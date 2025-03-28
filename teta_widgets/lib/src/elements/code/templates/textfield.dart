// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:teta_widgets/src/elements/code/snippets.dart';
import 'package:teta_widgets/src/elements/controls/key_constants.dart';
import 'package:teta_widgets/src/elements/features/actions/enums/gestures.dart';
import 'package:teta_widgets/src/elements/features/fill.dart';
import 'package:teta_widgets/src/elements/features/text_type_input.dart';
import 'package:teta_widgets/src/elements/nodes/node.dart';
import 'package:teta_widgets/src/elements/nodes/node_body.dart';

/// TextField Template
String textFieldCodeTemplate(
  final int pageId,
  final BuildContext context,
  final NodeBody body,
  final CNode node,
  final CNode? child,
  final int loop,
) {
  final labelText =
      (body.attributes[DBKeys.labelText] as FTextTypeInput).toCode(loop);
  final valueMaxLines =
      (body.attributes[DBKeys.maxLines] as FTextTypeInput).getRawToCode(loop);
  final maxLines = int.tryParse(valueMaxLines) ?? 1;
  final valueMinLines =
      (body.attributes[DBKeys.minLines] as FTextTypeInput).getRawToCode(loop);
  final minLines = int.tryParse(valueMinLines) ?? 1;
  final valueMaxLenght =
      (body.attributes[DBKeys.maxLenght] as FTextTypeInput).getRawToCode(loop);
  final maxLenght = int.tryParse(valueMaxLenght);
  final obscureText = body.attributes[DBKeys.obscureText] as bool? ?? false;
  final showCursor = body.attributes[DBKeys.showCursor] as bool? ?? false;
  final autoCorrect = body.attributes[DBKeys.autoCorrect] as bool? ?? false;
  final fillToCodeColor = FFill.toCode(
    body.attributes[DBKeys.fill] as FFill,
    context,
    flagConst: false,
  );
  final bordersEnabled = body.attributes[DBKeys.showBorders] as bool? ?? false;
  final enabledBorderToCodeColor = FFill.toCode(
    body.attributes[DBKeys.enabledBorderColor] as FFill,
    context,
    flagConst: false,
  );
  final focusedBorderToCodeColor = FFill.toCode(
    body.attributes[DBKeys.focusedBorderColor] as FFill,
    context,
    flagConst: false,
  );
  final valueBordersSize =
      (body.attributes[DBKeys.bordersSize] as FTextTypeInput)
          .getRawToCode(loop);
  final borderSize = double.tryParse(valueBordersSize) ?? 1;

  return """
  Container(
    ${CS.margin(context, body, isMargin: true)}
    ${CS.size(context, body, isWidth: true)}
    ${CS.boxDecoration(context, body, DBKeys.fill)}
    child: TextField(
      ${CS.action(
    pageId,
    context,
    node,
    ActionGesture.onChange,
    'onChanged: (String value) async',
    null,
    isRequired: true,
    loop: loop,
    withValue: true,
  )}
      ${CS.action(
    pageId,
    context,
    node,
    ActionGesture.onSubmitted,
    'onSubmitted: (String value) async',
    null,
    isRequired: false,
    loop: loop,
    withValue: true,
  )}
      decoration: InputDecoration(
        filled: true,
        ${fillToCodeColor != null ? fillToCodeColor.replaceAll('color', 'fillColor') : ''}
        counterStyle: TextStyle(
                $fillToCodeColor),
        border: OutlineInputBorder(
          ${CS.borderRadius(context, body)}
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(${bordersEnabled ? enabledBorderToCodeColor ?? 'color: Colors.transparent,' : 'color: Colors.transparent,'} width: $borderSize),
          ${CS.borderRadius(context, body)}
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(${bordersEnabled ? focusedBorderToCodeColor ?? 'color: Colors.transparent,' : 'color: Colors.transparent,'} width: $borderSize),
          ${CS.borderRadius(context, body)}
        ),  
        hintText: r$labelText,
        ${CS.margin(context, body, isMargin: false).replaceAll('padding', 'contentPadding')}
      ),
      ${CS.textStyle(context, body, DBKeys.textStyle)}
      maxLines: $maxLines,
      minLines: $minLines,
      maxLength: $maxLenght,
      obscureText: $obscureText,
      showCursor: $showCursor,
      autocorrect: $autoCorrect,
    ),
  )
  """;
}
