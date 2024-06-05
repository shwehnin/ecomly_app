import 'package:flutter/material.dart';
import 'package:my_task/app/theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Text(
                  "Pick Your Favourite",
                  style: titleStyle,
                ),
                Text(
                  "Contest",
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
