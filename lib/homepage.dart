import 'package:flutter/material.dart';

class home_page extends StatelessWidget {
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.green,
          title: Row(
            children: [
              SizedBox(width: 10),
              DropdownButton<String>(
                value: selectedcategory,
                onChanged: (String? newValue){
                  if(newValue != null){
                    selectedcategory=newValue;
                  }
                },
                items: categories.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text('AUST Pharma',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  )
              ),

            ],
          ),


        ),

        body: Column(
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

              )

            ]
        )

    );
  }
}