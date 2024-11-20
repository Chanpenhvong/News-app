// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_s2_ass/models/article_model.dart';
import 'package:news_s2_ass/models/carousel_item.dart';
import 'package:news_s2_ass/models/category_model.dart';
import 'package:news_s2_ass/pages/articles_page.dart';
import 'package:news_s2_ass/service/service_carousel.dart';
import 'package:news_s2_ass/service/service_data.dart';
import 'package:news_s2_ass/service/service_news.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  @override
    void initState(){
      getSlider();
      categories = getCategories();
      getNews();
      super.initState();
    }

  getNews()async{
    News newsclass = News();
    await newsclass.getNews();
    articles=newsclass.news;
    setState(() {
      _loading=false;
    });
  }

  getSlider()async{
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders =slider.sliders;
    
  }


  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Text("CAM",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),), 
                      SizedBox(width: 10,),
                      Text("News", style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),


                


                
                Container(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                    return CategoryTitle(
                      image: categories[index].image,
                      categoryname: categories[index].categoryName,
                    );
                    } ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("Breaking News!", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    Text("View All", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    ],
                    
                  ),
                ),
                SizedBox(height: 10,),
      
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String? res = sliders[index].urlToImage;
                    String? res1 = sliders[index].title;
                    return buildImage(res!, index, res1!);
                  },
                  options: CarouselOptions(
                    height: 200, 
                    autoPlay: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reson){
                      setState(() {
                        activeIndex = index;
                      });
                    }
                    ),
                   ),
                   SizedBox(height: 20,),
                   Center(child: buildIndicator()),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Row(
                      children: [
                       Expanded(child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    
                          ),
                          onChanged: (text){
                            
                          },
                        ),
                       ))
                      ],
                                    ),
                    ),
                  ),
                   
                   Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("Trending News!", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    Text("View All", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    ],
                  ),
                ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index){
                  return BlogTitle(
                    url: articles[index].url!,
                    imageUrl: articles[index].urlToImage!,
                    desc: articles[index].description!,
                     title: articles[index].title!);
                }),
              )
              ],
            ),
        ),
      ),
    );
  } 
   Widget buildImage(String image, int index, String name) => 
   Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover, 
        width: MediaQuery.of(context).size.width,)),
    
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black26, 
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10))),
            child: Center(
              child: Text(name,
              maxLines: 2,
               style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
        )

      ],
    
    ),
      
  );

  Widget buildIndicator()=> AnimatedSmoothIndicator(
    activeIndex: activeIndex, 
    count: 5,
    effect: ScaleEffect(
      dotWidth: 10,
      dotHeight: 10,
      activeDotColor: Colors.blue
      ),
    );

}





class CategoryTitle extends StatelessWidget {
  final image, categoryname;
  CategoryTitle({this.image, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(image, width: 120, height: 50, fit: BoxFit.cover,)),
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Text(categoryname,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ),
            )
        ],
      ),
    );
  }
}

class BlogTitle extends StatelessWidget{
  String imageUrl, title, desc, url;
  BlogTitle({required this.imageUrl, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticlesDetail(Image: imageUrl, title: title, desc: desc)));
      },
      child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: 
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage (
                                    imageUrl: imageUrl, 
                                  height: 120,
                                  width: 120,
                                    fit: BoxFit.cover,
                                  )),
                              ),
                              SizedBox(width: 8,),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    child: Text(title, 
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                    ),),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    child: Text(desc,
                                    maxLines: 3,
                                     style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                    ),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                  
                      ),
                      
                  ),
                  
                ),
      
    );
    
  }
  
}