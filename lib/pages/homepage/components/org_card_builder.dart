import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/org.dart';

class BuildCard extends StatefulWidget {
  final OrganizationInfo org;
  const BuildCard({required this.org, Key? key}) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  Color borderColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      onTap: () {
        setState(() {
          borderColor = Colors.amber;
        });
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 6,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  widget.org.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                child: Image.network(
                  widget.org.image.path,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                widget.org.mission,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
