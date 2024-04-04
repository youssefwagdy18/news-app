import 'dart:ui';

class CategoryDM{
  String categoryId;
  String title;
  String imagePath;
  Color categoryColor;
  CategoryDM ({required this.categoryId ,required this.title ,
    required this.imagePath ,required this.categoryColor});
  static List<CategoryDM>getCategories(){
    return  [
      CategoryDM(categoryId: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          categoryColor: Color(0xffff0000)),
      CategoryDM(categoryId: 'general',
          title: 'General',
          imagePath: 'assets/images/Politics.png',
          categoryColor: Color(0xff0015ff)),
      CategoryDM(categoryId: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          categoryColor: Color(0xffED1E79)),
      CategoryDM(categoryId: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          categoryColor: Color(0xffCF7E48)),
      CategoryDM(categoryId: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/environment.png',
          categoryColor: Color(0xff4882CF)),
      CategoryDM(categoryId: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          categoryColor: Color(0xffF2D352)),
      CategoryDM(categoryId: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/ball.png',
          categoryColor: Color(0xffff0000)),
    ];
  }

}
//     entertainment      science