import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Main Test', () {
    FlutterDriver driver;

    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect(
        printCommunication: true,
      );
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
