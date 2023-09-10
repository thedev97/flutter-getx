import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'msg' : 'Learn everything because you are a beginner level',
      'submsg' : 'GoodLuck!!'
    },
    'hindi_IN':{
      'msg' : 'सब कुछ सीखें क्योंकि आप शुरुआती स्तर के हैं',
      'submsg' : 'आपको कामयाबी मिले!!'
    }
  };
}