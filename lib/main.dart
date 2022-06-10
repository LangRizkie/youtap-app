import 'package:application/models/movie_detail.model.dart';
import 'package:application/models/movies.model.dart';
import 'package:application/models/review.model.dart';
import 'package:application/models/television.model.dart';
import 'package:application/models/television_detail.model.dart';
import 'package:application/modules/global.module.dart';
import 'package:application/modules/routing.module.dart';
import 'package:application/modules/theme.module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    ModularApp(
      module: AppModule(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Movies()),
          ChangeNotifierProvider(create: (_) => MovieDetail()),
          ChangeNotifierProvider(create: (_) => Television()),
          ChangeNotifierProvider(create: (_) => TelevisionDetail()),
          ChangeNotifierProvider(create: (_) => Review()),
        ],
        child: const Application(),
      ),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Global.context = context;

    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeApp.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
