import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/candidate_info_provider.dart';
import '../providers/voters_list_provider.dart';
import '../widgets/candidate_grid.dart';
import '../widgets/voters_list_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cand_summary = Provider.of<VSummary>(context, listen: false);

    final vs = Provider.of<VList>(context, listen: false);
    final vss = vs.items;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Vote App',
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Vote Summary',
                  style: TextStyle(
                      color: Colors.black87.withOpacity(0.8),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 230,
                  child: CandidateGrid(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Voters List',
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 230,
                      child: VoterListTile(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
