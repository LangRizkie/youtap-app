import 'package:application/pages/television/section/section.television.dart';
import 'package:flutter/material.dart';

class TelevisionScreen extends StatefulWidget {
  const TelevisionScreen({Key? key, required this.television}) : super(key: key);

  final Map<String, dynamic> television;

  @override
  State<TelevisionScreen> createState() => _TelevisionScreenState();
}

class _TelevisionScreenState extends State<TelevisionScreen> {
  List<String>? menu;

  @override
  void initState() {
    menu = widget.television.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: List.generate(
          menu!.length, (index) => 
          Container(
            margin: EdgeInsets.only(
              bottom: index == menu!.length - 1 ? 16 : 0
            ),
            child: SectionTelevision(menu: widget.television[menu![index]]),
          ),
        ),
      ),
    );
  }
}
