import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/candidate_info_provider.dart';
import './providers/voters_list_provider.dart';
import './screens/home.dart';
import './screens/voters_details.dart';
import './screens/voters_list.dart';
import './util/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => VSummary(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => VoteList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => VList(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => VoteSummary(),
        // ),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: Constants.lightTheme,
        debugShowCheckedModeBanner: false,
        home: Home(),
        routes: {
          VoterMList.routeName: (ctx) => VoterMList(),
          VotersDetails.routeName: (ctx) => VotersDetails(),
        },
      ),
    );
  }
}
