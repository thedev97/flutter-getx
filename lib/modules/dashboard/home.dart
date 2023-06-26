import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../core/values/values.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: titleTxt()
        ),
      ),
    );
  }

  Widget titleTxt() {
    return Text(home_title, style: AppTextStyles.header);
  }
}
