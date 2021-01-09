import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:direct_share/direct_share.dart';

void main() {
  const MethodChannel channel = MethodChannel('direct_share');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DirectShare.platformVersion, '42');
  });
}
