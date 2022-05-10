import 'package:flutter/material.dart';
import 'package:mirai_app/pages/AR_Camera.dart';

class ARfilter extends StatelessWidget {
  const ARfilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('Coba AR'),
            onPressed: () {
              Navigator.pushNamed(context, '/ar');
            }),
      ),
    );
  }
}
