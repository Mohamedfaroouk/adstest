import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:newads/validation.dart';

import 'package:provider/provider.dart';

import 'package:newads/constants.dart';
import 'package:newads/controllers/ads_controller.dart';
import 'package:newads/main.dart';
import 'package:newads/widgets/ads_duration_widget.dart';
import 'package:newads/widgets/ads_type_widget.dart';
import 'package:newads/widgets/multiSwicher_widget.dart';
import 'package:newads/widgets/text.dart';

class CreateAds extends StatelessWidget {
  CreateAds({
    Key? key,
  }) : super(key: key);
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AdsController>(builder: (context, value, child) {
      return SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TypeWidget(),
              DurationWidget(),
              InputField(
                lable: "الصالات",
                onChange: (s) => value.reseption = s,
                hintText: "1",
              ),
              InputField(
                lable: "عدد دورات المياه",
                onChange: (s) => value.bathhrooms = s,
                hintText: "3",
              ),
              InputField(
                lable: "الغرف",
                onChange: (s) => value.rooms = s,
                hintText: "5",
              ),
              InputField(
                lable: "الادوار",
                onChange: (s) => value.floar = s,
                hintText: "4",
              ),
              InputField(
                lable: "عمر العقار",
                onChange: (s) => value.houseAge = s,
                hintText: "5 سنوات",
              ),
              defaultSwitcher(
                value: value.carIntrance,
                onToggle: (s) {
                  value.carIntrance = s;
                  value.notifyListeners();
                },
                text: "مدخل السيارات",
              ),
              defaultSwitcher(
                value: value.kitchen,
                onToggle: (s) {
                  value.kitchen = s;
                  value.notifyListeners();
                },
                text: "مطبخ",
              ),
              defaultSwitcher(
                value: value.attach,
                onToggle: (s) {
                  value.attach = s;
                  value.notifyListeners();
                },
                text: "ملحق",
              ),
              defaultSwitcher(
                value: value.furnished,
                onToggle: (s) {
                  value.furnished = s;
                  value.notifyListeners();
                },
                text: "مؤثثه",
              ),
              defaultSwitcher(
                value: value.elevator,
                onToggle: (s) {
                  value.elevator = s;
                  value.notifyListeners();
                },
                text: "مصعد",
              ),
              InputField(
                lable: "السعر الاجمالي",
                onChange: (s) => value.price = s,
                hintText: "5000",
              ),
              InputField(
                hintText: "ادخل التفاصيل الاضافيه هنا ",
                lable: "وصف العقار",
                textInputType: TextInputType.text,
                onChange: (s) => value.description = s,

                //  minlines: 10,
                height: 200,
                maxlines: 11,
              ),
              AgreeWidget(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          formkey.currentState!.validate()
                              ? value.sendRequest(context)
                              : null;
                        },
                        child: defaultText("الاستمرار", color: Colors.white))),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}

class AgreeWidget extends StatelessWidget {
  const AgreeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (s) {}),
        Text.rich(TextSpan(children: [
          TextSpan(text: " اوافق علي"),
          TextSpan(
              text: " شروط الاستخدام ",
              style: TextStyle(color: mainColor, fontWeight: FontWeight.bold)),
          TextSpan(text: "والتزم"),
          TextSpan(
              text: " برسموم الاعلان ",
              style: TextStyle(color: mainColor, fontWeight: FontWeight.bold)),
        ]))
      ],
    );
  }
}

class defaultSwitcher extends StatelessWidget {
  Function(bool) onToggle;
  bool value;
  String text;
  defaultSwitcher({
    Key? key,
    required this.onToggle,
    required this.value,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          defaultText(text, fontsize: 17, weight: FontWeight.bold),
          Spacer(),
          FlutterSwitch(
            activeColor: mainColor,
            value: value,
            onToggle: onToggle,
            toggleBorder: Border.all(
              color: mainColor,
              width: 1,
            ),
            inactiveColor: Colors.white,
            toggleSize: 29,
            width: 60,
            padding: 1,
            inactiveSwitchBorder: Border.all(
              color: mainColor,
              width: 1,
            ),
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  InputField({
    required this.hintText,
    required this.lable,
    this.textInputType,
    this.onChange,
    this.maxlines,
    this.minlines,
    this.height,
    Key? key,
  }) : super(key: key);
  String lable;
  String hintText;
  int? minlines;
  int? maxlines;
  double? height;
  Function(String)? onChange;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultText(lable, fontsize: 17, weight: FontWeight.bold),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: height ?? 60,
            child: TextFormField(
              inputFormatters: [],
              validator: Validation().defaultValidation,
              onChanged: onChange,
              minLines: minlines,
              maxLines: maxlines,
              keyboardType: textInputType ?? TextInputType.number,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ],
      ),
    );
  }
}
