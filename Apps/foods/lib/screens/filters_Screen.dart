import 'package:flutter/material.dart';
import 'package:foods/screens/bottom_navigation_bar_screen.dart';
import 'package:foods/widgets/SwitchListTileWidget.dart';
import 'package:foods/widgets/app_bar.dart';

enum Filter {
  gluterFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<StatefulWidget> {
  bool _lactoseFreebool = false;
  bool _glutenFreebool = false;
  bool _vegetarianFreebool = false;
  bool _veganFreebool = false;

  void _filterScreenDrawerFunction(String asd) {
    Navigator.pop(context);
    if (asd == "Foods") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const BottomNavigationBarScreen();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apb("Filters", Theme.of(context).colorScheme.onPrimary, context),
      // drawer: Dra_wer(
      //   textFunction: (text) {
      //     return _filterScreenDrawerFunction(text);
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop == true) return;
          // çünkü 2 aşamadan oluşuyor. istek sırasında false bitince true
          Navigator.of(context).pop({
            Filter.lactoseFree: _lactoseFreebool,
            Filter.gluterFree: _glutenFreebool,
            Filter.vegetarian: _vegetarianFreebool,
            Filter.vegan: _veganFreebool,
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTileWidget(
              callBack: (value) {
                _lactoseFreebool = value;
              },
              b1: _lactoseFreebool,
              t1: "Lactose-Free",
            ),
            SwitchListTileWidget(
              callBack: (value) {
                _glutenFreebool = value;
              },
              b1: _glutenFreebool,
              t1: "Gluter-free",
            ),
            SwitchListTileWidget(
              callBack: (value) {
                _vegetarianFreebool = value;
              },
              b1: _vegetarianFreebool,
              t1: "Vegetarian-free",
            ),
            SwitchListTileWidget(
              callBack: (value) {
                _veganFreebool = value;
              },
              b1: _veganFreebool,
              t1: "Vegan-free",
            ),
          ],
        ),
      ),
    );
  }
}
