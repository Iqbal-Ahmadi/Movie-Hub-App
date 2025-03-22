import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_icons.dart';

class errorWidget extends StatelessWidget {
  errorWidget({super.key, this.errorText, this.retryFunction});
  final String? errorText;
  void Function()? retryFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MyAppIcons.errorIcon,
            size: 50,
            color: Colors.red,
          ),
          SizedBox(height: 20.0),
          Text('Error: $errorText', style: TextStyle(color: Colors.red)),
          ElevatedButton(
            onPressed: retryFunction,
            child: Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
