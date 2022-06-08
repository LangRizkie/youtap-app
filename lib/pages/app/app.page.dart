import 'package:application/modules/theme.module.dart';
import 'package:application/pages/movies/movies.page.dart';
import 'package:application/pages/profile/profile.page.dart';
import 'package:application/pages/television/television.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class App extends StatefulWidget {
  const App({Key? key, this.initialIndex = 0}) : super(key: key);

  final int initialIndex;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final PersistentTabController _tabController;

  final List<Widget> _tabScreen = [
    const MoviesPage(),
    const TelevisionPage(),
    const ProfilePage()
  ];

  final List<PersistentBottomNavBarItem> _tabItem = [
    PersistentBottomNavBarItem(
      icon: const Icon(FlutterRemix.movie_2_line),
      title: 'Movies',
      activeColorPrimary: Palettes.mint,
      inactiveColorPrimary: Palettes.aqua,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FlutterRemix.slideshow_3_line),
      title: 'Television',
      activeColorPrimary: Palettes.mint,
      inactiveColorPrimary: Palettes.aqua,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FlutterRemix.user_4_line),
      title: 'Television',
      activeColorPrimary: Palettes.mint,
      inactiveColorPrimary: Palettes.aqua,
    )
  ];

  @override
  void initState() {
    _tabController = PersistentTabController(initialIndex: widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _tabController,
        screens: _tabScreen,
        items: _tabItem,
        confineInSafeArea: false,
        navBarStyle: NavBarStyle.style12,
        backgroundColor: Palettes.nyctophile,
      ),
    );
  }
}
