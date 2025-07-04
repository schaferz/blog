import 'package:flutter/material.dart';

/// Folyamatot, tipikusan betöltést jelző widget.
class TerLoadingIndicator extends StatefulWidget {
  const TerLoadingIndicator({super.key});

  @override
  State<TerLoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<TerLoadingIndicator> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..addListener(() {
        setState(() {});
      })
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 16.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
