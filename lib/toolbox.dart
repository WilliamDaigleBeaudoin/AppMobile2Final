import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';


class BouttonDestination extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final Widget destination;
  const BouttonDestination(
      {super.key,
      required this.text,
      this.textColor = Colors.white,
      this.borderColor = Colors.black,
      required this.destination});
  @override
  State<BouttonDestination> createState() => _BouttonDestination();
}

class _BouttonDestination extends State<BouttonDestination> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (OutlinedButton(
        onHover: null,
        style: OutlinedButton.styleFrom(
          primary: widget.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          fixedSize: const Size(500, 50),
          side: BorderSide(width: 2.0, color: widget.borderColor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.destination),
          );
        },
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 20),
        ),
      )),
    );
  }
}
