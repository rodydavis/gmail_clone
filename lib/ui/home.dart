import 'package:flutter/material.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

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
        return Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  radius: 25.0,
                  child: Text("$index"),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Title: $index"),
                      Text("Details"),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(DateFormat.jm().format(DateTime.now())),
                  IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
