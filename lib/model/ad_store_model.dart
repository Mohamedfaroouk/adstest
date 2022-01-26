import 'dart:convert';

import 'package:newads/main.dart';

class Ads {
  String title;
  String description;
  String catId;
  String cityId;
  String address;
  String price;
  String lat;
  String lon;
  AdType adType;
  AdDuration adDuration;
  bool carIntrance;
  bool kitchen;
  bool furnished;
  bool attach;
  bool elevator;
  String bathhrooms;
  String reseption;
  String rooms;
  String floar;
  String textDescription;
  String houseAge;
  Ads({
    this.title = "اعلان فاروق تجريبي",
    this.description = "اعلان فاروق تجريبي وصف",
    this.catId = '2',
    this.cityId = '2',
    this.address = "عنوان الاعلان",
    this.price = '1400',
    this.lat = '34.232323',
    this.lon = '34.232323',
    required this.adType,
    required this.adDuration,
    required this.carIntrance,
    required this.kitchen,
    required this.furnished,
    required this.attach,
    required this.elevator,
    required this.bathhrooms,
    required this.reseption,
    required this.rooms,
    required this.textDescription,
    required this.floar,
    required this.houseAge,
  });
  String stringAdtype(AdType type) {
    return type == AdType.single ? "14" : "15";
  }

  String stringAdDurationtype(AdDuration duration) {
    if (duration == AdDuration.daily) {
      return "16";
    } else if (duration == AdDuration.monthly) {
      return "17";
    } else {
      return "18";
    }
  }

  String carIntranceString(bool carIntrance) {
    return carIntrance ? "20" : "19";
  }

  String kitchenString(bool kitchen) {
    return kitchen ? "22" : "21";
  }

  String furnishedString(bool furnished) {
    return furnished ? "28" : "27";
  }

  String attachString(bool attach) {
    return attach ? "24" : "23";
  }

  String elevatorString(bool elevator) {
    return elevator ? "26" : "25";
  }

  Map<String, dynamic> toMap() {
    return {
      'titles[ar]': title,
      'description[ar]': description,
      'cat_id[]': catId,
      'city_id': cityId,
      'address': address,
      'price': price,
      'lat': lat,
      'lon': lon,
      'options[0][text][8][value]': textDescription,
      'options[0][radio][12][value]': stringAdtype(adType),
      'options[0][radio][13][value]': stringAdDurationtype(adDuration),
      'options[0][radio][19][value]': carIntranceString(carIntrance),
      'options[0][radio][20][value]': kitchenString(kitchen),
      'options[0][radio][23][value]': furnishedString(furnished),
      'options[0][radio][21][value]': attachString(attach),
      'options[0][radio][22][value]': elevatorString(elevator),
      'options[0][number][15][value]': bathhrooms,
      'options[0][number][14][value]': reseption,
      'options[0][number][16][value]': rooms,
      'options[0][number][17][value]': floar,
      'options[0][number][18][value]': houseAge,
    };
  }
}
