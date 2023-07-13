import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) {
          return (controller.categoriesLoading || controller.productsLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchTextFormField(),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            CategoriesListView(
                              categories: controller.categoryModelList,
                            ),
                            SizedBox(
                              height: 46,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best Selling",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            BestSellingProductsListView(
                              products: controller.bestSellingProducts,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            child: Image.network(
              category.image,
              width: 40,
              height: 40,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(1, 4),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            height: 16,
          ),
          Text(category.name),
        ],
      ),
    );
  }
}

class BestSellingProductsListView extends StatelessWidget {
  const BestSellingProductsListView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
          itemCount: products.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductItem(product: product);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 8,
            );
          }),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            product.name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            product.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontSize: 16, color: Colors.greenAccent.shade700),
          ),
        ],
      ),
    );
  }
}