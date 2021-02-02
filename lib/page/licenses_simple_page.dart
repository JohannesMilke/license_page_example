import 'package:flutter/material.dart';

class LicensesSimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: LicensePage(
          applicationName: 'My App Name',
          applicationIcon: Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset('assets/logo.png', width: 48, height: 48),
          ),
          applicationVersion: '0.0.1',
          applicationLegalese: 'Copyright ${DateTime.now().year} My Company',
        ),
      );
}
