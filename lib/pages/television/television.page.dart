import 'package:application/components/loading/circular.component.dart';
import 'package:application/modules/global.module.dart';
import 'package:application/pages/television/television.screen.dart';
import 'package:flutter/material.dart';

class TelevisionPage extends StatefulWidget {
  const TelevisionPage({Key? key}) : super(key: key);

  @override
  State<TelevisionPage> createState() => _TelevisionPageState();
}

class _TelevisionPageState extends State<TelevisionPage> {
  Future? asyncData;
  Map<String, dynamic>? menu;

  @override
  void initState() {
    asyncData = Future.wait([getTelevisionMenu()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: asyncData,
      builder: (BuildContext context, AsyncSnapshot snapshot) =>
        snapshot.connectionState != ConnectionState.done ?
          const Center(
            child: LoadingCircular(),
          ) : 
          TelevisionScreen(television: menu!)
      );
  }

  Future getTelevisionMenu() async {
    await Global.getJSON('assets/json/television.endpoint.json')
        .then((response) => menu = response);
  }
}
