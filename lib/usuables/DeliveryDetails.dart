import 'package:aust_pharma1/payment_page.dart';
import 'package:aust_pharma1/usuables/SIngleDeliveryItem.dart';
import 'package:flutter/material.dart';

import 'add_new_adress.dart';
class DeliveryDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child:Icon(Icons.add),
        onPressed: (){

        },

      ),
      bottomNavigationBar: Container(

        //width: 160,
          height: 38,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: MaterialButton(
          child: Text("Add new adress"),
          onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDeliverAddress()),
              );


          },
          color: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),


        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset("assets/abstract.png",
            height: 30,),

          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                  "18/2/i", "Home", "Bhasantek Dhaka", "01983716969")
            ],
          ),
          TextButton(
            onPressed: () {
              // Handle the "Pay Now" button click
              // You can navigate to the payment page or perform any other action.
              // For simplicity, let's navigate to the PaymentPage.

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => payment_page()),
                );

            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text(
              'Pay Now',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),

    );
  }


}