import 'package:flutter/material.dart';
import 'package:simple_post_app/presentation/views/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home", showBackButton: false,),
      body: Column(
        children: [
          Text("This is home")
        ],
      ),
    );
  }
}
