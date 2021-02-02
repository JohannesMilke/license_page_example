import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:license_page_example/model/license.dart';
import 'package:license_page_example/widget/licenses_widget.dart';

class LicensesCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Licenses'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<License>>(
          future: loadLicenses(context),
          builder: (context, snapshot) {
            final licenses = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  return LicensesWidget(licenses: licenses);
                }
            }
          },
        ),
      );

  Future<List<License>> loadLicenses(BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final licenses = await bundle.loadString('assets/licenses.json');

    return json
        .decode(licenses)
        .map<License>((license) => License.fromJson(license))
        .toList();
  }
}
