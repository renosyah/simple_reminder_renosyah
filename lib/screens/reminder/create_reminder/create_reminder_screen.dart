import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_reminder_renosyah/models/data_time.dart';
import 'package:simple_reminder_renosyah/models/reminder.dart';
import 'package:simple_reminder_renosyah/models/reminders.dart';
import 'package:simple_reminder_renosyah/utils/colors.dart';
import 'package:simple_reminder_renosyah/utils/size_config.dart';

class CreateReminderScreen extends StatefulWidget {
  @override
  _CreateReminderScreenState createState() =>
      _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {

  var time_slot = new ChooseTime().create();

  // inisialisasi type data datetime
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  // inisialisasi controller tanggal
  TextEditingController _textDateController = TextEditingController();
  TextEditingController _controllerReminderName = TextEditingController();

  void save_reminder() async {
    var reminder = Reminder();

    DateTime time = new DateTime(
        this._selectedDate.year,
        this._selectedDate.month,
        this._selectedDate.day,
        this._selectedTime.hour,
        this._selectedTime.minute);

    reminder.time = time;
    reminder.name = _controllerReminderName.text.toString();

    await new Reminders().append(reminder);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appbar beserta judul
        appBar: AppBar(
          title: Text(
            // menampilkan judul appbar buat reservasi
            "Buat Reminder",
            style: TextStyle(
                // memberi style warna ukuran dan ketebalan judul
                color: kPrimary,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
            child: Column(
              children: [
                Form(
                    child: TextFormField(
                      controller: _controllerReminderName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Nama reminder...",
                        filled: true,
                        fillColor: kBackgroundTextField,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                            getProportionateScreenWidth(
                                24.0),
                            vertical:
                            getProportionateScreenWidth(
                                16.0)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.0,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(
                                    8.0))),
                      ),
                    )),
                Text(
                  // menampilkan text pilih tanggal
                  "Pilih tanggal",
                  // memberi style warna dan ukuran text
                  style: TextStyle(color: kText2, fontSize: 14.0),
                ),
                // memberi jarak antar elemen menggunakan sizebox
                SizedBox(
                  height: getProportionateScreenHeight(8.0),
                ),
                // field untuk memasukan tanggal
                Form(
                    child: TextFormField(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(
                        context); // ketika diklik jalan fungsi selectdate
                  },
                  controller: _textDateController, // controller untuk tanggal
                  focusNode: AlwaysDisabledFocusNode(),
                  decoration: InputDecoration(
                    // menampilkan hint untuk tanggal
                    hintText: "Pilih tanggal",
                    filled: true, // mengaktifkan warna
                    fillColor:
                        kBackgroundTextField, // memberi warna pada textformfield
                    suffixIcon: Icon(Icons
                        .calendar_today_rounded), // icon calendar untuk textformfield tanggal
                    contentPadding: EdgeInsets.symmetric(
                        // memberi jarak di kiri dan kanan didalam textformfield
                        horizontal: getProportionateScreenWidth(24.0),
                        vertical: getProportionateScreenWidth(16.0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.0,
                            style: BorderStyle
                                .none), // memberi ukuran border dan style
                        borderRadius: BorderRadius.circular(
                            // membuat lengkungan pada textformfield
                            getProportionateScreenWidth(8.0))),
                  ),
                )),
                // membuat jarak antar elemen menggunakan sizebox
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Text(
                  // menampilan text pilih waktu
                  "Pilih Waktu",
                  // memberi style warna dan ukuran pada text
                  style: TextStyle(color: kText2, fontSize: 14.0),
                ),
                // membuat jarak antar elemen menggunakan sizebox
                SizedBox(
                  height: getProportionateScreenHeight(8.0),
                ),
                // field untuk memasukan waktu
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  runSpacing: getProportionateScreenWidth(8.0),
                  spacing: getProportionateScreenWidth(8.0),
                  children: [
                    ...List.generate(
                        time_slot.length,
                            (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              if (time_slot[index].status) {
                                _selectedTime = time_slot[index].datetime;
                              }
                            });
                          },
                          child: Container(
                            width: getProportionateScreenWidth(116.0),
                            height: getProportionateScreenHeight(56.0),
                            decoration: BoxDecoration(
                                color: time_slot[index].status && _selectedTime == time_slot[index].datetime ? kPrimary  : !time_slot[index].status ? Colors.red : kWhite,
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(8.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      blurRadius: 8,
                                      spreadRadius: 4,
                                      offset: Offset(0.0, 0.0),
                                      color: kText1.withOpacity(0.1))
                                ]),
                            child: Center(
                              child: Text(
                                time_slot[index].time,
                                style: TextStyle(
                                    color: time_slot[index].status && _selectedTime == time_slot[index].datetime ? kWhite : !time_slot[index].status ? kWhite : kText2,
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                // membuat jarak antar elemen menggunakan sizebox
                SizedBox(
                  height: getProportionateScreenHeight(56.0),
                ),
                // tombol untuk buat reservasi
                ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: double
                            .infinity, // panjang button mengikuti panjang device
                        height: getProportionateScreenHeight(
                            72.0)), // menentukan tinggi button
                    child: ElevatedButton(
                      onPressed: () {
                        save_reminder();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              kPrimary), // memberi warna pada button buat reservasi
                          elevation: MaterialStateProperty.all(
                              0)), // memberi shadow pada button buat reservasi
                      child: Text(
                        // menampilkan text buat reservasi
                        "Buat Reminder",
                        style: TextStyle(
                          color: kWhite, // memberi warna text
                          fontSize: 22.0, // memberi ukuran text
                          fontWeight: FontWeight.bold, // memberi ketebalan text
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  // funsi untuk menampilkan waktu dalam bentuk timepicker
  _selectDate(BuildContext context) async {
    // menampilkan 5 hari selain sabtu dan minggu dalam 1 minggu
    bool _decideWhichDayToEnable(DateTime day) {
      if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
          day.isBefore(DateTime.now().add(Duration(days: 6))))) {
        return true;
      }
      return false;
    }

    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), // waktu sekarang
        firstDate: DateTime(2021), // mulai ditahun 2021
        lastDate: DateTime(2030), // berakhir di tahun 2030
        selectableDayPredicate:
            _decideWhichDayToEnable, // jalan fungsi _decideWhichDayToEnable
        builder: (context, child) => Theme(
            // ganti tema
            data: ThemeData.light().copyWith(
              primaryColor: kPrimary, // memberi warna datapicker
              accentColor: kPrimary, // memberi warna datepicker
              colorScheme: ColorScheme.light(
                  primary: kPrimary), // memberi warna datepicker
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme
                      .primary), // memberi warna button datepicker
            ),
            child: child));

    // menampilkan tanggal yang dipilih ke dalam field pilih tanggal
    // jika newSelectedDate tidak sama dengan null
    if (newSelectedDate != null) {
      setState(() {
        // maka _selectedDate diisi dengan nilai newSelectedDate
        _selectedDate = newSelectedDate;

      });
      // dan masukan ke dalam controller tanggal dengan format tanggal yang telah ditentukan
      _textDateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textDateController.text.length,
            affinity: TextAffinity.upstream));

    }
  }
}

// kelas untuk me-non-aktif-kan focus pada field
class AlwaysDisabledFocusNode extends FocusNode {
  // ambil fungsi get dari kelas FocusNode dan ubah nilai jadi false
  @override
  bool get hasFocus => false;
}
