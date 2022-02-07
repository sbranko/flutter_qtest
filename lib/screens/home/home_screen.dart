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

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _pageSize = 20;
  final homeController = Get.find<HomeController>();
  final networkController = Get.put(GetXNetworkManager());

  final PagingController<int, Comment> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  // create an instance
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    if (_networkManager.connectionType == 0) {
      _pagingController.removePageRequestListener(_fetchPage);
    }
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
        body: networkController.obx((_) => _networkManager.connectionType != 0
            ? RefreshIndicator(
                onRefresh: () => Future.sync(
                  _pagingController.refresh,
                ),
                child: PagedListView<int, Comment>(
                  physics: const BouncingScrollPhysics(),
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Comment>(
                      itemBuilder: (context, comment, index) {
                    if (index != 0) {
                      return SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: 1,
                          dataRowHeight: 80,
                          dividerThickness: 2,
                          headingRowHeight: 0,
                          columns: const [
                            DataColumn(
                                label: Expanded(
                              child: Text('Id',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text('PostId',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            )),
                            DataColumn(
                                label: Expanded(
                                    child: Text('Name',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)))),
                            DataColumn(
                                label: Expanded(
                                    child: Text('Email',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)))),
                            DataColumn(
                                label: Expanded(
                                    child: Text('Body',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)))),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                Text(comment.id.toString()),
                                onTap: () =>
                                    showDialog('Id', comment.id.toString()),
                              ),
                              DataCell(
                                Center(
                                  child: Text(
                                    comment.postId.toString(),
                                  ),
                                ),
                                onTap: () => showDialog(
                                    'PostId', comment.postId.toString()),
                              ),
                              DataCell(
                                SizedBox(
                                  width: Get.width / 8,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(comment.name.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                ),
                                onTap: () =>
                                    showDialog('Name', comment.name.toString()),
                              ),
                              DataCell(
                                SizedBox(
                                  width: Get.width / 8,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(comment.email.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                ),
                                onTap: () => showDialog(
                                    'Email', comment.email.toString()),
                              ),
                              DataCell(
                                SizedBox(
                                  width: Get.width / 2,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(comment.body.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                ),
                                onTap: () =>
                                    showDialog('Body', comment.body.toString()),
                              ),
                            ]),
                          ],
                        ),
                      );
                    } else {
                      return DataTable(
                        columnSpacing: 1,
                        dataRowHeight: 80,
                        dividerThickness: 2,
                        columns: const [
                          DataColumn(
                              label: Text('Id',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('PostId',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Name',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Email',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Body',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(
                              Text(comment.id.toString()),
                              onTap: () =>
                                  showDialog('Id', comment.id.toString()),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  comment.postId.toString(),
                                ),
                              ),
                              onTap: () => showDialog(
                                  'PostId', comment.postId.toString()),
                            ),
                            DataCell(
                              SizedBox(
                                width: Get.width / 8,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(comment.name.toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ),
                              onTap: () =>
                                  showDialog('Name', comment.name.toString()),
                            ),
                            DataCell(
                              SizedBox(
                                width: Get.width / 8,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(comment.email.toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ),
                              onTap: () =>
                                  showDialog('Name', comment.name.toString()),
                            ),
                            DataCell(
                              SizedBox(
                                width: Get.width / 2,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(comment.body.toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ),
                              onTap: () =>
                                  showDialog('Body', comment.body.toString()),
                            ),
                          ]),
                        ],
                      );
                    }
                    // return CommentListItem(
                    //     comment: item,
                    //     index: index,
                    //   );
                  }),
                ),
              )
            // TODO: implement local database to work offline
            : const Center(
                child: Text(
                  'No Internet',
                  style: TextStyle(fontSize: 30),
                ),
              )),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void showDialog(String title, String text) {
    Get.defaultDialog(
      title: title,
      middleText: text,
      backgroundColor: Colors.indigoAccent,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
    );
  }
}
