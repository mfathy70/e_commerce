import 'package:e_commerce/UI/screens/Home%20Screen/Home%20Screen%20Widgets/featured/featured_offers_widget.dart';
import 'package:e_commerce/UI/widgets/search_button.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key, required this.vendorName});

  final String vendorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: VendorScreenAppBar(vendorName: vendorName),
        body: SizedBox(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 150),
                  itemCount: 26,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
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
                              'https://is3-ssl.mzstatic.com/image/thumb/Purple124/v4/7f/01/d3/7f01d3fa-f802-fcff-e20a-3d58650a17ee/source/512x512bb.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                vendorName,
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
