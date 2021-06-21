import 'package:flutter/material.dart';
import 'package:sabti/Screens/home/components/events_special.dart';
import 'package:sabti/constants.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "أفرح معنا", press: () {}),
          EventsSpecial(),
          TitleWithMoreBtn(title: "اقتراحاتنا", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "المزيد", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
