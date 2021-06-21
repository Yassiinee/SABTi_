import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sabti/constants.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
  }) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  //int selectedImage=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
                "assets/images/image_2.png"), //Image.asset(widget.product.images[selectedImage])
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                4, //product.images.length
                (index) => buildSmallPreview()) //index
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallPreview() {
    //int index
    return GestureDetector(
      onTap: () {
        setState(() {
          //selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    kPrimaryColor)), //color:selectedImage == index ? kPrimaryColor :colors.transparent
        child: Image.asset("assets/images/image_2.png"), //product.image[index]
      ),
    );
  }
}
