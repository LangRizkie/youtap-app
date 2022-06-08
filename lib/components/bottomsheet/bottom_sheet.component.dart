import 'package:flutter/material.dart';

class CustomBottomSheet {
  static Future openModalBottomSheet(context, { required Widget child }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (context) => child,
    );
  }
}