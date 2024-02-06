import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Count extends StatefulWidget {

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;



  @override
  Widget build(BuildContext context) {



    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (count == 1) {
                setState(() {
                  isTrue = false;
                });

              } else if (count > 1) {
                setState(() {
                  count--;
                });

              }
            },
            child: Icon(
              Icons.remove,
              size: 15,
              color: Color(0xffd0b84c),
            ),
          ),
          Text(
            "$count",
            style: TextStyle(
              color: Color(0xffd0b84c),
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
    setState(() {
    count++;
    });
    },

            child: Icon(
              Icons.add,
              size: 15,
              color: Color(0xffd0b84c),
            ),
          ),
        ],
      )
          : Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isTrue = true;
            });

          },
          child: Text(
            "ADD",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}