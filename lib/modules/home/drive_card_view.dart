import 'package:flutter/material.dart';
import 'package:sparkode/models/drive_model/drive_response_model.dart';
import 'package:sparkode/utility/constants/colors.dart';
import 'package:sparkode/utility/constants/strings.dart';

class DriveCardView extends StatefulWidget {
  const DriveCardView({Key? key, required this.drive}) : super(key: key);

  final Drive drive;

  @override
  State<DriveCardView> createState() => _DriveCardViewState(drive);
}

class _DriveCardViewState extends State<DriveCardView> {
  _DriveCardViewState(this.driveResponseModel);

  final Drive driveResponseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.babyBlue),
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
                        Text("${driveResponseModel.appeared}"),
                        const Text(Strings.appeared)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Text("${driveResponseModel.invitationSent}"),
                        const Text(Strings.invitation)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Text("${driveResponseModel.totalSubmissions}"),
                        const Text(Strings.submission)
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          Text("${driveResponseModel.name}",style: const TextStyle(fontSize: 18),),
          const SizedBox(height: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${driveResponseModel.startTime}"),
              Text("${driveResponseModel.endTime}")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Center(child: Text(Strings.candidates))),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Center(child: Text(Strings.result))),
              )
            ],
          )
        ],
      ),
    );
  }
}
