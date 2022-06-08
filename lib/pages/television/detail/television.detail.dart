import 'package:application/components/image/image_network.component.dart';
import 'package:application/modules/global.module.dart';
import 'package:application/modules/routing.module.dart';
import 'package:flutter/material.dart';

class TelevisionDetailPage extends StatefulWidget {
  const TelevisionDetailPage({Key? key}) : super(key: key);

  @override
  State<TelevisionDetailPage> createState() => _TelevisionDetailPageState();
}

class _TelevisionDetailPageState extends State<TelevisionDetailPage> {
  @override
  Widget build(BuildContext context) {
    DetailArgument args =
        ModalRoute.of(context)!.settings.arguments as DetailArgument;

    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: '${args.key}#${args.posterPath}',
          child: ImageNetwork(
            imageUrl: Global.getPoster(args.posterPath!),
          ),
        ),
      ),
    );
  }
}
