import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sparkode/modules/home/drive_card_view.dart';
import 'package:sparkode/utility/constants/strings.dart';
import 'package:sparkode/utility/navigator/navigation_pages.dart';
import 'package:sparkode/utility/navigator/navigator.dart';
import '../../models/drive_model/drive_response_model.dart';
import '../../services/home_services.dart';
import '../../utility/constants/colors.dart';
import '../../utility/helpers/APIHelper/api_response_model.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: Strings.ongoingDrive),
  Tab(text: Strings.upcomingDrive),
  Tab(text: Strings.completedDrive),
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var homeServices = HomeServices();

  late ValueNotifier<List<Drive>> list;
  late List<Drive> ongoingDrive;
  late List<Drive> completedDrive;
  late List<Drive> upcomingDrive;

  bool isLoading = true;

  late Future<List<ResponseModel>> results = Future.wait([
    homeServices.getDrives("ongoing_drives"),
    homeServices.getDrives("upcoming_drives"),
    homeServices.getDrives("completed_drives"),
  ]);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: results,
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.done &&
              asyncSnapshot.hasData) {
            ongoingDrive = DriveResponseModel.fromJson(
                    (asyncSnapshot.data[0] as ResponseModel).data
                        as Map<String, dynamic>)
                .data
                .drives;
            upcomingDrive = DriveResponseModel.fromJson(
                    (asyncSnapshot.data[1] as ResponseModel).data
                        as Map<String, dynamic>)
                .data
                .drives;
            completedDrive = DriveResponseModel.fromJson(
                    (asyncSnapshot.data[2] as ResponseModel).data
                        as Map<String, dynamic>)
                .data
                .drives;
            if (isLoading) {
              list = ValueNotifier(ongoingDrive);
              isLoading = false;
            }

            return DefaultTabController(
              length: tabs.length,
              initialIndex: 0,
              child: Builder(builder: (BuildContext context) {
                final TabController tabController =
                    DefaultTabController.of(context)!;
                tabController.addListener(() {
                  if (!tabController.indexIsChanging) {
                    switch (tabController.index) {
                      case 0:
                        list.value = ongoingDrive;
                        debugPrint("TabController Index");
                        debugPrint(
                            "TabController Index ${ongoingDrive.length}");
                        break;
                      case 1:
                        list.value = upcomingDrive;
                        debugPrint("TabController Index");
                        debugPrint(
                            "TabController Index ${upcomingDrive.length}");
                        break;
                      case 2:
                        list.value = completedDrive;
                        debugPrint("TabController Index");
                        debugPrint(
                            "TabController Index ${completedDrive.length}");
                        break;
                    }
                  }
                });
                return Scaffold(
                    backgroundColor: AppColors.blackRock,
                    appBar: AppBar(
                      title: Text(
                        "Drives",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: AppColors.babyBlue,
                            fontWeight: FontWeight.w900,
                            fontSize: 24),
                      ),
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.blackRock,
                      bottom: const TabBar(
                        tabs: tabs,
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.exit_to_app))
                      ],
                    ),
                    body: TabBarView(
                      children: tabs.map((Tab tab) {
                        return AnimatedBuilder(
                          animation: list,
                          builder: (BuildContext context, Widget? child) {
                            return ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                itemCount: list.value.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      AppNavigator.instance.navigateTo(
                                          name: NavigationPages.resultList,
                                          arguments: list.value[index].id);
                                    },
                                    child: DriveCardView(
                                      list.value[index],
                                    ),
                                  );
                                });
                          },
                        );
                      }).toList(),
                    ));
              }),
            );
          }
          return Scaffold(
              body: Container(
                  child: const Center(child: CircularProgressIndicator())));
        });
  }
}
