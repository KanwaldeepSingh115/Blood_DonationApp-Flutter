import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../util/appstyles.dart';

extension AsyncValueUi on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      if (ModalRoute
          .of(context)
          ?.isCurrent == false) {
        return;
      }
      final message = _errorMessage(error);
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Color(0xFF680c07),
                size: 40,
              ), // Icon
              title: Text(
                message,
                style: AppStyles.normalTextStyle
                    .copyWith(color: const Color (0xFF680c87)),
              ), // Text
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color (0xFF680c87)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Close',
                        style: AppStyles.normalTextStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
      );
    }
  }
}

String _errorMessage(Object? error){
  if(error is FirebaseAuthException) {
    return error.message ?? error.toString();
  }else{
    return error.toString();
  }
}