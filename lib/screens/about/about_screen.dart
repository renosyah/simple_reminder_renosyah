import 'package:simple_reminder_renosyah/utils/colors.dart';
import 'package:simple_reminder_renosyah/utils/size_config.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar beserta judul
      appBar: AppBar(
        // menampilkan text pada appbar
        title: Text(
          "Tentang Aplikasi",
          // menambahkan style pada text
          style: TextStyle(
              // memberi warna primary, ketebalan serta ukuran pada text
              color: kPrimary,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      // tampilan isi dari screen
      body: Padding(
        // menentukan padding
        padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
        // menampilkan text
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          // memberi style pada text yakni warna dan ukuran text
          style: TextStyle(color: kText2, fontSize: 16.0),
        ),
      ),
    );
  }
}
