import 'package:flutter/material.dart';
import 'package:gmail_clone/data/classes/email.dart';
import 'package:intl/intl.dart';

class EmailListTile extends StatelessWidget {
  const EmailListTile({
    Key key,
    @required this.item,
  }) : super(key: key);

  final EmailItem item;

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
              child: Text(item?.avatar ?? ""),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item?.title ?? "",
                    style: Theme.of(context).textTheme.display1.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                  Text(
                    item?.description ?? "",
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                  ),
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
                icon: (item?.favorite ?? false)
                    ? Icon(Icons.star, color: Colors.yellow)
                    : Icon(Icons.star_border),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
