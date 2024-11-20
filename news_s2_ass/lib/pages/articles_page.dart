import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticlesDetail extends StatefulWidget {
  String Image, desc, title;
  ArticlesDetail(
      {required this.Image, required this.title, required this.desc});

  @override
  State<ArticlesDetail> createState() => _ShowItemState();
}

class _ShowItemState extends State<ArticlesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Information"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, 
                  width: 1.0, 
                ),
                borderRadius: BorderRadius.circular(20), 
              ),
              child: CachedNetworkImage(
                imageUrl: widget.Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 95, 100, 237),
                      ),
                      child: Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 89, 54, 244),
                      ),
                      child: Text(
                        "Information",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 111, 54, 244),
                      ),
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 197, 54, 244),
                      ),
                      child: Text(
                        "more",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(widget.title,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(widget.desc, style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
