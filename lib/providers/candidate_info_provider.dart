import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteSummary with ChangeNotifier {
  final String id;
  final String name;
  final String party;
  final String total;
  final Color bColor;

  VoteSummary({
    this.id,
    this.name,
    this.party,
    this.total,
    this.bColor,
  });
}

class VSummary with ChangeNotifier {
  List<VoteSummary> _items = [
    VoteSummary(
      id: 'v1',
      name: 'Kanbaa Aisaa Ranikamana',
      party: 'PPM',
      total: '474',
      bColor: Color(0xffF69383),
    ),
    VoteSummary(
      id: 'v2',
      name: 'Mariyam Zeeshan',
      party: 'MDP',
      total: '346',
      bColor: Color(0xffFBB97C),
    ),
    VoteSummary(
      id: 'v3',
      name: 'Baathil Vote',
      party: 'No party',
      total: '7',
      bColor: Color(0xffEACBCB),
    ),
  ];

  List<VoteSummary> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }
}
