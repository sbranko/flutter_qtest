import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/comment/comment.dart';

/// List item representing a single Character with its photo and name.
class CommentListItem extends StatelessWidget {
  const CommentListItem({
    required this.comment,
    required this.index,
    Key? key,
  }) : super(key: key);

  final Comment comment;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index != 0) {
      return Row(// a dirty trick to make the DataTable fit width
          children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 1,
            dataRowHeight: 80,
            dividerThickness: 2,
            headingRowHeight: 0,
            columns: const [
              DataColumn(
                  label: Text('Id',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('PostId',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Email',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Body',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(
                  Text(comment.id.toString()),
                  onTap: () => Get.defaultDialog(
                    title: 'Id',
                    middleText: comment.id.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: const TextStyle(color: Colors.white),
                    middleTextStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      comment.postId.toString(),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'PostId',
                    middleText: comment.postId.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: const TextStyle(color: Colors.white),
                    middleTextStyle: const TextStyle(color: Colors.white),
                  ),
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
                                fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'Name',
                    middleText: comment.name.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: const TextStyle(color: Colors.white),
                    middleTextStyle: const TextStyle(color: Colors.white),
                  ),
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
                                fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'Email',
                    middleText: comment.email.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: const TextStyle(color: Colors.white),
                    middleTextStyle: const TextStyle(color: Colors.white),
                  ),
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
                                fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'Body',
                    middleText: comment.body.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: const TextStyle(color: Colors.white),
                    middleTextStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            ],
          ),
        ))
      ]);
    } else {
      return DataTable(
        columnSpacing: 1,
        dataRowHeight: 80,
        dividerThickness: 2,
        columns: const [
          DataColumn(
              label: Text('Id',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('PostId',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Name',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Email',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Body',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(
              Text(comment.id.toString()),
              onTap: () => Get.defaultDialog(
                title: 'Id',
                middleText: comment.id.toString(),
                backgroundColor: Colors.indigoAccent,
                titleStyle: const TextStyle(color: Colors.white),
                middleTextStyle: const TextStyle(color: Colors.white),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  comment.postId.toString(),
                ),
              ),
              onTap: () => Get.defaultDialog(
                title: 'PostId',
                middleText: comment.postId.toString(),
                backgroundColor: Colors.indigoAccent,
                titleStyle: const TextStyle(color: Colors.white),
                middleTextStyle: const TextStyle(color: Colors.white),
              ),
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
                            fontSize: 12, fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              onTap: () => Get.defaultDialog(
                title: 'Name',
                middleText: comment.name.toString(),
                backgroundColor: Colors.indigoAccent,
                titleStyle: const TextStyle(color: Colors.white),
                middleTextStyle: const TextStyle(color: Colors.white),
              ),
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
                            fontSize: 12, fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              onTap: () => Get.defaultDialog(
                title: 'Email',
                middleText: comment.email.toString(),
                backgroundColor: Colors.indigoAccent,
                titleStyle: const TextStyle(color: Colors.white),
                middleTextStyle: const TextStyle(color: Colors.white),
              ),
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
                            fontSize: 12, fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              onTap: () => Get.defaultDialog(
                title: 'Body',
                middleText: comment.body.toString(),
                backgroundColor: Colors.indigoAccent,
                titleStyle: const TextStyle(color: Colors.white),
                middleTextStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ],
      );
    }
  }
}
