import 'package:ecommerce_app/core/services/home_services.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final HomeServices _homeServices = HomeServices();
  List<CategoryModel> categoryModelList = [];
  List<ProductModel> bestSellingProducts = [];
  bool categoriesLoading = true;
  bool productsLoading = true;

  HomeViewModel() {
    fetchCategories();
    fetchBestSellingProducts();
  }

  Future<void> fetchCategories() async {
    try {
      List<Object?> categoryData = await _homeServices.getCategories();
      categoryModelList = categoryData
          .map((data) => CategoryModel.fromJson(data as Map<String, dynamic>))
          .toList();
      print(categoryModelList.length);
    } catch (e) {
      // Handle error
      print('Error fetching categories: $e');
    } finally {
      categoriesLoading = false;
      update();
    }
  }

  Future<void> fetchBestSellingProducts() async {
    try {
      List<Object?> productData = await _homeServices.getProducts();
      bestSellingProducts = productData
          .map((data) => ProductModel.fromJson(data as Map<String, dynamic>))
          .toList();
      print(bestSellingProducts.length);
    } catch (e) {
      // Handle error
      print('Error fetching best selling products: $e');
    } finally {
      productsLoading = false;
      update();
    }
  }
}

