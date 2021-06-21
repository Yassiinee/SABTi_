import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sabti/Screens/Login/login_screen.dart';
import 'package:sabti/Screens/Signup/components/background.dart';
import 'package:sabti/Screens/Signup/components/next.dart';
import 'package:sabti/Screens/Signup/components/or_divider.dart';
import 'package:sabti/Screens/Signup/components/social_icon.dart';
import 'package:sabti/Screens/falahhome/components/header_with_seachbox.dart';
import 'package:sabti/components/already_have_an_account_acheck.dart';
import 'package:sabti/components/rounded_button.dart';
import 'package:sabti/components/rounded_input_field.dart';
import 'package:sabti/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sabti/services/authservice.dart';

import '../../../custom_dialog_box.dart';

var email, password, token, name, role, familyName, address;

class Body extends StatefulWidget {
  final role;
  Body(
    this.role,
  );
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Position _currentPosition;
  String _currentAddress;
  var Location = "";
  String latitude;
  String longitude;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    _getAddressFromLatLng();
    print("position : " + _currentPosition?.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "سجل معنا",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/1.svg",
                height: size.height * 0.285,
              ),
              RoundedInputField(
                hintText: "بريدك الالكتروني",
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedInputField(
                hintText: "إسمك",
                onChanged: (value) {
                  name = value;
                },
              ),
              RoundedInputField(
                hintText: "لقبك",
                onChanged: (value) {
                  familyName = value;
                },
              ),
              RoundedInputField(
                  hintText: ("$_currentAddress"),
                  onChanged: (value) {
                    address = value;
                  }),
              RoundedButton(
                text: "مرحبا بيك",
                fontSize: 20.0,
                press: () {
                  AuthService()
                      .addUser(email, password, widget.role, name, familyName,
                          address)
                      .then((val) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          var msg = val.data['msg'];
                          return CustomDialogBox(
                            title: '$msg',
                            descriptions: "Welcome To SABTI APP",
                            text: "OK",
                          );
                        });
                    Fluttertoast.showToast(
                      msg: val.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 22.0,
                    );
                  });
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*AuthService()
                    .addUser(email, password, role, name, familyName, address)
                    .then((val) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var msg = val.data['msg'];
                        return CustomDialogBox(
                          title: '$msg',
                          descriptions: "Welcome To SABTI APP",
                          text: "OK",
                        );
                      });
                  Fluttertoast.showToast(
                    msg: val.data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 22.0,
                  );
                });*/