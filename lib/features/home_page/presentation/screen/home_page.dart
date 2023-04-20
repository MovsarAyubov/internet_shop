import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/size_config.dart';
import '../../../../core/components/top_app_bar.dart';
import '../../../../l10n/l10n.dart';
import '../../../../setup.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widget/error_widget.dart';
import '../widget/loaded_products.dart';
import '../widget/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final productsCubit = getIt<ProductsCubit>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(
        title: localizationInstance.mainPage,
        appBarHeight: SizeConfig(context, 64)(),
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<ProductsCubit, ProductsState>(
          bloc: productsCubit,
          builder: (context, state) {
            if (state is SuccessState) {
              return LoadedProducts(
                state: state,
              );
            } else if (state is ErrorState) {
              return InternetErrorWidget(
                callback: () async {
                  await productsCubit.loadProducts();
                },
              );
            } else {
              return const CustomLoadingIndicator();
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
