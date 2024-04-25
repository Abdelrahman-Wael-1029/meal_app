class ApiConfig {
  static String baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  static String searchMeal =
      "search.php?"; // search.php?s=Arrabiata  || s="" for all meals
  static String detailsMeal = "lookup.php?"; // meal.php?i=52772
  static String listCategories = "categories.php";
  static String filterMealsByCategory = "filter.php?"; // filter.php?c=Seafood
  static String randomMeal = "random.php"; // random.php
  static Map<String, dynamic> headers =  {
        'Content-Type': 'application/json',
      };
}
