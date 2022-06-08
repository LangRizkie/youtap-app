import 'package:application/modules/theme.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Icon(
              FlutterRemix.delete_bin_2_fill,
              color: Palettes.nyctophile,
              size: 40,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Not Found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Palettes.nyctophile,
              ),
            ),
          )
        ],
      ),
    );
  }
}
