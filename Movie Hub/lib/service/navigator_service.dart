import 'package:flutter/material.dart';

class NavigationService {
  bool isselected = true;
  late GlobalKey<NavigatorState> NavigatorKey;
  NavigationService() {
    NavigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return NavigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => widget));
  }

  navigatereplace(Widget widget) {
    return NavigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  void snackBarWiget({String? messege}) {
    BuildContext context = NavigatorKey.currentContext!;
    final snackbar = SnackBar(
        content: Text(
      messege!,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    ));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
