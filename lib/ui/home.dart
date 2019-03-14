import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/data/classes/email.dart';
import 'package:gmail_clone/data/dummy_data.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';

import 'common/common.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmailItem> _emails;
  @override
  void initState() {
    _emails = emails;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold.builder(
      detailBuilder: (BuildContext context, int index) {
        final i = _emails[index];
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
                onPressed: () {
                  setState(() {
                    _emails.removeAt(index);
                  });
                },
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
          body: EmailView(
            item: i,
            favoriteChanged: () {
              setState(() {
                i.favorite = !i.favorite;
              });
            },
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
      itemCount: _emails?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final i = _emails[index];
        final bool _lastItem = (index + 1) == emails?.length ?? 0;
        if (_lastItem) {
          return Container(
            padding: EdgeInsets.only(bottom: 70.0),
            child: EmailListTile(
              item: i,
              favoriteChanged: () {
                setState(() {
                  i.favorite = !i.favorite;
                });
              },
            ),
          );
        }
        return EmailListTile(
          item: i,
          favoriteChanged: () {
            setState(() {
              i.favorite = !i.favorite;
            });
          },
        );
      },
      floatingActionButton: EmailFAB(),
    );
  }
}
