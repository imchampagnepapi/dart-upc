// Created by DB on 06-02-2021
// using IntelliJ IDEA

import 'package:barcode_convert/utils/utils.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String upcAStr = "";
  String checkDigitStr = "";
  String twelveDigUpcA = "";

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 18.0,), textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Text("Barcode Convert UPC-E to UPC-A",
                style: TextStyle(fontSize: 16.0, color: Colors.blue, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 5.0),
                child: TextFormField(
                  maxLines: 1,
                  controller: _textEditingController,
                  onChanged: (text){
                    setState(() {
                      checkDigitStr = "";
                      upcAStr = "";
                      twelveDigUpcA = "";
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(width: 2.0, color: Colors.deepPurple),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(width: 2.0, color: Colors.deepPurple),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(width: 2.0, color: Colors.deepPurple),
                    ),
                    isDense: true,
                    hintText: "Enter valid UPC-E",
                    hintStyle: TextStyle(color: Colors.black45),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  cursorColor: Colors.deepPurple,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                child: Text(
                  'Note: UPC-E must be either 6, 7 or 8 digits numeric value!',
                  style: TextStyle(fontSize: 12.0, color: Colors.red.shade400),
                ),
              ),
              SizedBox(height: 16.0,),
              FlatButton(
                color: Colors.green,
                splashColor: Colors.red,
                onPressed: (){
                  if(_textEditingController.text.isNotEmpty || _textEditingController.text.length == 6 ||
                      _textEditingController.text.length == 7 || _textEditingController.text.length == 8){
                    convertUpcEtoUpcA(_textEditingController.text);
                  }else{
                    // error - upc must be either 6, 7 or 8 digits in length
                  }
                },
                child: Text("Convert to UPC-A", style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 10.0,),
              Text(upcAStr, style: TextStyle(color: Colors.green, fontSize: 16.0),),
              Text(checkDigitStr, style: TextStyle(color: Colors.red, fontSize: 16.0),),
              SizedBox(height: 16.0,),
              Text(twelveDigUpcA, style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 17.0, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.greenAccent.shade100,
    );
  }

  void convertUpcEtoUpcA(String str) {
    if(str == null || str.isEmpty){
      return;
    }
    String _upcA11Digit = Utils.instance.convertUpcEtoUpcA(str);
    upcAStr = "UPC-A : " + _upcA11Digit;

    String _checkDigit = Utils.instance.calculateCheckChar(_upcA11Digit);
    if(!int.tryParse(_checkDigit).isNaN){
      checkDigitStr = "Check-Digit : " + _checkDigit;
      twelveDigUpcA = "12-Digits UPC-A : " + _upcA11Digit + _checkDigit;
    }
    setState(() {});
  }
}