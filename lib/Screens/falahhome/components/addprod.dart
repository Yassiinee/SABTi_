import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sabti/components/rounded_input_field_fallah.dart';
import '../components/fruitdetect.dart';

class AddProd extends StatefulWidget {
  final Function addNew;
  AddProd(this.addNew);

  @override
  _AddProd createState() => _AddProd();
}

class _AddProd extends State<AddProd> {
  final titleController = TextEditingController();
  final prixController = TextEditingController();
  final qteController = TextEditingController();
  final String selectpic = 'salut';
  final String selectlocation = 'salut';
  File _imageFile;
  String result = "";
  final picker = ImagePicker();

  // ignore: unused_elementöä
  void submitData() {
    // final titleenter = titleController.text;
    //final prixenter = double.parse(prixController.text);
    // final qteenter = int.parse(qteController.text);
    //if (titleenter.isEmpty || prixenter <= 0 || qteenter <= 0) {
    // return;}
    widget.addNew(
      titleController.text,
      double.parse(prixController.text),
      double.parse(qteController.text),
      selectlocation,
      selectpic,
    );
    Navigator.of(context).pop();
  }

  _openGallary(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    final pic = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      _imageFile = File(pic.path);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    final pic = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      _imageFile = File(pic.path);
    });
    Navigator.of(context).pop();
  }

  // ignore: unused_element
  Future<void> _showChioDiloag(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('make a choise'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Gallary'),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  _fruitdetc(BuildContext context) async {
    final res = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Fruitdetc()));
    this.setState(() {
      result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                ),
                Center(
                  child: Text(
                    "إضافة منتوج",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'المنتوج',
                  fillColor: Theme.of(context).primaryColor),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'الثمن'),
              controller: prixController,
              onSubmitted: (_) => submitData,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'الكمية'),
              controller: qteController,
              onSubmitted: (_) => submitData,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      result == ""
                          ? 'choose product'
                          // ignore: unnecessary_brace_in_string_interps
                          : '${result}',
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        _fruitdetc(context);
                      },
                      child: Text(
                        'إختار المنتوج',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Center(
                    child: _imageFile == null
                        ? Text('aucune date choisi')
                        : Image.file(
                            _imageFile,
                            width: 100,
                            height: 100,
                          ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        _showChioDiloag(context);
                      },
                      child: Text(
                        'photo',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
            Center(
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: submitData,
                child: Text('أضف المنتوج'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
