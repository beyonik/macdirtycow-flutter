import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:macdirtycow/macdirtycow.dart';

void main() {
  runApp(const MacDirtyCowExampleApp());
}

class MacDirtyCowExampleApp extends StatelessWidget {
  const MacDirtyCowExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: MacDirtyCowExample(),
    );
  }
}

void _showAlertDialog(BuildContext context,
    {String? windowTitle, String? text}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext alertContext) => CupertinoAlertDialog(
      title: Text(windowTitle ?? 'Alert'),
      content: Text(text ?? ''),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(alertContext).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}

class MacDirtyCowExample extends StatelessWidget {
  const MacDirtyCowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                child: const Text('test file access'),
                onPressed: () async {
                  try {
                    final files = Directory('/var').listSync();
                    _showAlertDialog(
                      context,
                      windowTitle: 'File access success',
                      text: 'First file in /var: ${files.first.path}',
                    );
                  } catch (e) {
                    _showAlertDialog(
                      context,
                      windowTitle: 'File access failed',
                      text: 'Failed to access /var $e',
                    );
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CupertinoButton.filled(
                child: const Text('grant full filesystem access'),
                onPressed: () async {
                  _showAlertDialog(
                    context,
                    windowTitle: 'MDC exploit',
                    text:
                        'MDC exploit success status: ${await macdirtycow.grant_filesystem_access()}',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
