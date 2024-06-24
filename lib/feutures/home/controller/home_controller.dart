import 'package:ecommerceapp/core/app_theme.dart';
import 'package:ecommerceapp/feutures/home/model/all_products_model.dart';
import 'package:ecommerceapp/feutures/home/repository/all_products_repo.dart';
import 'package:ecommerceapp/main.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AllProductsRepo allProductsRepo = AllProductsRepo();

  AllProducts? products;
  AllProducts? productsByCategory;

  List categories = [];

  changTheme(value) {
    isDark = value;
    Get.changeTheme(
        isDark == false ? AppTheme().myLightTheme() : AppTheme().myDarkTheme());
    update();
  }

  @override
  void onInit() {
    getAllProductsName();
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    final data =
        await allProductsRepo.getAllProducts('https://dummyjson.com/products');
    products = AllProducts.fromJson(data);
    update();
  }

  getAllProductsName() async {
    await allProductsRepo.getAllProductsName(
        categories, 'https://dummyjson.com/products/categories');
    update();
  }

  Future<AllProducts> getProductByCategory(String category) async {
    final data = await allProductsRepo
        .getAllProducts('https://dummyjson.com/products/category/$category');
    productsByCategory = AllProducts.fromJson(data);
    return productsByCategory!;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
}
//  [
// "smartphones",
// "laptops",
// "fragrances",
// "skincare",
// "groceries",
// "home-decoration",
// "furniture",
// "tops",
// "womens-dresses",
// "womens-shoes",
// "mens-shirts",
// "mens-shoes",
// "mens-watches",
// "womens-watches",
// "womens-bags",
// "womens-jewellery",
// "sunglasses",
// "automotive",
// "motorcycle",
// "lighting"
// ]