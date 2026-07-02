import 'package:flutter/material.dart';
import 'package:lahza_news/widgets/main_loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewFullNews extends StatefulWidget {
  final url;
  ViewFullNews({super.key, required this.url});

  @override
  State<ViewFullNews> createState() => _ViewFullNewsState();
}

class _ViewFullNewsState extends State<ViewFullNews> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            isLoading ? const Center(child: MainLoading()) : Container(),
          ],
        ),
      ),
    );
  }
}
