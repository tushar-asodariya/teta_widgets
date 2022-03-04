// Flutter imports:
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
// Project imports:
import 'package:teta_core/src/design_system/dropdowns/dropdown.dart';
import 'package:teta_core/src/design_system/palette.dart';
import 'package:teta_core/src/design_system/text.dart';
import 'package:teta_widgets/src/elements/features/font_weight.dart';
import 'package:teta_widgets/src/elements/features/text_style.dart';
import 'package:teta_widgets/src/elements/nodes/node.dart';

class FontWeightControl extends StatefulWidget {
  const FontWeightControl({
    required this.node,
    required this.textStyle,
    required this.callBack,
    Key? key,
  }) : super(key: key);

  final CNode node;
  final FTextStyle textStyle;
  final Function(Map<String, dynamic>, Map<String, dynamic>) callBack;

  @override
  FontWeightControlState createState() => FontWeightControlState();
}

class FontWeightControlState extends State<FontWeightControl> {
  String? dropdown;

  @override
  void initState() {
    super.initState();
    dropdown = widget.textStyle.fontWeight!.getString;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: CText(
            'Font Weight',
            color: Palette.white,
            size: 12,
            weight: FontWeight.w500,
          ),
        ),
        CDropdown(
          value: dropdown,
          items: FFontWeight.getListDropDown,
          onChange: (newValue) {
            if (newValue != null) {
              setState(() {
                dropdown = newValue;
              });
              final old = FTextStyle.fromJson(widget.textStyle.toJson());
              widget.textStyle.fontWeight!.set(newValue);
              widget.callBack(widget.textStyle.toJson(), old.toJson());
            }
          },
        ),
      ],
    );
  }
}
