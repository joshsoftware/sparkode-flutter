import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sparkode/models/candidate_model/candidate_list_response_model.dart';
import 'package:sparkode/models/result_model/result_list_response_model.dart';
import 'package:sparkode/services/CandidateListService.dart';
import 'package:sparkode/utility/constants/colors.dart';

class CandidateList extends StatefulWidget {
  const CandidateList({super.key, required this.id});
  final int id;
  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  final candidateListService = CandidateListService();
  CandidateListResponseModel? resultResponse;
  @override
  void initState() {
    super.initState();
    fetchCandidateList();
  }

  fetchCandidateList() async {
    final response = await candidateListService.getResultListForId(
        id: widget.id.toString(), page: 1);
    if (response.isSuccess) {
      setState(() {
        resultResponse = CandidateListResponseModel.fromJson(
            response.data as Map<String, dynamic>);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.comet,
      appBar: AppBar(
        title: Text(resultResponse?.data.driveName ?? ""),
        backgroundColor: AppColors.easyBay,
      ),
      body: SafeArea(
        child: resultResponse != null
            ? ListView.builder(
          itemBuilder: (context, index) {
            return _getTileForList(context, index);
          },
          itemCount: resultResponse?.data.candidates.length,
        )
            : const Center(
            child: CircularProgressIndicator(
              color: AppColors.babyBlue,
            )),
      ),
    );
  }

  _getTileForList(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                        resultResponse?.data.candidates[index].id.toString() ??
                            "",
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.w800, color: AppColors.babyBlue),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            resultResponse?.data.candidates[index].firstName ?? "",
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            resultResponse?.data.candidates[index].lastName ?? "",
                            style: Theme.of(context).textTheme.headline2?.copyWith(
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
                    resultResponse?.data.candidates[index].email ?? "",
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
          Column(
            children: [
              Text(
                (resultResponse?.data.candidates[index].mobileNumber ?? 0).toString(),
                style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.babyBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
