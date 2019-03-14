import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmailListTile extends StatelessWidget {
  const EmailListTile({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
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
  }
}
