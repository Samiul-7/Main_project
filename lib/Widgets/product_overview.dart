import 'package:flutter/material.dart';
enum SinginCharacter{fill,outline}
class product_overview extends StatefulWidget{
  const product_overview ({super.key});

  @override
  State<product_overview> createState() => _product_overviewState();

}
class _product_overviewState extends State<product_overview>
{
  SinginCharacter _character = SinginCharacter.fill;
  Widget bottommNavigatorBar(Color iconColor,Color backgroundColor,String title,IconData iconData)
  {
    return Expanded(child: Container(
      padding: EdgeInsets.all(20),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData,size: 17,color:iconColor),
          SizedBox(width: 5,),
          Text(title,style: TextStyle(color: Colors.black),)



        ],
      ),


    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottommNavigatorBar(Colors.grey, Colors.deepOrange,"Add to Wishlist", Icons.favorite_outlined),
          bottommNavigatorBar(Colors.grey, Colors.orangeAccent,"Add to Cart", Icons.shop_2_outlined),


        ],
      ) ,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,

        iconTheme: IconThemeData(color: Colors.black54),
        title: Text(
          "Product Overview",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
          width: double.infinity,
          child: Column(
          children: [
            ListTile(
              title: Text("Napa 500"),
      subtitle: Text("100 Taka"),


          ),
          Container(
          height: 250,
          padding: EdgeInsets.all(40),
          child: Image.asset("assets/napa.png"),

          ),
            Container(
             padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text("Available Options",textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w600),
              ),

            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.redAccent,

                      ),
                      Radio(
                        value: SinginCharacter.fill,
                        groupValue: _character,
                        activeColor: Colors.green,
                        onChanged: (value){
                          setState(() {
                            _character = value!;
                          });

                        },
                      )
                    ],
                  ),
                  Text("100 Tk"),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,

                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),

                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                        size: 17,
                        color: Colors.orange,),
                        Text("ADD",style: TextStyle(
                          color: Colors.red,


                        ),)

                      ],
                    ),
                  )
                ],
              ),
            )

        ],
      ),
      )),
          Expanded
            (
            //flex: 1,

              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Indication",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                      SizedBox(height: 10,),
                      Text("Napa 500 mg is indicated for fever, common cold and influenza, headache, toothache, earache, bodyache, myalgia, neuralgia, dysmenorrhoea, sprains, colic pain, back pain, post-operative pain, postpartum pain, inflammatory pain and post vaccination pain in children. It is also indicated for rheumatic & osteoarthritic pain and stiffness of joints.",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black,
                      ),),
                      Text("Indication",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                      Text("Napa 500 mg is indicated for fever, common cold and influenza, headache, toothache, earache, bodyache, myalgia, neuralgia, dysmenorrhoea, sprains, colic pain, back pain, post-operative pain, postpartum pain, inflammatory pain and post vaccination pain in children. It is also indicated for rheumatic & osteoarthritic pain and stiffness of joints.",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black,
                      ),),
                  
                  
                    ],
                  
                  ),
                ),



                        ))
        ],
      ),
    );
  }

}
