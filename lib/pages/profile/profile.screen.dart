import 'package:application/components/image/image_network.component.dart';
import 'package:application/modules/theme.module.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: ImageNetwork(
                  imageUrl: 'https://i.pravatar.cc/300'
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Gilang Rizkie',
                style: TextStyle(
                  color: Palettes.nyctophile,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}