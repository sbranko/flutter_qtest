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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:qtest/models/comment/comment.dart';
import 'package:qtest/screens/home/home_controller.dart';
import 'package:qtest/screens/home/list_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _pageSize = 20;
  final homeController = Get.find<HomeController>();

  final PagingController<int, Comment> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 5);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
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
          title: const Text('Characters'),
        ),
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            _pagingController.refresh,
          ),
          child: PagedListView<int, Comment>(
            // physics: BouncingScrollPhysics(),
            pagingController: _pagingController,

            builderDelegate: PagedChildBuilderDelegate<Comment>(
                animateTransitions: false, itemBuilder: (context, item, index) => CharacterListItem(character: item)),
          ),
        ),
      );

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
