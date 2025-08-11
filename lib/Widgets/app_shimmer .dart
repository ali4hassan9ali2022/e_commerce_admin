import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, required this.text, this.fontSize});
final String text;
final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 10),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize ?? 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
