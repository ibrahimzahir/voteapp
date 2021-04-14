import 'dart:collection';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class VoteList extends ChangeNotifier {
  final String id;
  final String name;
  final String nid;
  final String dob;
  final String cAddress;
  final String pAddress;
  final String mobile;
  final String email;
  final String party;
  final String probability;
  final String castIsland;
  final String castBox;
  bool isFavorite;

  VoteList({
    this.id,
    this.name,
    this.nid,
    this.dob,
    this.cAddress,
    this.pAddress,
    this.mobile,
    this.email,
    this.party,
    this.probability,
    this.castIsland,
    this.castBox,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class VList extends ChangeNotifier {
  List<VoteList> _items = [
    VoteList(
      id: 'v1',
      name: 'Ahnemd Ali',
      nid: 'A234032',
      dob: '2001/01/02',
      cAddress: 'Meenazuge',
      pAddress: 'Eynazuge',
      mobile: '7293933',
      email: 'test@gmail.com',
      party: 'MMP',
      probability: '0',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v2',
      name: 'Saiman Mohamed',
      nid: 'A153132',
      dob: '1967/01/02',
      cAddress: 'Alimasge',
      pAddress: 'Siddeeguge',
      mobile: '7934933',
      email: 'test@gmail.com',
      party: 'MPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v3',
      name: 'Liusha Mohamed',
      nid: 'A254132',
      dob: '1970/11/02',
      cAddress: 'Kavasa',
      pAddress: 'Mariguge',
      mobile: '9934233',
      email: 'test@gmail.com',
      party: 'MRR',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v4',
      name: 'Saiman Mohamed',
      nid: 'A153132',
      dob: '1967/01/02',
      cAddress: 'Alimasge',
      pAddress: 'Siddeeguge',
      mobile: '7934933',
      email: 'test@gmail.com',
      party: 'MPM',
      probability: '0',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v5',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v6',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v7',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v8',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v9',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v10',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v11',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
    VoteList(
      id: 'v12',
      name: 'Nashath Sam Mohamed',
      nid: 'A253122',
      dob: '1997/01/12',
      cAddress: 'Simon',
      pAddress: 'Pareyra',
      mobile: '9954963',
      email: 'test@gmail.com',
      party: 'TPM',
      probability: '1',
      castIsland: 'Dhevvadhoo',
      castBox: 'P06B1',
    ),
  ];

  //UnmodifiableListView<VoteList> get items => UnmodifiableListView(_items);

  String _searchString = "";

  UnmodifiableListView<VoteList> get items => _searchString.isEmpty
      ? UnmodifiableListView([..._items])
      : UnmodifiableListView(
          _items.where(
            (vname) => vname.name
                .contains(_searchString.substring(0, 1).toUpperCase()),
          ),
        );

  void changeSearchString(String searchString) {
    _searchString = searchString;
    print(_searchString);
    notifyListeners();
  }

  // List<VoteList> get items {
  //   return [..._items];
  // }

  List<VoteList> get favoriteItems {
    return _items.where((voteList) => voteList.isFavorite).toList();
  }

  int get favTotalItems {
    return _items.where((voteList) => voteList.isFavorite).length;
  }

  int get nofavTotalItems {
    return ((_items.length) -
        (_items.where((voteList) => voteList.isFavorite).length));
  }

  int get nonfavTotalItems {
    return (nofavTotalItems - favTotalItems);
  }

  VoteList findById(String id) {
    return _items.firstWhere((voter) => voter.id == id);
  }
}
