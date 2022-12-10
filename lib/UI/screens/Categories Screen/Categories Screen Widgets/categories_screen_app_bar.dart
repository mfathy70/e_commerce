import 'package:flutter/material.dart';

class CategoriesScreenAppbar extends StatelessWidget {
  const CategoriesScreenAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ))),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Text('Delivering to:'),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    child: Text('Port Said, Egypt'),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mail,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
