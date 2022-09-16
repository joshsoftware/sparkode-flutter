import 'package:flutter/material.dart';

class DriveCardView extends StatefulWidget {
  const DriveCardView({Key? key}) : super(key: key);

  @override
  State<DriveCardView> createState() => _DriveCardViewState();
}

class _DriveCardViewState extends State<DriveCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Drive Data"),
    );
  }
}


