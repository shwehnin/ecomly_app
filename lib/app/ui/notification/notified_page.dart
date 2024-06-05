import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NotifiedPage extends StatefulWidget {
  final String? label;
  const NotifiedPage({super.key, this.label});

  @override
  State<NotifiedPage> createState() => _NotifiedPageState();
}

class _NotifiedPageState extends State<NotifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.grey[600] : Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? Colors.white : Colors.white,
          ),
        ),
        title: Text(
          widget.label.toString().split("|")[0],
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Get.isDarkMode ? Colors.white : Colors.grey[400],
          ),
          child: Center(
            child: Text(
              widget.label.toString().split("|")[1],
              style: TextStyle(
                color: Get.isDarkMode ? Colors.black : Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
