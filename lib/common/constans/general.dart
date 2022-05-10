import 'package:e_commerce_apps/common/constans.dart';
import 'package:e_commerce_apps/common/constans/string.dart';

const kGLOG_TAG = "[$kSAppName]";
const kGLOG_ENABLE = true;
const kGPackageName = "com.ecommerce.apps";


printLog(dynamic data) {
  if (kGLOG_ENABLE) {
    print("[${DateTime.now().toUtc()}]$kGLOG_TAG${data.toString()}");
  }
}
