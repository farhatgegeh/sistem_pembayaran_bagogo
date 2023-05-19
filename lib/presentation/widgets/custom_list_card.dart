import '../../config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import '../../config/theme/themes.dart';
import '../../utils/constants.dart';

class CustomeListCard extends StatelessWidget {
  const CustomeListCard({
    super.key,
    required this.separatedTexts,
    required this.arg,
  });

  final List<String> separatedTexts;
  final String arg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          title: Text(
            separatedTexts[1],
            style: kHeading6.copyWith(color: kGreen),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Kamu telah melakukan scan awal lanjut scan titik akhir",
            style: kBodyText,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                child: const Text("Okay"),
                onPressed: () {
                  router.goNamed('finalScan', pathParameters: {'data': arg});
                  router.pop();
                }),
            TextButton(
                child: const Text("Close"),
                onPressed: () => router.pop(context)),
          ],
        ).show(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Image.asset('assets/ride.png'),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  separatedTexts[0],
                  style: kHeading6,
                ),
                Text(separatedTexts[1], style: kBodyText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
