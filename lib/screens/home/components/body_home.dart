import 'package:simple_reminder_renosyah/routing/constanta.dart';
import 'package:simple_reminder_renosyah/utils/colors.dart';
import 'package:simple_reminder_renosyah/utils/size_config.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  final ValueChanged<int> onTap;
  BodyHome({this.onTap});

  @override
  _BodyHomeState createState() => _BodyHomeState(onTap: this.onTap);
}

class _BodyHomeState extends State<BodyHome> {
  ValueChanged<int> onTap;

  // konstruktor
  _BodyHomeState({this.onTap});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar beserta judul dan icon promo
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Beranda",
          style: TextStyle(
              color: kPrimary, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // jarak antar elemen
          SizedBox(
            height: getProportionateScreenHeight(36.0),
          ),
          GestureDetector(
            onTap: () {
              this.onTap(1);
            },
            child: Stack(
              // menggunakan stack untuk menimpa antar elemen
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(24.0)),
                  child: Container(
                    width: getProportionateScreenWidth(344.0),
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(24.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 4,
                              offset: Offset(0.0, 0.0),
                              color: kText1.withOpacity(0.1))
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.all(getProportionateScreenWidth(24.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // menampikan text reservasi
                          Text(
                            "Reminder",
                            style: TextStyle(color: kText1, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(4.0),
                          ),
                          // menampikan subtitle dari reservasi
                          Text(
                           "Reminder anda",
                            style: TextStyle(color: kText2, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // menggunakan positioned untuk menempatkan button ditengah tengah item
                Positioned(
                  right: 0.0,
                  top: 1.0,
                  bottom: 1.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, createReminder);
                    },
                    child: Container(
                      width: getProportionateScreenWidth(44.0),
                      height: getProportionateScreenWidth(44.0),
                      decoration: BoxDecoration(
                          color: kPrimary, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: kWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          // item untuk membuat pertanyaa
        ],
      ),
    );
  }
}
