import 'package:flutter/material.dart';
import 'package:sparkode/models/drive_model/drive_response_model.dart';
import 'package:sparkode/utility/constants/colors.dart';
import 'package:sparkode/utility/constants/strings.dart';

class DriveCardView extends StatelessWidget {
  const DriveCardView(this.driveResponseModel);
  final Drive driveResponseModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.crow),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Text("${driveResponseModel.appeared}",style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white, fontSize: 18),),
                        Text(Strings.appeared,style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white, fontSize: 18))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Text("${driveResponseModel.invitationSent}",style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white, fontSize: 18)),
                        Text(Strings.invitation,style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white, fontSize: 18))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Text("${driveResponseModel.totalSubmissions}",style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.white, fontSize: 18),),
                        Text(Strings.submission,style: Theme.of(context).textTheme.headline6?.copyWith(color: AppColors.white, fontSize: 18))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete,color: AppColors.babyBlue,))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${driveResponseModel.name}",
            style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: AppColors.blueHaze, fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${driveResponseModel.startTime}",style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColors.white, fontSize: 12)),
              Text("${driveResponseModel.endTime}",style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: AppColors.white, fontSize: 12))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cornFlowerBlue),
                    child: const Center(child: Text(Strings.candidates))),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cornFlowerBlue),
                    child: const Center(child: Text(Strings.result))),
              )
            ],
          )
        ],
      ),
    );
  }
}

