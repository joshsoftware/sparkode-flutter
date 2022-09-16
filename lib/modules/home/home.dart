import 'package:flutter/material.dart';
import 'package:sparkode/modules/home/drive_card_view.dart';
import 'package:sparkode/utility/constants/strings.dart';

import '../../models/drive_model/drive_response_model.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: Strings.ongoingDrive),
  Tab(text: Strings.upcomingDrive),
  Tab(text: Strings.completedDrive),
];

const int count1 = 2;
const int count2 = 3;
const int count3 = 4;
int count = count1;

List<Drive> drive1 = [
  Drive(
      id: 1,
      name: "Sample Drive 1",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
  Drive(
      id: 2,
      name: "Sample Drive 2",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
  Drive(
      id: 3,
      name: "Sample Drive 3",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
];

List<Drive> drive2 = [
  Drive(
      id: 1,
      name: "Sample Drive 1",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
  Drive(
      id: 2,
      name: "Sample Drive 2",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
];

List<Drive> drive3 = [
  Drive(
      id: 1,
      name: "Sample Drive 1",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
  Drive(
      id: 2,
      name: "Sample Drive 2",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
  Drive(
      id: 3,
      name: "Sample Drive 3",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
  Drive(
      id: 4,
      name: "Sample Drive 4",
      startTime: DateTime.now(),
      invitationSent: 100,
      endTime: DateTime.now(),
      appeared: 100,
      totalSubmissions: 300,
      uuid: "07f2f398c6b4c770b4bcef25fdbb1dde"),
];

List<Drive> list = drive1;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setState(() {
              switch (tabController.index) {
                case 0:
                  list = drive1;
                  break;
                case 1:
                  list = drive2;
                  break;
                case 2:
                  list = drive3;
                  break;
              }
            });
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
              return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DriveCardView(drive: list[index]);
                  });
            }).toList(),
          ),
        );
      }),
    );
  }
}
