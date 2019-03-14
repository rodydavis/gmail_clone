import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/ui/app/app.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'package:responsive_scaffold/utils/breakpoint.dart';

import '../data/classes/email.dart';
import '../data/dummy_data.dart';
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

  final Size _tabletBreakpoint = Size(510.0, 510.0);

  @override
  Widget build(BuildContext context) {
    final bool _tablet = isTablet(context, breakpoint: _tabletBreakpoint);
    return ResponsiveScaffold.builder(
      tabletBreakpoint: _tabletBreakpoint,
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
      drawer: AppDrawer(),
      tabletSideMenu: _tablet
          ? Flexible(
              flex: 1,
              child: AppSideMenu(),
            )
          : null,
      tabletFlexListView: 4,
      slivers: <Widget>[
        SliverFloatingBar(
          floating: true,
          automaticallyImplyLeading: !_tablet,
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
