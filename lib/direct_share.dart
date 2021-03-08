import 'dart:async';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class DirectShare {
  static const MethodChannel _channel = const MethodChannel('direct_share');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> share(
      String text, String type, String sharePlatform, String sendTo,
      {Rect? sharePositionOrigin,
      String? sharePanelTitle,
      String subject = "",
      String extraText = ""}) {
    assert(text != null);
    assert(text.isNotEmpty);
    List<String> list = [text];
    return _shareInner(
      list,
      type,
      sharePlatform,
      sendTo,
      sharePositionOrigin: sharePositionOrigin,
      sharePanelTitle: sharePanelTitle,
      subject: subject,
      extraText: extraText,
    );
  }

  static Future<void> _shareInner(
      List<String> list, String type, String sharePlatform, String sendTo,
      {Rect? sharePositionOrigin,
      String? sharePanelTitle,
      String? subject,
      String? extraText}) {
    assert(list != null && list.isNotEmpty);
    final Map<String, dynamic> params = <String, dynamic>{
      'list': list,
      'type': type,
      'sendTo': sendTo,
      'sharePlatform': sharePlatform,
      'sharePanelTitle': sharePanelTitle,
      'subject': subject,
      'extraText': extraText
    };
    if (sharePositionOrigin != null) {
      params['originX'] = sharePositionOrigin.left;
      params['originY'] = sharePositionOrigin.top;
      params['originWidth'] = sharePositionOrigin.width;
      params['originHeight'] = sharePositionOrigin.height;
    }
    return _channel.invokeMethod('share', params);
  }
}
