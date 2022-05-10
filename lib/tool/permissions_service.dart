import 'package:e_commerce_apps/common/configs.dart';
import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future reqAllPermissions() async {
    return await Future.forEach(
      kPermissions,
          (Permission element) async {
        return await element.request();
      },
    );
  }

  static Future reqPermissions(Permission permission) async {
    return permission.request();
  }

  static Future checkPermission(Permission permission) async {
    return permission.status;
  }

  Future checkLocationService() async {
    return await Permission.location.serviceStatus;
  }

  static Future openSettings() async {
    return openAppSettings();
  }

  static Future permissionGranted() async {
    bool granted = true;
    kPermissions.forEach((element) async {
      PermissionStatus s = await element.status;
      if (!s.isGranted) {
        granted = false;
      }
    });
    if (!granted) {
      reqAllPermission();
    }
  }
  static Future reqAllPermission() async {
    return await Future.forEach(kPermissions, (Permission element) async {
      return await element.request();
    });
  }

}
