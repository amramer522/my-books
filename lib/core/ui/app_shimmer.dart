import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/colors.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.shimmerHighlight,
        child: child,
      ),
    );
  }
}
