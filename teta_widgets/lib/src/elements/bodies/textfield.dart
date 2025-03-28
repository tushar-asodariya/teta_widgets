// Flutter imports:
// ignore_for_file: lines_longer_than_80_chars

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:teta_core/gen/assets.gen.dart';
import 'package:teta_core/src/models/dataset.dart';
import 'package:teta_core/src/models/variable.dart';
// Project imports:
import 'package:teta_widgets/src/elements/code/templates/textfield.dart';
import 'package:teta_widgets/src/elements/controls/control_model.dart';
import 'package:teta_widgets/src/elements/controls/key_constants.dart';
import 'package:teta_widgets/src/elements/controls/type.dart';
import 'package:teta_widgets/src/elements/features/action.dart';
import 'package:teta_widgets/src/elements/features/actions/enums/gestures.dart';
import 'package:teta_widgets/src/elements/features/border_radius.dart';
import 'package:teta_widgets/src/elements/features/fill.dart';
import 'package:teta_widgets/src/elements/features/keyboard_type.dart';
import 'package:teta_widgets/src/elements/features/margins.dart';
import 'package:teta_widgets/src/elements/features/sizes.dart';
import 'package:teta_widgets/src/elements/features/text_style.dart';
import 'package:teta_widgets/src/elements/features/text_type_input.dart';
import 'package:teta_widgets/src/elements/intrinsic_states/class.dart';
import 'package:teta_widgets/src/elements/nodes/categories.dart';
import 'package:teta_widgets/src/elements/nodes/children_enum.dart';
import 'package:teta_widgets/src/elements/nodes/enum.dart';
import 'package:teta_widgets/src/elements/nodes/node.dart';
import 'package:teta_widgets/src/elements/nodes/node_body.dart';
import 'package:teta_widgets/src/elements/widgets/textfield.dart';

/// GlobalType for TextField widget
const _globalType = NType.textField;

/// IntrinsicStates for TextField widget
final textFieldIntrinsicStates = IntrinsicStates(
  nodeIcon: Assets.wIcons.textfield,
  nodeVideo: null,
  nodeDescription: null,
  advicedChildren: [],
  blockedTypes: [],
  synonymous: ['textfield', 'form', 'input'],
  advicedChildrenCanHaveAtLeastAChild: [],
  displayName: NodeType.name(_globalType),
  type: _globalType,
  category: NodeCategories.input,
  maxChildren: 0,
  canHave: ChildrenEnum.none,
  addChildLabels: [],
  gestures: [ActionGesture.onChange, ActionGesture.onSubmitted],
  permissions: [],
  packages: [],
);

class TextFieldBody extends NodeBody {
  @override
  // ignore: overridden_fields
  Map<String, dynamic> attributes = <String, dynamic>{
    DBKeys.value: FTextTypeInput(),
    DBKeys.labelText: FTextTypeInput(value: 'Placeholder'),
    DBKeys.textStyle: FTextStyle(),
    DBKeys.margins: FMargins(margins: ['16', '8', '16', '8']),
    DBKeys.padding: FMargins(margins: ['16', '0', '0', '0']),
    DBKeys.fill: FFill(),
    DBKeys.width: FSize(size: 'max'),
    DBKeys.maxLines: FTextTypeInput(value: '1'),
    DBKeys.minLines: FTextTypeInput(value: '1'),
    DBKeys.maxLenght: FTextTypeInput(),
    DBKeys.bordersSize: FTextTypeInput(value: '1'),
    DBKeys.keyboardType: FKeyboardType(),
    DBKeys.borderRadius: FBorderRadius(),
    DBKeys.showCursor: true,
    DBKeys.autoCorrect: false,
    DBKeys.obscureText: false,
    DBKeys.showBorders: false,
    DBKeys.enabledBorderColor: FFill(),
    DBKeys.focusedBorderColor: FFill(),
    DBKeys.action: FAction(),
    DBKeys.cursorColor: FFill(),
    DBKeys.hintTextColor: FFill(),
  };

