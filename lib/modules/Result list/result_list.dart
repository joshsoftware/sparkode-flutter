import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sparkode/models/result_model/result_list_response_model.dart';
import 'package:sparkode/services/result_list_service.dart';
import 'package:sparkode/utility/constants/colors.dart';
import 'package:sparkode/utility/helpers/APIHelper/api_response_model.dart';
import 'package:sparkode/utility/navigator/navigation_pages.dart';
import 'package:sparkode/utility/navigator/navigator.dart';

class ResultList extends StatefulWidget {
  const ResultList({super.key, required this.id});
  final int id;
  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  final resultListService = ResultListService();
  ResultListResponseModel? resultResponse;
  int currentPage = 0;
  int totalPage = 1;
  @override
  void initState() {
    super.initState();
    fetchResultList();
  }

  fetchResultList() async {
    final response = await resultListService.getResultListForId(
        id: widget.id.toString(), page: 1);
    if (response.isSuccess) {
      setState(() {
        resultResponse = ResultListResponseModel.fromJson(
            response.data as Map<String, dynamic>);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.easyBay,
      appBar: AppBar(
        title: Text(resultResponse?.data.driveName ?? ""),
        backgroundColor: AppColors.blackRock,
      ),
      body: SafeArea(
        child: resultResponse != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return _getTileForList(context, index);
                },
                itemCount: resultResponse?.data.result.length,
              )
            : const Center(
                child: CircularProgressIndicator(
                color: AppColors.babyBlue,
              )),
      ),
    );
  }

  _getTileForList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        AppNavigator.instance.navigateTo(name: NavigationPages.resultReport);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.steelGray),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resultResponse?.data.result[index].candidateId
                              .toString() ??
                          "",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.babyBlue),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          resultResponse?.data.result[index].firstName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          resultResponse?.data.result[index].lastName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  resultResponse?.data.result[index].email ?? "",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white60),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  (resultResponse?.data.result[index].score ?? 0).toString(),
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.w800, color: AppColors.babyBlue),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
            // Column(
            //   children: [
            //     Icon(
            //       Icons.check_box_rounded,
            //       color: AppColors.green,
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
