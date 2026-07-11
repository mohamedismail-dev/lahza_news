import 'package:flutter/material.dart';
import 'package:lahza_news/data/api/api_manager.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/no_connection.svg",
            width: width * 0.5,
            height: hight * 0.20,
          ),
          errorMessage.isEmpty
              ? Text(
                  S.of(context).noConnection,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: SizedBox(
                    child: Text(
                      errorMessage,
                      style: Theme.of(context).textTheme.titleSmall,
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
