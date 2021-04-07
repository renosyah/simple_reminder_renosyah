import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_reminder_renosyah/models/reminder.dart';
import 'package:simple_reminder_renosyah/models/reminders.dart';
import 'package:simple_reminder_renosyah/utils/colors.dart';
import 'package:simple_reminder_renosyah/utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // menampilkan judul halaman reservasi
          "Reminder",
          style: TextStyle(
              // memberi style warna ukuran dan ketebalan text
              color: kPrimary,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<Reminders>(
        future: new Reminders().load(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            return SingleChildScrollView(
              child: Padding(
                // memberi jarak dikiri dan kanan elemen
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(24.0)),
                child: Column(
                  children: [
                    // menampilkan item list untuk tanya jawab
                    ...snapshot.data.reminders.map((e) => RemindersItem(reminder : e)),
                    SizedBox(
                      height: getProportionateScreenWidth(24.0),
                    )
                  ],
                ),
              ),
            );
          } else {
            return EmptyReminder();
          }
        },
      ),
    );
  }
}

class RemindersItem extends StatelessWidget {
  Reminder reminder;
  RemindersItem({this.reminder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // menampilkan detail dari tanya jawab menggunakan dialog
      onTap: () => {


      },
      // item tanya jawab
      child: Container(
        width: double.infinity, // panjang elemen mengikuti panjang device
        margin: EdgeInsets.only(top: getProportionateScreenWidth(24.0)),
        decoration: BoxDecoration(
            color: kWhite, // memberi warna elemen
            // membuat lengkungan pada elemen
            borderRadius:
            BorderRadius.circular(getProportionateScreenWidth(24.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 8,// memberi blur pada shadow
                  spreadRadius: 4,// memberi lebar blur pada shadow
                  offset: Offset(0.0, 0.0),// memberi arah x dan y blur pada shadow
                  color: kText1.withOpacity(0.1))// memberi warna shadow
            ]),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // menampilkan pertanyaan
              Text(
                reminder.name,
                // pertanyaan maksimal 2 baris
                maxLines: 2,
                // jika lebih dari 2 baris makan ditampilkan titik titik
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  // memberi style warna ukuran dan ketebalan pada text
                    color: kText1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              // membuat jarak antar elemen menggunakan sizebox
              SizedBox(
                height: getProportionateScreenHeight(4.0),
              ),
              // menampilkan jawaban
              RichText(
                  maxLines: 1,
                  // jika lebih dari 2 baris makan ditampilkan titik titik
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    // menampilkan text jawaban
                      text: "Tanggal : ",
                      style: TextStyle(
                          color: kPrimary,
                          fontSize: 14.0), // memberi warna dan ukruan pada text
                      children: [
                        TextSpan(
                            text:
                            // menampilkan jawaban jika kosong yakni menunggu
                            reminder.time.toString(),
                            style: TextStyle(
                                color: kPending,
                                fontSize:
                                14.0)) // memberi warna dan ukuran pada text
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}

// halaman ini akan ditampilkan jika data tanya jawab masih kosong
class EmptyReminder extends StatelessWidget {
  const EmptyReminder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // menampilkan elemen secara vertical
    return Column(
      children: [
        // membuat jarak antar elemen menggunakan sizebox
        SizedBox(
          height: getProportionateScreenWidth(112.0),
        ),
        // membuat jarak antar elemen menggunakan sizebox
        SizedBox(
          height: getProportionateScreenHeight(56.0),
        ),
        // menampatkan judul ditengah
        Center(
            child: Text(
              // menampilkan judul halaman kosong
              "Reminder Kosong",
              style: TextStyle(
                // memberi style warna ketebalan dan ukuran text
                  color: kText1,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            )),
        // membuat jarak antar elemen menggunakan sizebox
        SizedBox(
          height: getProportionateScreenHeight(24.0),
        ),
        // menampilkan subjudul halaman kosong
        Padding(
          // membuat jarak disisi kiri dan kanan elemen
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(36.0)),
          child: Center(
            child: RichText(
              // menempatkan subtitle ditengah
                textAlign: TextAlign.center,
                text: TextSpan(
                  // menampilkan subtitle
                    text: "Reminder Kosong, mohon menambah data reminder",
                    // memberi style warna dan ukuran pada text
                    style: TextStyle(fontSize: 16.0, color: kText2),
                    children: [ ])),
          ),
        )
      ],
    );
  }
}