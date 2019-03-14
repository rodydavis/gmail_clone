import 'package:flutter/material.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';

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
      slivers: <Widget>[
        SliverAppBar(
          title: Text("App Bar"),
        ),
        SliverToBoxAdapter(
          child: Text("All Inboxes"),
        ),
      ],
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(index.toString()),
        );
      },
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
