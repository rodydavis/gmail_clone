import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmail_clone/data/classes/email.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

class EmailView extends StatefulWidget {
  EmailView({
    @required this.item,
    this.favoriteChanged,
  });

  final EmailItem item;
  final VoidCallback favoriteChanged;

  @override
  _EmailViewState createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  String _preview;

  @override
  void initState() {
    rootBundle.loadString("assets/email_preview.md").then((data) {
      setState(() {
        print("Data: $data");
        _preview = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_preview == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.item?.title ?? "",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              IconButton(
                icon: (widget.item?.favorite ?? false)
                    ? Icon(Icons.star, color: Colors.amber)
                    : Icon(Icons.star_border),
                onPressed: widget.favoriteChanged,
              ),
            ],
          ),
        ),
        Expanded(
          child: Markdown(data: _preview),
        ),
      ],
    );
  }
}
