import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sabti/components/rounded_button.dart';
import 'package:sabti/components/rounded_input_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'background.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
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

  void getcurrentLocation() async {
    /*
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: true,);
    var lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);
    var lat = position.latitude;
    var long = position.longitude;
    latitude = '$lat';
    longitude = '$long';
    setState(() {
      Location = "$position.latitude,$position.longitude";
    });
    */
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

  /* void googleMap() async {
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
    else {
      throw("couldn t launch google maps");
    }
  }
*/

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "زيد عرفنا بروحك",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/1.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "إسمك",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "لقبك",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: ("$_currentAddress"),
            ),
            RoundedButton(
              text: "مرحبا بيك",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
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
}
