import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/fab/floating_daagn_button.riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/src/consumer.dart';

import '../../app.dart';

class FcmManager {
  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize(WidgetRef ref) async {
    ///Foreground
    FirebaseMessaging.onMessage.listen((message) async {
      final title = message.notification?.title;
      if (title == null) {
        return;
      }
      ref.read(floatingButtonStateProvider.notifier).hideButton();
      final controller = App.navigatorKey.currentContext?.showSnackbar(title,
          extraButton:
              Tap(onTap: () {}, child: '열기'.text.white.bold.make().p(20)));
      final reason = await controller?.closed;
      print(reason);
      await sleepAsync(4.seconds);
      ref.read(floatingButtonStateProvider.notifier).showButton();
    });

    /// Background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});

    /// Not running -> Initial launch\
    final firstMessage = await FirebaseMessaging.instance.getInitialMessage();

    final token = await FirebaseMessaging.instance.getToken();
    print(token);
  }
}
