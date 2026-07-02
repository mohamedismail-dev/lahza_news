import 'package:flutter/material.dart';
import 'package:lahza_news/api/api_manager.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

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
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        spacing: hight * 0.01,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/no_connection.svg",
            width: width * 0.5,
          ),
          errorMessage.isEmpty
              ? Text(
                  S.of(context).noConnection,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              : Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    child: Text(
                      errorMessage,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

          OutlinedButton(
            onPressed: () {
              onPressed();
            },
            child: Text(S.of(context).TryAgain),
          ),
        ],
      ),
    );
  }
}
