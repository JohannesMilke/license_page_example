import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:license_page_example/model/license.dart';
import 'package:license_page_example/widget/licenses_widget.dart';

class LicensesRegistryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Licenses'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<License>>(
          future: loadLicenses(),
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

  Future<List<License>> loadLicenses() async =>
      LicenseRegistry.licenses.asyncMap<License>((license) async {
        final title = license.packages.join('\n');
        final text = license.paragraphs
            .map<String>((paragraph) => paragraph.text)
            .join('\n\n');

        return License(title, text);
      }).toList();
}
