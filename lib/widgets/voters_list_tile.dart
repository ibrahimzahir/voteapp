import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/voters_list_provider.dart';
import '../screens/voters_list.dart';

class VoterListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final votersfList = Provider.of<VList>(context);

    final vLisst = votersfList.items;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFEEE0),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'View Voters List',
                        style:
                            TextStyle(color: Color(0xffFC9535), fontSize: 19),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Kudahuvadhoo List',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        VoterMList.routeName,
                      );
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
