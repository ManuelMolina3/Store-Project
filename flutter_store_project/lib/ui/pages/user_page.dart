import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_project/blocs/product/product_bloc.dart';
import 'package:flutter_store_project/repositories/product/product_repository.dart';
import 'package:flutter_store_project/repositories/product/product_repository_impl.dart';
import 'package:flutter_store_project/ui/widgets/product_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late ProductRepo productRepo;
  late ProductBloc productBloc;

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
          actions: [
            IconButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                icon: const Icon(Icons.filter_list))
          ],
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
              return ProductCard(product: product, index: index);
            },
          );
        } else if (state is ProductFetchError) {
          return Text(state.errorMesage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: ListView(
                children: const [
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.production_quantity_limits),
                        Text("Products")
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
