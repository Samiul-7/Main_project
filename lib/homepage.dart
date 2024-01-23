import 'package:aust_pharma1/Widgets/single_product.dart';
import 'package:aust_pharma1/chat_page.dart';
import 'package:aust_pharma1/login_page.dart';
import 'package:flutter/material.dart';
import 'categoryPage_1.dart';
import 'categoryPage_2.dart';
import 'categoryPage_3.dart';
import 'profile_page.dart';
class home_page extends StatelessWidget {

  Widget _medicine(context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Medicine',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              GestureDetector(
                onTap: () {
                  // Navigate to Category1Page when 'View All' is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => categoryPage_1()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              children: [
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),

              ],
            ),
          ),
        ),

      ],
    );
  }
  Widget _babyProduct(context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Baby product',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              GestureDetector(
                onTap: () {
                  // Navigate to Category1Page when 'View All' is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => categoryPage_1()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              children: [
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),

              ],
            ),
          ),
        ),

      ],
    );
  }
  Widget _womanCare(context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Woman Care',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              GestureDetector(
                onTap: () {
                  // Navigate to Category1Page when 'View All' is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => categoryPage_1()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              children: [
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),
                Single_product("assets/napa.png", "Napa 500", (){}),

              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget listTile(IconData icon,String title)
  {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(

        )
      ),
      onPressed: (){},
      child: ListTile(
        leading: Icon(
            icon,
        size: 32),
        title: Text(
          title,
          style: TextStyle(color: Colors.black54),),



      ),
    );


  }
  //const home_page({super.key});
  final List<String> adImages = [
    'https://i.ytimg.com/vi/MnbXAGk0QpQ/maxresdefault.jpg',
    'https://cdn.create.vista.com/common/0e0de995-736f-445f-b8e6-ca05deb88727_1024.jpg',
    'https://i.ytimg.com/vi/Lr6YxLmOZhY/maxresdefault.jpg',
    'https://cdn4.vectorstock.com/i/1000x1000/36/23/advertisement-with-aloe-vera-vector-23863623.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9ca316112601411.6017ec4f13f19.jpg',
    'https://img.freepik.com/free-vector/hair-oil-cosmetics-bottle-ad-vector-banner_107791-655.jpg',
  ];
  final List<String> categories =['Menu','1.Women','2.Baby','3.Others'];
  String selectedcategory='Menu';
  @override
  //_MyHomePageState createState() => _MyHomePageState();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        drawer: Drawer(
          child: Container(
            color: Colors.greenAccent,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 43,
                        child: CircleAvatar(
                          child:Container(
                            height: 60,
                            width: 60,
                             child: Image.asset("assets/abstract.png"),

                          ),
                          backgroundColor: Colors.orangeAccent,
                          radius: 40,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome ",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 30,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(

                                        width: 2,
                                      )
                                  )
                              ),
                              onPressed: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (_)=>login_page()));
                              },
                              child: Text("Log in"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.person_2_outlined),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)=>ProfilePage()));

                  },
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('Chat With Us'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)=>chat_page()));
                    ;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Review Cart'),
                  onTap: () {
                    print("Review page is loading. . . .");
                  },
                ),
                listTile(Icons.star_outline, "Rating"),
                listTile(Icons.favorite_outlined, "Wish list"),
                listTile(Icons.copy_all_outlined, "Complain Box"),
                listTile(Icons.question_mark_outlined, "FAQ"),
                Container(
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Contact Support",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                         children: [
                           Text("Contact no:",style: TextStyle(fontWeight: FontWeight.bold),),
                           SizedBox(
                             width: 10,
                           ),
                           Text("01983716969"),
                         ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Mail Address:",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 10,
                            ),
                            Text("shafin@gmail.com"),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )

        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.green,
          title: Row(

            children: [
              SizedBox(width: 10),
              Text('AUST Pharma',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  )
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        //controller: _searchcontroller,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: adImages.length,
                      itemBuilder: (context,index){
                        return Container(
                          width: 200,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(adImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    )
                ),
               _medicine(context),
                _womanCare(context),
                _babyProduct(context),





              ]
          ),
        )

    );
  }
}