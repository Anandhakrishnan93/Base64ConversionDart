import 'package:base_64_convertor/DataStorage.dart';

class Convertor{
  String convertionStr = "";
  // Creating Parameterized Constructor
  Convertor(this.convertionStr);

  Future<String> startConvertion() async{
    var resultant_Bin = "";
    for(int i=0; i<convertionStr.length; i++) {
      var char = convertionStr[i];
      // Using keys property and firstWhere() method
      // to get key in a map
      var key = await bin_Value.keys.firstWhere((k) => bin_Value[k] == char, orElse: () => null);
      resultant_Bin = resultant_Bin +  key;
    }
    var offsetvalue = "";
    var index = 0;
    var finalresult = "";
    for(int i=0; i<resultant_Bin.length; i++) {
      offsetvalue = offsetvalue + resultant_Bin[i];
      index = index + 1;
      if (index % 6 == 0){
        offsetvalue = "00" + offsetvalue;
        var value = await bin_letters[offsetvalue];
        finalresult = finalresult + value;
        offsetvalue = "";
      }
    }
    // Padding and error correction ;-
    var rest = resultant_Bin.length % 6;
    switch (rest){
      case 2:{
        var newvalue = "000000" +
            resultant_Bin[resultant_Bin.length - 1] +
            resultant_Bin[resultant_Bin.length - 2];
        var value = bin_letters[newvalue];
        finalresult = finalresult + value + "==";
    }break;
      case 4:{
        var newvalue = "00" + resultant_Bin[resultant_Bin.length - 4] +
            resultant_Bin[resultant_Bin.length - 3] +
            resultant_Bin[resultant_Bin.length - 2] +
            resultant_Bin[resultant_Bin.length - 1] + "00";
        var value = bin_letters[newvalue];
        finalresult = finalresult + value + "=";
    } break;
    }
     return finalresult;
  }
}