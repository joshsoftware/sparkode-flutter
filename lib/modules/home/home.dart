import 'package:flutter/material.dart';
import 'package:sparkode/modules/home/drive_card_view.dart';
import 'package:sparkode/utility/constants/strings.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: Strings.ongoingDrive),
  Tab(text: Strings.upcomingDrive),
  Tab(text: Strings.completedDrive),
];

const int count1 = 2;
const int count2 = 3;
const int count3 = 4;
int count = count1;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 1,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
            switch (tabController.index) {
              case 0:
                count = count1;
                break;
              case 1:
                count = count2;
                break;
              case 2:
                count = count3;
                break;
            }
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return ListView.builder(itemCount: count,itemBuilder: (BuildContext context,int index){
                return const DriveCardView();
              });
            }).toList(),
          ),
        );
      }),
    );
  }
}
