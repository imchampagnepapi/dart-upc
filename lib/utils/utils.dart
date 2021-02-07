// Created by DB on 07-02-2021
// using IntelliJ IDEA

class Utils{
  static final Utils _utils = Utils._internal();
  Utils._internal();

  static Utils get instance => _utils;

  // isNumeric Validation
  bool isNumeric(String s){
    if(s == null){
      return false;
    }
    return double.tryParse(s) != null;
  }

  // Calculate Check Digit from 11-Digits Generated UPC-A
  String calculateCheckChar(String strMsg) {
    var check = 0;
    for(int x = 1; x <= 11; x++){
      var test = strMsg.substring(x-1, x);
      if (x.isOdd){
        check = check + int.tryParse(test) * 7;   // odd position digits multiplied by 7
      } else{
        check = check + int.tryParse(test)  * 9;   // even position digits multiplied by 9
      }
    }
    check = (check % 10) + 48;   // convert to ASCII
    return String.fromCharCode(check);
  }

  /// Algorithm to convert UPC-E to UPC-A in Dart
  String convertUpcEtoUpcA(String str) {
    var _upc = str;
    var _upcEStr = "";
    var _manufacturerNumber = "";
    var _itemNumber = "";
    var _msg = "";

    if(isNumeric(_upc)){
      switch(_upc.length){
        case 6:
          _upcEStr = _upc;
          print(_upcEStr);
          break;
        case 7:
          _upcEStr = _upc.substring(1);
          print(_upcEStr);
          break;
        case 8:
          _upcEStr = _upc.substring(1, _upc.length-1);
          print(_upcEStr);
          break;
      }

      if(_upcEStr.isEmpty){
        return "";
      }

      var digit1 = _upcEStr[0];
      var digit2 = _upcEStr[1];
      var digit3 = _upcEStr[2];
      var digit4 = _upcEStr[3];
      var digit5 = _upcEStr[4];
      var digit6 = _upcEStr[5];
      //print(digit6);

      switch(digit6){
        case "0":
          _manufacturerNumber = digit1 + digit2 + digit6 + "00";
          _itemNumber = "00" + digit3 + digit4 + digit5;
          break;
        case "1":
          _manufacturerNumber = digit1 + digit2 + digit6 + "00";
          _itemNumber = "00" + digit3 + digit4 + digit5;
          break;
        case "2":
          _manufacturerNumber = digit1 + digit2 + digit6 + "00";
          _itemNumber = "00" + digit3 + digit4 + digit5;
          break;
        case "3":
          _manufacturerNumber = digit1 + digit2 + digit3 + "00";
          _itemNumber = "000" + digit4 + digit5;
          break;
        case "4":
          _manufacturerNumber = digit1 + digit2 + digit3 + digit4 + "0";
          _itemNumber = "0000" + digit5;
          break;
        default:
          _manufacturerNumber = digit1 + digit2 + digit3 + digit4 + digit5;
          _itemNumber = "0000" + digit6;
          break;
      }

      _msg =  "0" + _manufacturerNumber + _itemNumber;
      print("upcA (w/o checkDigit): " + _msg);
      return _msg;
    }else{
      print("UPCs must contain numeric data only!");
      return "";
    }
  }
}