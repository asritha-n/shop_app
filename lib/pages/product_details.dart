import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
//import 'package:shop_app/product_list.dart';

//provider provides data to widgets below it in the data tree
//notify listeners calls setState bts

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = (widget.product['sizes'] as List<int>)[0];
  }

  void onTap() {
    Provider.of<CartProvider>(context, listen: false).addProduct({
      'id': widget.product['id'],
      'title': widget.product['title'],
      'price': widget.product['price'],
      'imageUrl': widget.product['imageUrl'],
      'company': widget.product['company'],
      'size': selectedSize,
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Added to Cart!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 250,

              ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,

                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor:
                                selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1),
                            ),
                            label: Text(size.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: Size(350, 50),
                    ),
                    onPressed: onTap,
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
