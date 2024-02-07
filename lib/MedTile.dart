import 'package:flutter/material.dart';
class MedTile extends StatelessWidget {
  final String medName;
  final String medPrice;
  final String medImg;
  void Function()? onPressed1;
  void Function()? onPressed;

  MedTile({
    super.key,
    required this.medName,
    required this.medPrice,
    required this.medImg,
    required this.onPressed,
    required this.onPressed1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          //image
          Image.asset(medImg,height:200),
          //item name
          Text(medName,style: TextStyle(fontSize: 20),),
          //price + button
          MaterialButton(
              onPressed:onPressed,
            color: Colors.green,
            child: Text(
              medPrice,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            onPressed:onPressed1,
            color: Colors.green,
            child: Text(
              "Details",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
        ),
      ),
    );
  }
}
