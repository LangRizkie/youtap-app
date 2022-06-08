import 'package:application/modules/theme.module.dart';
import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({
    Key? key, 
    this.size = 50, 
    this.strokeWidth = 2, 
    this.invert = false,
  }) : super(key: key);

  final double? size;
  final double? strokeWidth;
  final bool invert;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth!,
          valueColor: AlwaysStoppedAnimation<Color>(
            invert ? Colors.white : Palettes.black,
          ),
        ),
      ),
    );
  }
}