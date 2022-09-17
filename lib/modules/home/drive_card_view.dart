import 'package:flutter/material.dart';
import 'package:sparkode/models/drive_model/drive_response_model.dart';
import 'package:sparkode/utility/constants/colors.dart';
import 'package:sparkode/utility/constants/strings.dart';
import 'package:sparkode/utility/helpers/date_time_helper/date_time_formatter.dart';

class DriveCardView extends StatelessWidget {
  const DriveCardView(this.driveResponseModel);
  final Drive driveResponseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade700),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.steelGray),
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
                  CardForCount(
                    title: Strings.appeared,
                    count: "${driveResponseModel.appeared}",
                  ),
                  CardForCount(
                    title: Strings.invitation,
                    count: "${driveResponseModel.invitationSent}",
                  ),
                  CardForCount(
                    title: Strings.submission,
                    count: "${driveResponseModel.totalSubmissions}",
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.babyBlue,
                      ))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${driveResponseModel.name}",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.babyBlue,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.sunglow,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                      DateTimeFormatter.getDisplayDate(
                          driveResponseModel.startTime ?? ""),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: AppColors.blueHaze,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const Icon(
                Icons.arrow_right_alt_sharp,
                color: AppColors.babyBlue,
              ),
              Row(
                children: [
                  Text(
                      DateTimeFormatter.getDisplayDate(
                          driveResponseModel.endTime ?? ""),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: AppColors.blueHaze,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CardButtonForDrive(
                  onTap: () {},
                  title: Strings.candidates,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: CardButtonForDrive(
                  onTap: () {},
                  title: Strings.result,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardForCount extends StatelessWidget {
  const CardForCount({super.key, required this.title, required this.count});

  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 60,
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(
              count,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 3,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: AppColors.blueHaze, fontSize: 14))
          ],
        ),
      ),
    );
  }
}

class CardButtonForDrive extends StatelessWidget {
  final String title;
  final Function() onTap;

  const CardButtonForDrive(
      {super.key, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style:
          ElevatedButton.styleFrom(backgroundColor: AppColors.cornFlowerBlue),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1?.copyWith(
              color: Colors.grey.shade200, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
