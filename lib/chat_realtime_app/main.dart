import 'package:flutter/material.dart';
import 'package:some_app_firebase/chat_realtime_app/pages/home_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      theme: ThemeData(primaryColor: Color(0xff3d814a)),
      home: HomePage(),
    );
  }
}
