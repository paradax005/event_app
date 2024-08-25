import 'package:event_app/core/routes/app_routes.dart';
import 'package:event_app/features/event/presentation/tabs/event_tab.dart';
import 'package:event_app/global/theme/theme.dart';
import 'package:event_app/global/utils/media_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyEventScreen extends StatefulWidget {
  const MyEventScreen({super.key});

  @override
  State<MyEventScreen> createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<MyEventScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Add New Event',
            style: theme.textTheme.displaySmall,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(addEventPage);
                },
                child: SvgPicture.asset(
                  MediaRes.addIcon,
                  height: 32,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: borderColor),
                ),
                child: TabBar(
                  tabs: const [
                    Tab(text: 'Scheduled Events'),
                    Tab(text: 'Completed Events'),
                  ],
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: appPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                  labelStyle: theme.textTheme.displaySmall,
                  unselectedLabelStyle: theme.textTheme.displaySmall,
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  EventTab(isComingSoon: true),
                  EventTab(isComingSoon: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
