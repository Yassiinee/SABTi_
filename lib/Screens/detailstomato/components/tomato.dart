import 'package:flutter/material.dart';
import 'package:sabti/components/my_bottom_nav_bar.dart';
import 'package:sabti/screens/details/components/body.dart';

import '../../../constants.dart';
import 'icon_card.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: RoundedIconBtn(
            iconData: Icons.arrow_back,
            press: () => Navigator.pop(
              context,
            ),
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
