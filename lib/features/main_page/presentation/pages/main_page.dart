import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/core/colors.dart';

import '../../../../setup.dart';
import '../../../home_page/presentation/cubit/categories_cubit.dart';
import '../../../home_page/presentation/cubit/products_cubit.dart';
import '../../../home_page/presentation/screen/home_page.dart';
import '../../../profile_page/presentation/pages/profile_page.dart';
import '../../../shopping_list/presentation/pages/shopping_list_page.dart';
import '../cubit/main_page_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainPageCubit = MainPageCubit();
  final categoriesCubit = getIt<CategoriesCubit>();
  final productsCubit = getIt<ProductsCubit>();
  final pageController = PageController();

  final screens = <Widget>[
    const HomePage(),
    const ShoppingListPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
        bloc: mainPageCubit,
        builder: (context, state) {
          return Scaffold(
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: screens,
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedIconTheme:
                    const IconThemeData(size: 31, color: activeIndicatorColor),
                unselectedIconTheme:
                    const IconThemeData(size: 30, color: passiveIndicatorColor),
                selectedFontSize: 16,
                unselectedFontSize: 14,
                onTap: (index) {
                  mainPageCubit.changePage(index);
                  pageController.jumpToPage(index);
                },
                currentIndex: mainPageCubit.state.pageIndex,
                items: const [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                      label: "Shopping list",
                      icon: Icon(Icons.shopping_cart_outlined),
                      activeIcon: Icon(Icons.shopping_cart)),
                  BottomNavigationBarItem(
                      label: "Profile",
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person)),
                ],
              ));
        });
  }
}
