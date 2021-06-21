import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:googleapis/cloudasset/v1.dart';
import 'package:sabti/constants.dart';

import './icon_card.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatefulWidget {
  //final product product
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "تفاح",
                    style: Theme.of(context).textTheme.headline6,
                  ), //product.title
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 2,
                            width: 16,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "معلومات",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child:
                                    SvgPicture.asset("assets/icons/coins.svg"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "4DT",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: SvgPicture.asset(
                                    "assets/icons/quantity.svg"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "30Kg",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: SvgPicture.asset(
                                    "assets/icons/locationdetails.svg"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "صفاقس",
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("منتوج سقوي, سلعة ممو"),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text("أعرف فلاحك",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text("قداش تحب", style: TextStyle(fontWeight: FontWeight.w600)),
              Row(children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ])
            ],
          ),
          TopRoundedContainer(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 3, right: 3, bottom: 5),
                child: RaisedButton(
                  color: kPrimaryColor, // background
                  textColor: Colors.white, // foreground
                  onPressed: () {},
                  child: Text('كمندي'),
                ),
              ))
        ],
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key key,
    @required this.color,
    @required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: color,
      ),
      child: child,
    );
  }
}
