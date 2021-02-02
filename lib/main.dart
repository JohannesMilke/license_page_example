import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:license_page_example/page/licenses_custom_page.dart';
import 'package:license_page_example/page/licenses_registry_page.dart';
import 'package:license_page_example/page/licenses_simple_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'License Page';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.indigoAccent),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(
                  text: 'Simple Licenses',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LicensesSimplePage(),
                  )),

                  // onClicked: () => showLicensePage(
                  //   context: context,
                  //   applicationName: 'My App Name',
                  //   applicationIcon: Padding(
                  //     padding: EdgeInsets.all(8),
                  //     child:
                  //         Image.asset('assets/logo.png', width: 48, height: 48),
                  //   ),
                  //   applicationVersion: '0.0.1',
                  //   applicationLegalese: 'Copyright My Company',
                  // ),
                ),
                const SizedBox(height: 24),
                buildButton(
                  text: 'Registry Licenses',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LicensesRegistryPage(),
                  )),
                ),
                const SizedBox(height: 24),
                buildButton(
                  text: 'Custom Licenses',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LicensesCustomPage(),
                  )),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildButton({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        child: Text(text, style: TextStyle(fontSize: 20)),
        onPressed: onClicked,
      );
}
