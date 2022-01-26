import 'package:flutter/material.dart';
import 'package:newads/controllers/ads_controller.dart';
import 'package:newads/main.dart';
import 'package:newads/widgets/multiSwicher_widget.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({
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
              ontap: () => provider.changeAdType(AdType.single),
              text: "عزاب",
              color: provider.adType == AdType.single ? mainColor : null,
              fontColor: provider.adType == AdType.single ? Colors.white : null,
            ),
            MultiSwitcherWidget(
              ontap: () => provider.changeAdType(AdType.families),
              text: "عوائل",
              color: provider.adType == AdType.families ? mainColor : null,
              fontColor:
                  provider.adType == AdType.families ? Colors.white : null,
            ),
          ],
        ),
      ),
    );
  }
}
