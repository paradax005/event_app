import 'package:event_app/features/home/presentation/utils/event_seeder.dart';
import 'package:event_app/features/home/presentation/widgets/event_list_view.dart';
import 'package:event_app/features/home_tab/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final latestEvent = EventSeeders.eventList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                eventHeadline(theme, 'Latest Events'),
                EventListView(eventList: latestEvent),
                const SizedBox(height: 20),
                eventHeadline(theme, 'Trending Events'),
                EventListView(eventList: latestEvent),
                const SizedBox(height: 20),
                eventHeadline(theme, 'Events in Tunis'),
                EventListView(eventList: latestEvent),
                const SizedBox(height: 20),
                eventHeadline(theme, 'Events in Sousse'),
                EventListView(eventList: latestEvent),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget eventHeadline(ThemeData themeData, String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: themeData.textTheme.displayMedium,
      ),
    );
  }
}
