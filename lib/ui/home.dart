import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';

import 'common/common.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold.builder(
      detailBuilder: (BuildContext context, int index) {
        return DetailsScreen(
          appBar: AppBar(
            elevation: 0.0,
            actions: [
              IconButton(
                icon: Icon(Icons.archive),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.mail_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            child: Center(
              child: Text("Item: $index"),
            ),
          ),
        );
      },
      drawer: Drawer(
        child: Container(),
      ),
      slivers: <Widget>[
        SliverFloatingBar(
          floating: true,
          title: TextField(
            decoration: InputDecoration.collapsed(hintText: "Search mail"),
          ),
          trailing: CircleAvatar(
            child: Text("RD"),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Text("All Inboxes"),
          ),
        ),
      ],
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return EmailListTile(
          index: index,
        );
      },
      floatingActionButton: EmailFAB(),
    );
  }
}
