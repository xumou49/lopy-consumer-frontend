import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
void showConfirmationDialog(BuildContext context,
    [String title = "Title",
    String content = "Content",
    Function()? onYesAction]) {
  onYesAction ?? () => print("no behavior for on tap yes");
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            onYesAction!();
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

showLoaderDialog(BuildContext context) {
  // AlertDialog alert = AlertDialog(
  //   content: Row(
  //     children: [
  //       const CircularProgressIndicator(),
  //       Container(
  //           margin: const EdgeInsets.only(left: 7), child: Text("Loading...")),
  //     ],
  //   ),
  // );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const CircularProgressIndicator();
    },
  );
}
