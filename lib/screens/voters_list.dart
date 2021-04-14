import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import '../providers/voters_list_provider.dart';

import '../widgets/disp_vote_list.dart';

enum GRID_FILTER {
  FAVORITES_ONLY,
  SHOW_ALL,
}

class VoterMList extends StatefulWidget {
  var _showOnlyFavorites = false;

  static const routeName = '/vote-list';

  @override
  _VoterMListState createState() => _VoterMListState();
}

class _VoterMListState extends State<VoterMList> {
  bool _showFavoritesOnly = false;
  var _isInit = true;
  final _controller = TextEditingController();
  String _searchText;

  @override
  void initState() {
    _controller.addListener(
      () {
        setState(() {
          _searchText = _controller.text;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleFilterChange(bool state) {
    setState(() {
      _showFavoritesOnly = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final votersfList = Provider.of<VList>(context);
    final vLisst =
        _showFavoritesOnly ? votersfList.favoriteItems : votersfList.items;

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
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Probability',
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    PopupMenuButton(
                      onSelected: (GRID_FILTER filter) {
                        if (filter == GRID_FILTER.FAVORITES_ONLY) {
                          _handleFilterChange(true);
                        } else {
                          _handleFilterChange(false);
                        }
                      },
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (_) => [
                        PopupMenuItem(
                          child: Text('Only Favorites'),
                          value: GRID_FILTER.FAVORITES_ONLY,
                        ),
                        PopupMenuItem(
                          child: Text('Show All'),
                          value: GRID_FILTER.SHOW_ALL,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: <Widget>[
                        Consumer<VList>(
                          builder: (ctx, vote, child) => Container(
                            height: 50,
                            width: 115,
                            decoration: BoxDecoration(
                              color: Color(0xFF40C4FF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Total: ${vote.nofavTotalItems.toString()}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Consumer<VList>(
                          builder: (ctx, vote, child) => Container(
                            height: 50,
                            width: 115,
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight),
                              color: Color(0xFFFF4081),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                  'Yageen: ${vote.favTotalItems.toString()}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Consumer<VList>(
                          builder: (ctx, vote, child) => Container(
                            height: 50,
                            width: 115,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFECB3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text('Not: ${vote.nonfavTotalItems}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Voters List',
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controller,
                  onChanged: (value) {
                    Provider.of<VList>(context, listen: false)
                        .changeSearchString(value);
                  },
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ),
                      splashColor: Colors.grey,
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      splashColor: Colors.grey,
                      onPressed: () {
                        setState(() {
                          controller:
                          _controller;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[700],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[700],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintText: 'Search...',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: vLisst.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: vLisst[i],
                    child: DispVoteMList(_showFavoritesOnly),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
