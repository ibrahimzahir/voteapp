import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/voters_list_provider.dart';
import '../screens/voters_details.dart';

class DispVoteMList extends StatelessWidget {
  final bool _showFavoritesOnly;

  DispVoteMList(this._showFavoritesOnly);

  Widget build(BuildContext context) {
    final votersfList = Provider.of<VoteList>(context, listen: false);

    return Column(
      children: [
        ListTile(
          leading: Consumer<VoteList>(
            builder: (ctx, votersList, child) => IconButton(
              icon: Icon(votersfList.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                votersList.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(votersfList.name),
          subtitle: Text(votersfList.cAddress),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushNamed(VotersDetails.routeName,
                  arguments: votersfList.id);
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
