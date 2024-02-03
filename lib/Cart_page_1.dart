import 'package:aust_pharma1/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart_page extends StatelessWidget {
  const Cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart"),
      backgroundColor: Colors.blue,
      ),
      body:
      Consumer<CartModel>(builder:(context,value,child){
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(value.cartItems[index][2],height: 36,),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text(value.cartItems[index][1]+'TK'),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: ()=>
                                Provider.of<CartModel>(context,listen: false)
                                    .removeFromCart(index),
                          ),
                        ),
                      ),
                    );
                  }
                  ),
              ),
              Padding(
                  padding: EdgeInsets.all(36),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Text('Total Price: ',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                      SizedBox(width: 20,),
                      Text(value.calculateTotal(),style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
