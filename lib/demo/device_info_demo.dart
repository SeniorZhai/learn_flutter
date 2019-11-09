import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DeviceInfoDemo extends StatefulWidget {
  @override
  _DeviceInfoDemoState createState() => _DeviceInfoDemoState();
}

class _DeviceInfoDemoState extends State<DeviceInfoDemo> {
  String _title = "Wating...";

  @override
  Widget build(BuildContext context) {
    load();
    return Scaffold(
      appBar: AppBar(title: Text("Device Info")),
      body: Container(
        padding: EdgeInsets.all(16),
        child:Column(
          children: <Widget>[
            Text(
                _title
            ),
            SizedBox(height: 8),
            Text(
              getScreenInfo()
            )
          ],
        )
      ),
    );
  }

  load() async {
    String info = await getDeviceInfo();
    setState(() {
      this._title = info;
    });
  }

  getScreenInfo(){
    // full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // height without SafeArea
    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;

    // height without status bar
    double height2 = height - padding.top;

    // height without status and toolbar
    double height3 = height - padding.top - kToolbarHeight;

    return <String,dynamic>{"width":width,
      "height":height,
      "padding_top": padding.top,
      "padding_bottom":padding.bottom
    }.toString();
  }

  Future<String> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if(Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return _readAndroidBuildData(androidInfo).toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return _readIosDeviceInfo(iosInfo).toString();
    } else {
      return "";
    }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId
    };
  }
  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}


