import 'package:flutter/material.dart';
import 'package:lahza_news/api/api_manager.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                child: Text(
                  errorMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: .center,
                ),
              ),
            ),

            FilledButton(
              onPressed: () {
                onPressed;
              },
              child: Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }
}
