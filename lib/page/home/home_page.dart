import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/network/repository/app_repository.dart';
import 'package:pokemon/network/response/pokemon_response.dart';
import 'package:pokemon/page/detail/detail_page.dart';
import 'package:pokemon/utils/const.dart';
import 'package:pokemon/utils/custom_theme.dart';
import 'package:pokemon/utils/navigation_utils.dart';
import 'package:pokemon/widget/custom_cached_network_image.dart';
import 'package:pokemon/widget/empty_page_widget.dart';
import 'package:pokemon/widget/error_page_widget.dart';
import 'package:pokemon/widget/stack_loading_view.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomeCubit _cubit;
  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    AppRepository repository = AppRepository();
    _cubit = HomeCubit(repository: repository);
    _pagingController.addPageRequestListener((pageKey) {
      _cubit.getData(pageKey: pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: BlocProvider(
          create: (context) => _cubit,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is ListPokemon) {
                if (state.nextPageKey is int) {
                  _pagingController.appendPage(
                      state.itemList ?? [], state.nextPageKey);
                }
                if (state.nextPageKey == null) {
                  _pagingController.appendLastPage(state.itemList ?? []);
                }
              }

              if (state is ListPokemonFailure) {
                _pagingController.error = state.error;
              }

              if (state is DetailPokemon) {
                if (state.detail != null) {
                  NavigationUtils.rootNavigatePage(
                      context, DetailPage(detail: state.detail!));
                }
              }
            },
            builder: (
              BuildContext context,
              HomeState state,
            ) {
              return SafeArea(top: true, child: _buildPage(context, state));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, HomeState state) {
    return StackLoadingView(
      visibleLoading: state is HomeLoading,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        color: AppColors.primaryColor,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/splash_background.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          children: [
            Image.asset(
              'assets/logo_pokedex2.png',
              height: 80.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => Future.sync(
                  () => _pagingController.refresh(),
                ),
                child: PagedGridView(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                      animateTransitions: true,
                      firstPageErrorIndicatorBuilder: (context) =>
                          ErrorPageWidget(
                            messageError: _pagingController.error.toString(),
                            onTap: () => _pagingController.refresh(),
                          ),
                      noItemsFoundIndicatorBuilder: (context) =>
                          EmptyPageWidget(),
                      itemBuilder: (context, data, index) => _content(data)),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 100 / 100,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(Pokemon data) {
    Uri uri = Uri.dataFromString(data.url ?? "");
    String id = uri.pathSegments[6];
    String image =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${id}.png";

    return GestureDetector(
      onTap: () => _cubit.getDetail(data.url ?? ""),
      child: Card(
        color: Color.fromARGB(255, 150, 231, 255),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                AppImages.pokeball,
                width: 200.h,
                height: 200.h,
              ),
            ),
            Container(
              child: CustomCachedNetworkImage(url: image, fit: BoxFit.cover),
            ),
            Text(
              (data.name ?? "").toTitleCase(),
              style: Theme.of(context).textTheme.buttonRegular,
            ),
          ],
        ),
      ),
    );
  }
}
