import 'package:councilvote/providers/voters_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/candidate_info_provider.dart';
import 'candidate_summary.dart';

class CandidateGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cand_summary = Provider.of<VSummary>(context);
    final can_sum = cand_summary.items;

    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: can_sum.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: can_sum[i],
        child: CandidateSummary(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