  @override
  List<ControlModel> get controls => [
        ControlObject(
          type: ControlType.action,
          key: DBKeys.action,
          value: attributes[DBKeys.action],
        ),
        ControlObject(
          type: ControlType.margins,
          key: DBKeys.margins,
          value: attributes[DBKeys.margins],
        ),
        ControlObject(
          type: ControlType.padding,
          key: DBKeys.padding,
          value: attributes[DBKeys.padding],
        ),
        ControlObject(
          type: ControlType.value,
          key: DBKeys.value,
          value: attributes[DBKeys.value],
        ),
        ControlObject(
          title: 'Hint text',
          type: ControlType.value,
          key: DBKeys.labelText,
          value: attributes[DBKeys.labelText],
          description:
              'Text that suggests what sort of input the field accepts.',
        ),
        ControlObject(
          type: ControlType.text,
          key: DBKeys.textStyle,
          value: attributes[DBKeys.textStyle],
        ),
        FillControlObject(
          title: 'Background',
          key: DBKeys.fill,
          value: attributes[DBKeys.fill] as FFill,
          isStyled: false,
          isImageEnabled: false,
          isNoneEnabled: false,
          isOnlySolid: true,
        ),
        ControlObject(
          type: ControlType.borderRadius,
          key: DBKeys.borderRadius,
          value: attributes[DBKeys.borderRadius],
        ),
        FlagControlObject(
          title: 'Enable Borders',
          key: DBKeys.showBorders,
          value: attributes[DBKeys.showBorders] as bool,
          description: 'Show borders around the textfield (only in play mode)',
        ),
        ControlObject(
          type: ControlType.value,
          title: 'Borders Size',
          key: DBKeys.bordersSize,
          value: attributes[DBKeys.bordersSize],
          description: 'Borders thickness',
        ),
        FillControlObject(
          title: 'Enabled Border Color',
          key: DBKeys.enabledBorderColor,
          value: attributes[DBKeys.enabledBorderColor] as FFill,
          isStyled: false,
          isImageEnabled: false,
          isNoneEnabled: false,
          isOnlySolid: true,
        ),
        FillControlObject(
          title: 'Focused Border Color',
          key: DBKeys.focusedBorderColor,
          value: attributes[DBKeys.focusedBorderColor] as FFill,
          isStyled: false,
          isImageEnabled: false,
          isNoneEnabled: false,
          isOnlySolid: true,
        ),
        FlagControlObject(
          title: 'Obscure Text',
          key: DBKeys.obscureText,
          value: attributes[DBKeys.obscureText] as bool,
          description:
              'Whether to hide the text being edited (e.g., for passwords).',
        ),
        FlagControlObject(
          title: 'Auto Correct',
          key: DBKeys.autoCorrect,
          value: attributes[DBKeys.autoCorrect] as bool,
          description: 'Whether to enable autocorrection.',
        ),
        FlagControlObject(
          title: 'Show Cursor',
          key: DBKeys.showCursor,
          value: attributes[DBKeys.showCursor] as bool,
          description: 'Whether to show cursor.',
        ),
        ControlObject(
          type: ControlType.value,
          title: 'Max Lines',
          key: DBKeys.maxLines,
          value: attributes[DBKeys.maxLines],
          description:
              'The maximum number of lines to show at one time, wrapping if necessary.',
        ),
        ControlObject(
          type: ControlType.value,
          title: 'Min Lines',
          key: DBKeys.minLines,
          value: attributes[DBKeys.minLines],
          description:
              'The minimum number of lines to occupy when the content spans fewer lines.',
        ),
        ControlObject(
          type: ControlType.value,
          title: 'Max Length',
          key: DBKeys.maxLenght,
          value: attributes[DBKeys.maxLenght],
          description:
              'The maximum number of characters to allow in the text field.',
        ),
      ];

