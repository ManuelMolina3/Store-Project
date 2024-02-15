import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_project/blocs/product/product_bloc.dart';
import 'package:flutter_store_project/repositories/product/product_repository.dart';
import 'package:flutter_store_project/repositories/product/product_repository_impl.dart';
import 'package:flutter_store_project/ui/widgets/product_card.dart';
import 'package:flutter_store_project/ui/widgets/product_flip_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductRepo productRepo;
  late ProductBloc productBloc;

  @override
  void initState() {
    productRepo = ProductRepoImpl();
    productBloc = ProductBloc(productRepo)..add(ProductFetchList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: productBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: _productList(),
      ),
    );
  }

  Widget _productList() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductFetchSucces) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, mainAxisSpacing: 5.0),
            itemCount: state.productList.length,
            itemBuilder: (context, index) {
              final product = state.productList[index];
              return ProductFlipCard(product: product, index: index);
            },
          );
        } else if (state is ProductFetchError) {
          return Text(state.errorMesage);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
