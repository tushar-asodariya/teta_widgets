// Flutter imports:
import 'package:flutter/material.dart';
import 'package:teta_core/src/design_system/hex_color.dart';
import 'package:teta_core/teta_core.dart';

// ignore_for_file: public_member_api_docs

class WCircularProgressIndicator extends StatelessWidget {
  /// Returns a [Center] widget in Teta
  const WCircularProgressIndicator({
    Key? key,
    required this.node,
    required this.forPlay,
    required this.params,
    required this.states,
    required this.dataset,
    required this.fill,
    this.loop,
  }) : super(key: key);

  final CNode node;
  final bool forPlay;
  final int? loop;

  final FFill fill;

  final List<VariableObject> params;
  final List<VariableObject> states;
  final List<DatasetObject> dataset;

  @override
  Widget build(BuildContext context) {
    return NodeSelectionBuilder(
      node: node,
      forPlay: forPlay,
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(HexColor(fill.getHexColor(context))),
      ),
    );
  }
}
