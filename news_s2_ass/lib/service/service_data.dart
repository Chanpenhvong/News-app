  import 'package:news_s2_ass/models/category_model.dart';

List<CategoryModel> getCategories(){
  
  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

    categoryModel.categoryName ="Business";
    categoryModel.image="images/business.jpg";
    category.add(categoryModel);
    categoryModel= new CategoryModel();


    categoryModel.categoryName ="Entertainment";
    categoryModel.image="images/entertaiment.jpg";
    category.add(categoryModel);
    categoryModel= new CategoryModel();


     categoryModel.categoryName ="Health";
    categoryModel.image="images/health.jpg";
    category.add(categoryModel);
    categoryModel= new CategoryModel();


    categoryModel.categoryName ="Sport";
    categoryModel.image="images/sport.jpg";
    category.add(categoryModel);
    categoryModel= new CategoryModel();





    return category;
}