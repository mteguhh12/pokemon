import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/network/repository/app_repository.dart';
import 'package:pokemon/network/response/pokemon_detail_response.dart';
import 'package:pokemon/utils/const.dart';
import 'package:pokemon/utils/custom_theme.dart';
import 'package:pokemon/utils/enum.dart';
import 'package:pokemon/utils/navigation_utils.dart';
import 'package:pokemon/widget/small_menu_item.dart';
import 'package:pokemon/widget/stack_loading_view.dart';

import 'detail.dart';

class DetailPage extends StatefulWidget {
  final PokemonDetail detail;
  const DetailPage({Key? key, required this.detail}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailCubit _cubit;
  List<String> types = [];
  Color colordata = AppColors.primaryColor;

  @override
  void initState() {
    AppRepository repository = AppRepository();
    _cubit = DetailCubit(repository: repository);
    _cubit.getDetail(widget.detail.species?.url ?? "");

    for (int i = 0; i < (widget.detail.types?.length ?? 0); i++) {
      Types? dataTypes = widget.detail.types?[i];
      types.add(dataTypes?.type?.name ?? "");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${widget.detail.id}.png";

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocProvider(
          create: (context) => _cubit,
          child: BlocConsumer<DetailCubit, DetailState>(
            listener: (context, state) {
              if (state is DetailSuccess) {
                colordata = BackgroundSpecies.values
                        .firstWhereOrNull((e) =>
                            e.name == (_cubit.species?.color?.name ?? ""))
                        ?.color ??
                    AppColors.primaryColor;
              }
            },
            builder: (context, state) {
              return StackLoadingView(
                visibleLoading: state is DetailLoading,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: colordata.withOpacity(0.6),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        top: 50,
                        right: 0,
                        child: Image.asset(
                          AppImages.pokeball,
                          width: 300.h,
                          height: 300.h,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              top: 50.h, right: 16.h, left: 16.h, bottom: 16.h),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.h),
                              topRight: Radius.circular(30.h),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TabBar(
                                labelColor: Colors.black,
                                indicatorColor: Colors.black,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: AppColors.primaryColor),
                                unselectedLabelStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.sp,
                                    color: AppColors.primaryColor),
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(text: "About"),
                                  Tab(text: "Stats"),
                                ],
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                padding: EdgeInsets.only(top: 10.h),
                                child: TabBarView(
                                  children: [
                                    _about(widget.detail),
                                    _stat(widget.detail),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.5,
                        child: Container(
                          child: ClipRRect(
                            child: Image.network(
                              image,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                              height: 250,
                              width: 250,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black38,
                              ),
                              child: IconButton(
                                onPressed: () => NavigationUtils.pop(context),
                                constraints: const BoxConstraints(),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              (widget.detail.name ?? "").toTitleCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .title3
                                  .copyWith(
                                      color: Colors.white, fontSize: 38.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 1,
                              runSpacing: 10,
                              children: types
                                  .asMap()
                                  .entries
                                  .map((e) => SmallMenuItem(
                                        text: e.value.toTitleCase(),
                                        color: colordata,
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _about(PokemonDetail data) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _rowData(
                title: "Abilities",
                data:
                    "${data.abilities!.asMap().entries.map((e) => (e.value.ability?.name ?? "").toTitleCase()).toList().join(', ')}"),
            _rowData(title: "Species", data: "Seed"),
            _rowData(title: "Height", data: "${data.height ?? 0} cm"),
            _rowData(title: "Weight", data: "${data.weight ?? 0} kg"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Breeding",
                style: Theme.of(context).textTheme.title2,
              ),
            ),
            _rowData(
                title: "Egg Groups",
                data:
                    "${_cubit.species?.eggGroups?.asMap().entries.map((e) => (e.value.name ?? "").toTitleCase()).toList().join(", ")}"),
            _rowData(
                title: "Habitat",
                data: "${_cubit.species?.habitat?.name ?? "-"}".toTitleCase()),
          ],
        ),
      ),
    );
  }

  Widget _stat(PokemonDetail data) {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            Stats? stat = data.stats?[index];
            return Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text(
                    "${stat?.stat?.name ?? "-"}".toTitleCase(),
                    style: Theme.of(context).textTheme.title2.copyWith(
                        color: AppColors.darkGray,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Text(
                    "${stat?.baseStat ?? 0}",
                    style: Theme.of(context).textTheme.subHeading1.copyWith(
                          color: AppColors.darkGray,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.grey,
                          trackHeight: 8,
                          thumbShape: SliderComponentShape.noThumb,
                          overlayShape: SliderComponentShape.noThumb),
                      child: Slider(
                          min: 0,
                          max: 100,
                          value: (stat?.baseStat ?? 0).toDouble(),
                          onChanged: (value) async {},
                          activeColor: colordata,
                          inactiveColor: Colors.grey.shade400,
                          thumbColor: Colors.transparent),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, __) => SizedBox(
                height: 10.h,
              ),
          itemCount: (data.stats?.length ?? 0)),
    );
  }

  Widget _rowData({required String title, String? data}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 100.w,
              child: Text(
                title,
                style: Theme.of(context).textTheme.title2.copyWith(
                    color: AppColors.darkGray, fontWeight: FontWeight.normal),
              )),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: Text(
              data ?? "-",
              style: Theme.of(context)
                  .textTheme
                  .title2
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
