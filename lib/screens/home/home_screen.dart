// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
//
// import '../../constants/colors.dart';
// import '../../responsive.dart';
// import 'home_controller.dart';
// import 'widgets/home_cars_widget.dart';
//
// class HomeScreen extends StatelessWidget {
//   static const routeName = '/home_screen';
//   final homeController = Get.find<HomeController>();
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: SafeArea(
//           child: Responsive(
//             mobile: homeController.obx(
//               (cars) => HomeCarsWidget(cars: cars ?? []),
//               onEmpty: Center(
//                 child: ElevatedButton.icon(
//                   onPressed: () => homeController.getComments(0, 20),
//                   icon: const Icon(Icons.drive_eta),
//                   label: const Text('Fetch cars'),
//                 ),
//               ),
//               onLoading: SpinKitWave(
//                 color: QColors.white,
//                 size: 32.r,
//               ),
//               onError: (error) => Text('Error: $error'),
//             ),
//           ),
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/comment/comment.dart';
import '../../services/network_manager.dart';
import 'home_controller.dart';
import 'list_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _pageSize = 20;
  final homeController = Get.find<HomeController>();

  final PagingController<int, Comment> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 10);
  // create an instance
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    if (_networkManager.connectionType == 0) {
      _pagingController.removePageRequestListener(_fetchPage);
    }
    ;
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await homeController.getComments(pageKey, _pageSize);
      final newItems = homeController.comments;
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
        ),
        resizeToAvoidBottomInset: false,
        body: GetBuilder<GetXNetworkManager>(
            builder: (builder) => _networkManager.connectionType != 0
                ? RefreshIndicator(
                    onRefresh: () => Future.sync(
                      _pagingController.refresh,
                    ),
                    child: PagedListView<int, Comment>(
                      // physics: BouncingScrollPhysics(),
                      pagingController: _pagingController,

                      builderDelegate: PagedChildBuilderDelegate<Comment>(
                          itemBuilder: (context, item, index) =>
                              CommentListItem(
                                character: item,
                                index: index,
                              )),
                    ),
                  )
                : Text('No Internet')),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
