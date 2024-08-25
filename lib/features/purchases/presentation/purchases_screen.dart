import 'package:event_app/features/purchases/presentation/tabs/purchase_tab.dart';
import 'package:event_app/global/theme/theme.dart';
import 'package:flutter/material.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'My Events',
              style: theme.textTheme.displaySmall,
            ),
            centerTitle: true,
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
                      Tab(text: 'Purchases'),
                      Tab(text: 'History'),
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
                    PurchaseTab(isComingSoon: true),
                    PurchaseTab(isComingSoon: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
