import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          bottom: false,
          child: Container(
            height: 60,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 330,
                  child: TextField(
                    controller: searchController,
                    onChanged: (data) {
                      if (searchController.text.isEmpty) {
                        isEmpty = true;
                      } else {
                        isEmpty = false;
                      }
                      setState(() {});
                    },
                    style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle:
                            TextStyle(color: Colors.grey[500], fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.1),
                        ),
                        hintText: 'Search for any shop or product',
                        isDense: true,
                        contentPadding: const EdgeInsets.all(6),
                        prefixIcon: isEmpty
                            ? Icon(
                                Icons.search_rounded,
                                size: 24,
                                color: Colors.grey[500],
                              )
                            : null,
                        prefixIconConstraints: const BoxConstraints(
                          maxWidth: 40,
                          minWidth: 40,
                          maxHeight: 30,
                          minHeight: 30,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.qr_code_2_rounded,
                            size: 22,
                            color: Colors.grey[500],
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          maxWidth: 40,
                          minWidth: 40,
                          maxHeight: 40,
                          minHeight: 40,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
