// Flutter imports:

// Package imports:
import 'package:badges/badges.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:teta_core/teta_core.dart';
// Project imports:
import 'package:teta_widgets/src/elements/index.dart';

// ignore_for_file: public_member_api_docs

class WBadge extends StatelessWidget {
  /// Returns a [Badge] widget in Teta
  const WBadge(
    final Key? key, {
    required this.value,
    required this.node,
    required this.textStyle,
    required this.fill,
    required this.forPlay,
    required this.params,
    required this.states,
    required this.dataset,
    this.child,
    this.loop,
  }) : super(key: key);

  final CNode node;
  final CNode? child;
  final FTextTypeInput value;
  final FTextStyle textStyle;
  final FFill fill;
  final bool forPlay;
  final int? loop;

  final List<VariableObject> params;
  final List<VariableObject> states;
  final List<DatasetObject> dataset;

  @override
  Widget build(final BuildContext context) {
    return NodeSelectionBuilder(
      node: node,
      forPlay: forPlay,
      child: Badge(
        badgeContent: TextBuilder(
          textStyle: textStyle,
          value: value,
          params: params,
          states: states,
          dataset: dataset,
          forPlay: forPlay,
        ),
        badgeColor: HexColor(fill.getHexColor(context)),
        child: ChildConditionBuilder(
          ValueKey('${node.nid} $loop'),
          name: node.intrinsicState.displayName,
          child: child,
          params: params,
          states: states,
          dataset: dataset,
          forPlay: forPlay,
          loop: loop,
        ),
      ),
    );
  }
}
