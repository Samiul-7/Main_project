import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'CustomTextField.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 48,

          child: MaterialButton(
            onPressed: () {

            },
            child: Text(
              "Add Address",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
          )

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              "First name",

            ),
            CostomTextField(
              "Last name",

            ),
            CostomTextField(
              "Mobile No",

            ),
            CostomTextField(
              "Alternate Mobile No",

            ),
            CostomTextField(
              "Scoiety",

            ),
            CostomTextField(
              "Street",

            ),
            CostomTextField(
              "Landmark",

            ),
            CostomTextField(
              "City",

            ),
            CostomTextField(
              "Aera",

            ),
            CostomTextField(
              "Pincode",

            ),
            InkWell(
              onTap: () {


              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (asd) {},
              secondary: Icon(
                Icons.home,
                color: Colors.orangeAccent,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (asd) {

              },
              secondary: Icon(
                Icons.work,
                color: Colors.orangeAccent,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (asd) {

              },
              secondary: Icon(
                Icons.devices_other,
                color: Colors.orangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}