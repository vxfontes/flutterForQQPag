import 'package:flutter/material.dart';

class CheckoutTitle extends StatelessWidget {
  final String text;
  const CheckoutTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MainTitle extends StatelessWidget {
  final String text;
  const MainTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Caveat",
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
