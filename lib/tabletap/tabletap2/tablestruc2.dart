import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/tablebodytap2.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';
import 'package:pick_edit_datatable/widget/Easydropdown.dart';

import 'modelintable.dart';

class TableTap2Struc extends StatelessWidget {
  const TableTap2Struc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableStrucBuffer();
  }
}

class _TableStrucBuffer extends StatelessWidget {
  const _TableStrucBuffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FetchDataTable2Bloc_MR(),
      child: BlocBuilder<FetchDataTable2Bloc_MR, List<MainStrucTableTap2_MR>>(
        builder: (_, State) {
          return _TableStrucBuffer2(
            State: State,
          );
        },
      ),
    );
  }
}

class _TableStrucBuffer2 extends StatelessWidget {
  _TableStrucBuffer2({Key? key, required this.State}) : super(key: key);
  final List<MainStrucTableTap2_MR> State;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Dropdowndata_MR(),
      child: BlocBuilder<Dropdowndata_MR, DropDownData_MR>(
        builder: (_, Statedrop) {
          return _TableStrucBufferCalldrop(
              State: State, datadropdown: Statedrop);
        },
      ),
    );
  }
}

class _TableStrucBufferCalldrop extends StatelessWidget {
  _TableStrucBufferCalldrop(
      {Key? key, required this.State, required this.datadropdown})
      : super(key: key);
  final List<MainStrucTableTap2_MR> State;
  DropDownData_MR datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata_MR(),
      child: BlocBuilder<CallDropdowndata_MR, CallDropDownDataS_MR>(
        builder: (_, State2) {
          return _TableStrucMain2(datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain2 extends StatefulWidget {
  _TableStrucMain2({Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap2_MR>? datainput;
  final DropDownData_MR datadropdown;

  @override
  __TableStrucMain2State createState() => __TableStrucMain2State();
}

class __TableStrucMain2State extends State<_TableStrucMain2> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable2Bloc_MR>().add(DataSequncePage2_MR.select);
    context.read<Dropdowndata_MR>().add(dropdownrequrst_MR.set02);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap2_MR> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap2nPage_MR = n;
      });
    }

    EditDataTable2_MR.field02 = CustFull2_MR;

    EditDataTable2_MR.field06 = SampleGroup2_MR;
    EditDataTable2_MR.field07 = SampleType2_MR;
    EditDataTable2_MR.field08 = SampleTank2_MR;
    EditDataTable2_MR.field09 = SampleName2_MR;
    EditDataTable2_MR.field10 = Frequency2_MR;
    EditDataTable2_MR.field12 = Instrument2_MR;
    EditDataTable2_MR.field13 = ItemName2_MR;
    EditDataTable2_MR.field14 = Position2_MR;
    EditDataTable2_MR.field16 = Temp2_MR;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
          child: Wrap(
        children: [
          Container(
            // color: Colors.red,
            width: 800,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.colorGreyBg,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: CustomTheme.colorShadowBgStrong,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                  ),
                  child: DataListTable2(
                    datainput: _datainput,
                  ),
                ),
                _BottomPageNum(
                  func: tapChangeTablePage,
                  datainput: _datainput,
                )
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(start: 20, end: 20),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: CustomTheme.colorGreyBg,
          //       borderRadius: BorderRadius.all(Radius.circular(24)),
          //       boxShadow: [
          //         BoxShadow(
          //             color: CustomTheme.colorShadowBgStrong,
          //             offset: Offset(0, 0),
          //             blurRadius: 10,
          //             spreadRadius: 0)
          //       ],
          //     ),
          //     width: 400,
          //     height: 420,
          //     child: Padding(
          //       padding: EdgeInsetsDirectional.only(start: 30, end: 30),
          //       child: Column(
          //         // mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Align(
          //             alignment: Alignment.topCenter,
          //             child: Container(
          //               width: 400,
          //               height: 30,
          //               color: Colors.blue,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Container(
          //             width: 400,
          //             height: 40,
          //             // color: Colors.red,
          //             child: ComInputText(
          //               isContr: undercontroltap2,
          //               fnContr: (input) {
          //                 undercontroltap2 = input;
          //               },
          //               sValue: EditDataTable2.number,
          //               returnfunc: () {},
          //               isEnabled: false,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Container(
          //             width: 400,
          //             height: 40,
          //             // color: Colors.red,
          //             child: ComInputText(
          //                 isContr: undercontroltap2,
          //                 fnContr: (input) {
          //                   undercontroltap2 = input;
          //                 },
          //                 sValue: EditDataTable2.field01,
          //                 returnfunc: (String s) {
          //                   EditDataTable2buffer.field01 = s;
          //                 }),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Container(
          //             width: 400,
          //             height: 40,
          //             // color: Colors.red,
          //             child: ComInputText(
          //               isContr: undercontroltap2,
          //               fnContr: (input) {
          //                 undercontroltap2 = input;
          //               },
          //               sValue: EditDataTable2.field02,
          //               returnfunc: (String s) {
          //                 EditDataTable2buffer.field02 = s;
          //               },
          //             ),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Container(
          //             width: 400,
          //             height: 40,
          //             // color: Colors.red,
          //             child: ComInputText(
          //               isContr: undercontroltap2,
          //               fnContr: (input) {
          //                 undercontroltap2 = input;
          //               },
          //               sValue: EditDataTable2.field03,
          //               returnfunc: (String s) {
          //                 EditDataTable2buffer.field03 = s;
          //               },
          //             ),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           EasyDropDown(
          //             width: 400,
          //             height: 40,
          //             value: Branch,
          //             onChangeinside: (newValue) {
          //               Branch = newValue!;
          //               EditDataTable2buffer.field04 = newValue;
          //             },
          //             listdropdown: ['', 'RAYONG', 'BANGPOO', 'GATEWAY'],
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           EasyDropDown(
          //             width: 400,
          //             height: 40,
          //             value: Code,
          //             onChangeinside: (newValue) {
          //               Code = newValue!;
          //               EditDataTable2buffer.field05 = newValue;
          //             },
          //             listdropdown: ['', 'CTS', 'MKT', 'PHO'],
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Container(
          //             width: 400,
          //             height: 40,
          //             // color: Colors.red,
          //             child: ComInputText(
          //               isContr: undercontroltap2,
          //               fnContr: (input) {
          //                 undercontroltap2 = input;
          //               },
          //               sValue: EditDataTable2.field06,
          //               returnfunc: (String s) {
          //                 EditDataTable2buffer.field06 = s;
          //               },
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Align(
          //             alignment: Alignment.bottomCenter,
          //             child: Container(
          //               width: 460,
          //               height: 40,
          //               // color: Colors.blue,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   ComBtnBlack(
          //                       sLabel: "Save",
          //                       func: () {
          //                         // print(EditDataTable2buffer.field04);
          //                         // EditDataTable2buffer = EditDataTable2;
          //                         context.read<FetchDataTable2Bloc>().add(
          //                             DataSequncePage2
          //                                 .update); //<------------------
          //                       },
          //                       nWidth: 80),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   ComBtnBlackBorder(
          //                       sLabel: "Cancle",
          //                       cBg: Colors.red,
          //                       func: () {
          //                         undercontroltap2 = true;
          //                         EditDataTable2 = MainStrucTableTap2(
          //                             number: "",
          //                             field01: "",
          //                             field02: "",
          //                             field03: "",
          //                             field04: "",
          //                             field05: "",
          //                             field06: "",
          //                             field07: "",
          //                             field08: "",
          //                             field09: "",
          //                             field10: "");

          //                         BlocProvider.of<BlocPageRebuild>(context)
          //                             .rebuildPage();
          //                       },
          //                       nWidth: 80),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   ComBtnBlackBorder(
          //                       sLabel: "New",
          //                       func: () {
          //                         context
          //                             .read<FetchDataTable2Bloc>()
          //                             .add(DataSequncePage2.insert);
          //                       },
          //                       nWidth: 80),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}

class _BottomPageNum extends StatelessWidget {
  _BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap2_MR>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap2_MR> _datainput = datainput ?? [];

    //print("build BottomPageNum " + BlocPatientList.state.patientTableData.length.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Pages",
          style: TxtStyle(fontSize: 12),
        ),
        ComPageNumBtnGroup(
          nItemNum: _datainput.length,
          nPageSelects: TableTap2nPage_MR,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable2_MR,
          nTableCellPerEachPage: nTableCellPerEachPageTable2_MR,
        )
      ],
    );
  }
}
