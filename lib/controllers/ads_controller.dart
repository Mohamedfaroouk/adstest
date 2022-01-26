import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newads/main.dart';
import 'package:newads/model/ad_store_model.dart';
import 'package:newads/network/diohelper.dart';

enum Pagestate { loading, loaded }

class AdsController extends ChangeNotifier {
  Pagestate pagestate = Pagestate.loaded;

  //////////////////////////////////////
  AdType adType = AdType.single;
  changeAdType(AdType type) {
    adType = type;
    notifyListeners();
  }

  //////////////////////////////
  AdDuration adDuration = AdDuration.daily;
  changeAdDuration(AdDuration type) {
    adDuration = type;
    notifyListeners();
  }

  ////////////////////////////
  bool carIntrance = false;
  bool kitchen = false;
  bool furnished = false;
  bool attach = false;
  bool elevator = false;
  //////////////////////////
  String reseption = "";
  String bathhrooms = "";
  String rooms = "";
  String floar = "";
  String houseAge = "";
  ////////////////////
  String description = "";
  String price = "";

  sendRequest(context) async {
    pagestate = Pagestate.loading;
    notifyListeners();

    final ads = Ads(
        adType: adType,
        adDuration: adDuration,
        carIntrance: carIntrance,
        kitchen: kitchen,
        furnished: furnished,
        attach: attach,
        elevator: elevator,
        bathhrooms: bathhrooms,
        reseption: reseption,
        rooms: rooms,
        textDescription: description,
        floar: floar,
        houseAge: houseAge);
    print(ads.title);
    final data =
        await Diohelp.postdata(text: "/api/ads/posts/store", data: ads.toMap());
    if (!data.error!) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data.data!.data["message"])));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data.errorMassege!)));
    }
  }
}
