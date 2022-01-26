import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:newads/constants.dart';
import 'package:newads/screens/create_ads.dart';
import 'package:newads/widgets/multiSwicher_widget.dart';
import 'package:newads/widgets/text.dart';
import 'package:provider/provider.dart';

import 'controllers/ads_controller.dart';
import 'network/diohelper.dart';

void main() async {
  Diohelp.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AdsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: mainColor.toMaterialColor(),
        ),
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('ادخل تفاصيل الاعلان'),
            ),
            body: CreateAds(),
          ),
        ),
      ),
    );
  }
}

enum AdType { single, families }
enum AdDuration { daily, monthly, yearly }
