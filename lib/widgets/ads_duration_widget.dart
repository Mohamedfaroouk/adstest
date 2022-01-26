import 'package:flutter/material.dart';
import 'package:newads/controllers/ads_controller.dart';
import 'package:newads/widgets/multiSwicher_widget.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../main.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdsController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiSwitcherWidget(
              ontap: () => provider.changeAdDuration(AdDuration.daily),
              text: "يومي",
              color: provider.adDuration == AdDuration.daily ? mainColor : null,
              fontColor:
                  provider.adDuration == AdDuration.daily ? Colors.white : null,
            ),
            MultiSwitcherWidget(
              ontap: () => provider.changeAdDuration(AdDuration.monthly),
              text: "شهري",
              color:
                  provider.adDuration == AdDuration.monthly ? mainColor : null,
              fontColor: provider.adDuration == AdDuration.monthly
                  ? Colors.white
                  : null,
            ),
            MultiSwitcherWidget(
              ontap: () => provider.changeAdDuration(AdDuration.yearly),
              text: "ثانوي",
              color:
                  provider.adDuration == AdDuration.yearly ? mainColor : null,
              fontColor: provider.adDuration == AdDuration.yearly
                  ? Colors.white
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
