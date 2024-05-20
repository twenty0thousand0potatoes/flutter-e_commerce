import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class SCurveEdgeWidget extends StatelessWidget {
  const SCurveEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SCustomCurvedEdges(),
      child: child,
    );
  }
}
