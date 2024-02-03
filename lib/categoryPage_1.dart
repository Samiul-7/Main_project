import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart_page_1.dart';
import 'MedTile.dart';
import 'Widgets/product_overview.dart';
import 'cart_page.dart';
import 'detailsPage_1.dart';
import 'homepage.dart';

class categoryPage_1 extends StatelessWidget {
  // final List<String> imagePaths = [
  //   'assets/vitE1.png',
  //   'assets/vitC1.png',
  //   'assets/vitrum1.png',
  //   'assets/centrum1.png',
  //   'assets/vitB121.png',
  //   'assets/revital1.png',
  // ];
  //
  // final List<String> imageNames = [
  //   'Vitamin E',
  //   'Vitamin C',
  //   'Vitrum',
  //   'Centrum',
  //   'Vitamin B12',
  //   'Revital',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 350,),
              FloatingActionButton(
                  onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Cart_page();
                  },),),
                backgroundColor: Colors.green,
                child: Icon(Icons.shopping_bag),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Handle search input change
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: imagePaths.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Column(
          //           children: [
          //             Image.asset(
          //               imagePaths[index],
          //               width: 100.0,
          //               height: 100.0,
          //               fit: BoxFit.cover,
          //             ),
          //             SizedBox(height: 8.0),
          //             Text(
          //               imageNames[index],
          //               style: TextStyle(
          //                   fontSize: 16.0, fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) =>
          //                   detailsPage_1(category: imageNames[index]),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
          Expanded(
              child:Consumer<CartModel>(
                builder: (context,value,child){
                  return GridView.builder(
                    itemCount: value.meds.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                      itemBuilder:(context,index){
                        return MedTile(
                         medName: value.meds[index][0],
                          medPrice: value.meds[index][1],
                          medImg: value.meds[index][2],
                          onPressed: (){
                           Provider.of<CartModel>(context,listen: false)
                            .addItemToCart(index);
                          },
                          //////////////////
                          onPressed1: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (_)=>product_overview(
                                  value.baby[index][0],value.baby[index][2],value.baby[index][1],
                                )));
                          },
                          //////////////
                        ) ;
                      }
                  );
                }
              )
          )
        ],
      ),
    );
  }
}