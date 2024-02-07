import 'package:aust_pharma1/Widgets/product_overview.dart';
import 'package:aust_pharma1/usuables/count.dart';
import 'package:flutter/material.dart';

import '../profile_page.dart';
class Single_product extends StatelessWidget{
  final String product_image;
  final String product_name;
  final String productPrice;
  final Function onTap;

  Single_product(this.product_image, this.product_name, this.onTap, this.productPrice);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    height: 230,
    width: 160,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: InkWell(
        // onTap: (){
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //       builder: (_)=>product_overview(
        //         product_name,product_image,productPrice,
        //       )));
        //
        // },
        onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
          return product_overview(product_name,product_image,productPrice,);
        },),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(

              child: Image.asset(product_image),
              flex: 2,),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(product_name,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),

                  ),
                  Text(productPrice,style: TextStyle(
                    color: Colors.grey,

                  ),

                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text(
                                "1 Box",
                                style: TextStyle(fontSize: 10),
                              )),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.redAccent,
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    Count(),
                    ],
                  )
                ],
              ),)
          ],
        ),
      ),
    ),

        );
  }


}