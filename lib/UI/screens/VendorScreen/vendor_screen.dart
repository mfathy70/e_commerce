import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/featured/featured_offers_widget.dart';
import 'package:e_commerce/UI/widgets/search_button.dart';
import 'package:e_commerce/services/remote_service.dart';
import 'package:flutter/material.dart';
import '../../../model/products.data.dart';
import 'product_skeleton.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key, required this.vendorName});

  final String vendorName;

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  List<Products>? products;
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    products = await RemoteService().getProducts();

    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: VendorScreenAppBar(vendorName: widget.vendorName),
        body: SizedBox(
          child: Visibility(
            visible: isLoaded,
            replacement: const ProductsSkeleton(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const FeaturedOffersWidget(image: 'assets/images/food2.jpg'),
                  GridView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 150),
                    itemCount: products?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 0.8,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                products![index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  products![index].title,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(height: 1.2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class VendorScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const VendorScreenAppBar({
    Key? key,
    required this.vendorName,
  }) : super(key: key);

  final String vendorName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              toolbarHeight: 45,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  )),
              title: Text(
                vendorName,
                style: const TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
            const SearchButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(105);
}
