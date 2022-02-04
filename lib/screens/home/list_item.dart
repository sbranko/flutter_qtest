import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtest/constants/colors.dart';

import '../../models/comment/comment.dart';

/// List item representing a single Character with its photo and name.
class CommentListItem extends StatelessWidget {
  const CommentListItem({
    required this.character,
    required this.index,
    Key? key,
  }) : super(key: key);

  final Comment character;
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
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('PostId',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Email',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Body',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(
                  Text(character.id.toString()),
                  onTap: () => Get.defaultDialog(
                    title: 'Id',
                    middleText: character.id.toString(),
                    backgroundColor: QColors.green,
                    titleStyle: TextStyle(color: Colors.white),
                    middleTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      character.postId.toString(),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'PostId',
                    middleText: character.postId.toString(),
                    backgroundColor: QColors.green,
                    titleStyle: TextStyle(color: Colors.white),
                    middleTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: Get.width / 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(character.email.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'Email',
                    middleText: character.email.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: TextStyle(color: Colors.white),
                    middleTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: Get.width / 2,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(character.body.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                  onTap: () => Get.defaultDialog(
                    title: 'Body',
                    middleText: character.body.toString(),
                    backgroundColor: Colors.indigoAccent,
                    titleStyle: TextStyle(color: Colors.white),
                    middleTextStyle: TextStyle(color: Colors.white),
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
              label: Expanded(
            child: Text('Id',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Expanded(
                  child: Text('PostId',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)))),
          DataColumn(
              label: Expanded(
            child: Text('Email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Expanded(
            child: Text('Body',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text(character.id.toString())),
            DataCell(Center(child: Text(character.postId.toString()))),
            DataCell(SizedBox(
                width: Get.width / 4,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(character.email.toString(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                ))),
            DataCell(SizedBox(
                width: Get.width / 2,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(character.body.toString()))))),
          ]),
        ],
      );
    }
    // return Table(
    //   border: TableBorder.all(),
    //
    //   defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
    //
    //   defaultColumnWidth: IntrinsicColumnWidth(),
    //
    //   columnWidths: const <int, TableColumnWidth>{
    //     0: FixedColumnWidth(48),
    //     1: FixedColumnWidth(48),
    //     2: FlexColumnWidth(),
    //     3: FlexColumnWidth(),
    //   },
    //
    //   // textDirection: TextDirection.rtl,
    //
    //   textBaseline: TextBaseline
    //       .alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]
    //   children: [
    //     TableRow(children: [
    //       TableCell(
    //         verticalAlignment: TableCellVerticalAlignment.middle,
    //         child: InkWell(
    //           onTap: () => showAlertDialog(context),
    //           child: SizedBox(
    //             child: Text(
    //               character.id.toString(),
    //               style: TextStyle(fontSize: 12.0),
    //             ),
    //           ),
    //         ),
    //       ),
    //       TableCell(
    //         verticalAlignment: TableCellVerticalAlignment.middle,
    //         child: Padding(
    //           padding: const EdgeInsets.all(5),
    //           child: Text(
    //             character.postId.toString(),
    //             style: TextStyle(fontSize: 12.0),
    //           ),
    //         ),
    //       ),
    //       TableCell(
    //         verticalAlignment: TableCellVerticalAlignment.middle,
    //         child: Padding(
    //           padding: const EdgeInsets.all(5),
    //           child: Text(
    //             character.email.toString(),
    //             style: TextStyle(fontSize: 12.0),
    //           ),
    //         ),
    //       ),
    //       TableCell(
    //         verticalAlignment: TableCellVerticalAlignment.middle,
    //         child: Padding(
    //           padding: const EdgeInsets.all(5),
    //           child: Text(character.body.toString(),
    //               style: TextStyle(fontSize: 12.0)),
    //         ),
    //       ),
    //       // Column(children: [
    //       //   Text(character.id.toString(), style: TextStyle(fontSize: 12.0))
    //       // ]),
    //       // Column(children: [
    //       //   Text(character.postId.toString(), style: TextStyle(fontSize: 12.0))
    //       // ]),
    //       // Column(children: [
    //       //   Padding(
    //       //       padding: const EdgeInsets.all(5),
    //       //       child: Text(character.email.toString(),
    //       //           style: TextStyle(fontSize: 12.0)))
    //       // ]),
    //     ]),
    //   ],
    // );
    // return Column(
    //     children: [
    //       Text('pickica'),
    //       Text(character.id.toString()),
    //       Text(character.postId.toString()),
    //       Text(character.email.toString()),
    //       SizedBox(child: Text(character.body.toString())),
    //     ],
    //   );
  }

  void showAlertDialog(BuildContext context) {
    // set up the button
    final Widget okButton = TextButton(
      child: const Text('OK'),
      onPressed: () {},
    );

    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      title: const Text('My title'),
      content: const Text('This is my message.'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) => alert,
    );
  }
}
