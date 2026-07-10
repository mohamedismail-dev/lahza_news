import 'package:flutter/material.dart';
import 'package:lahza_news/model/source_response.dart';
import 'package:lahza_news/news/news_widget.dart';

class SourcesWidget extends StatefulWidget {
  final List<Source> sources;

  const SourcesWidget({super.key, required this.sources});

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelColor: Theme.of(context).colorScheme.onPrimary,
            tabAlignment: .start,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
            dividerColor: Colors.transparent,
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            tabs: [for (var source in widget.sources) Tab(text: source.name)],
          ),
          // Expanded(child: NewsWidget(source: widget.sources[selectedIndex])),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(), // لإضافة مرونة عند السحب
              children: widget.sources
                  .map((source) => NewsWidget(source: source))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
