import 'package:councilvote/util/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/candidate_info_provider.dart';

class CandidateSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final candidatesummary = Provider.of<VoteSummary>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: candidatesummary.bColor,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            candidatesummary.name ?? 'No name',
            style: TextStyle(
              color: Constants.candiNameTxt,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            candidatesummary.party ?? 'No party',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              candidatesummary.total ?? 'No Vote',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
