// Flutter imports:
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:teta_core/teta_core.dart';

class WTextButton extends StatelessWidget {
  /// Returns a TextButton widget in Teta
  const WTextButton({
    Key? key,
    this.child,
    required this.node,
    required this.forPlay,
    this.loop,
    this.action,
    required this.params,
    required this.states,
    required this.dataset,
  }) : super(key: key);

  final CNode node;
  final CNode? child;
  final bool forPlay;
  final int? loop;
  final FAction? action;

  final List<VariableObject> params;
  final List<VariableObject> states;
  final List<DatasetObject> dataset;

  @override
  Widget build(BuildContext context) {
    return NodeSelectionBuilder(
      node: node,
      forPlay: forPlay,
      child: TextButton(
        onPressed: () => GestureBuilder.get(
          context: context,
          node: node,
          gesture: ActionGesture.onTap,
          actionValue: null,
          action: action,
          params: params,
          states: states,
          dataset: dataset,
          forPlay: forPlay,
        ),
        child: ChildConditionBuilder(
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
