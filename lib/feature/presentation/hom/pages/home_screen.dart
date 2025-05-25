
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Welcome To Home Screen ",style: AppStyles.bold32primary,),
    );
  }
}