  @override
  Widget toWidget({
    required final List<VariableObject> params,
    required final List<VariableObject> states,
    required final List<DatasetObject> dataset,
    required final bool forPlay,
    required final CNode node,
    final int? loop,
    final CNode? child,
    final List<CNode>? children,
  }) =>
      WTextField(
        ValueKey(
          '''
            ${node.nid}
            $loop
            ${child ?? children}
            ${(attributes[DBKeys.value] as FTextTypeInput? ?? FTextTypeInput()).toJson()}
            ${(attributes[DBKeys.textStyle] as FTextStyle? ?? FTextStyle()).toJson()}
            ${(attributes[DBKeys.labelText] as FTextTypeInput? ?? FTextTypeInput()).toJson()}
            ${(attributes[DBKeys.fill] as FFill).toJson()}
            ${(attributes[DBKeys.width] as FSize).toJson()}
            ${(attributes[DBKeys.margins] as FMargins).toJson()}
            ${(attributes[DBKeys.padding] as FMargins).toJson()}
            ${(attributes[DBKeys.action] as FAction).toJson()}
            ${(attributes[DBKeys.keyboardType] as FKeyboardType? ?? FKeyboardType()).toJson()}
            ${(attributes[DBKeys.borderRadius] as FBorderRadius).toJson()}
            ${(attributes[DBKeys.maxLenght] as FTextTypeInput?)?.toJson()}
            ${(attributes[DBKeys.maxLines] as FTextTypeInput?)?.toJson()}
            ${(attributes[DBKeys.minLines] as FTextTypeInput?)?.toJson()}
            ${(attributes[DBKeys.cursorColor] as FFill?)?.toJson()}
            ${(attributes[DBKeys.enabledBorderColor] as FFill?)?.toJson()}
            ${(attributes[DBKeys.focusedBorderColor] as FFill?)?.toJson()}
            ${(attributes[DBKeys.hintTextColor] as FFill?)?.toJson()}
            ${attributes[DBKeys.showCursor] as bool? ?? false}
            ${attributes[DBKeys.autoCorrect] as bool? ?? false}
            ${attributes[DBKeys.obscureText] as bool? ?? false}
            ${attributes[DBKeys.showBorders] as bool? ?? false}
            ''',
        ),
        node: node,
        value: attributes[DBKeys.value] as FTextTypeInput? ?? FTextTypeInput(),
        textStyle: attributes[DBKeys.textStyle] as FTextStyle? ?? FTextStyle(),
        labelText:
            attributes[DBKeys.labelText] as FTextTypeInput? ?? FTextTypeInput(),
        fill: attributes[DBKeys.fill] as FFill,
        width: attributes[DBKeys.width] as FSize,
        margins: attributes[DBKeys.margins] as FMargins,
        paddings: attributes[DBKeys.padding] as FMargins,
        action: attributes[DBKeys.action] as FAction,
        keyboardType: attributes[DBKeys.keyboardType] as FKeyboardType,
        borderRadius: attributes[DBKeys.borderRadius] as FBorderRadius,
        maxLenght: attributes[DBKeys.maxLenght] as FTextTypeInput,
        maxLines: attributes[DBKeys.maxLines] as FTextTypeInput,
        minLines: attributes[DBKeys.minLines] as FTextTypeInput,
        showCursor: attributes[DBKeys.showCursor] as bool? ?? false,
        autoCorrect: attributes[DBKeys.autoCorrect] as bool? ?? false,
        obscureText: attributes[DBKeys.obscureText] as bool? ?? false,
        cursorColor: attributes[DBKeys.cursorColor] as FFill,
        hintTextColor: attributes[DBKeys.hintTextColor] as FFill,
        enabledBorderColor: attributes[DBKeys.enabledBorderColor] as FFill,
        focusedBorderColor: attributes[DBKeys.focusedBorderColor] as FFill,
        showBorders: attributes[DBKeys.showBorders] as bool? ?? false,
        bordersSize: attributes[DBKeys.bordersSize] as FTextTypeInput,
        forPlay: forPlay,
        loop: loop,
        params: params,
        states: states,
        dataset: dataset,
      );

  @override
  String toCode(
    final BuildContext context,
    final CNode node,
    final CNode? child,
    final List<CNode>? children,
    final int pageId,
    final int? loop,
  ) =>
      textFieldCodeTemplate(pageId, context, this, node, child, loop ?? 0);
}
