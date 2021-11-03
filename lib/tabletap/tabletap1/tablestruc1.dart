import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap1/datatap1.dart';
import 'modelintable.dart';
import 'tablebodytap1.dart';

class TableTap1Struc extends StatelessWidget {
  const TableTap1Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable1Bloc_MR(),
      child: BlocBuilder<FetchDataTable1Bloc_MR, List<MainStrucTableTap1_MR>>(
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
  final List<MainStrucTableTap1_MR> State;

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
  final List<MainStrucTableTap1_MR> State;
  DropDownData_MR datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata_MR(),
      child: BlocBuilder<CallDropdowndata_MR, CallDropDownDataS_MR>(
        builder: (_, State2) {
          return _TableStrucMain1(datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain1 extends StatefulWidget {
  _TableStrucMain1({Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap1_MR>? datainput;
  DropDownData_MR datadropdown;

  @override
  __TableStrucMain1State createState() => __TableStrucMain1State();
}

class __TableStrucMain1State extends State<_TableStrucMain1> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable1Bloc_MR>().add(DataSequncePage1_MR.select);
    context.read<Dropdowndata_MR>().add(dropdownrequrst_MR.set01);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap1_MR> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap1nPage_MR = n;
      });
    }

    EditDataTable1_MR.field02 = CustFull_MR;
    EditDataTable1_MR.field06 = FrequencyRequest_MR;
    EditDataTable1_MR.field07 = Incharge_MR;
    EditDataTable1_MR.field08 = SubLeader_MR;
    EditDataTable1_MR.field09 = GL_MR;
    EditDataTable1_MR.field10 = JP_MR;
    EditDataTable1_MR.field11 = DMG_MR;

    DropDownData_MR _datadropdown = widget.datadropdown;

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
            height: 420,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.colorGreyBg,
                    // borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: CustomTheme.colorShadowBgStrong,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                  ),
                  child: DataListTable(
                      datainput: _datainput, dropdowndata: _datadropdown),
                ),
                BottomPageNum(
                  func: tapChangeTablePage,
                  datainput: _datainput,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

//------------------------------------------------------------------------------------------------

class BottomPageNum extends StatelessWidget {
  BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap1_MR>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap1_MR> _datainput = datainput ?? [];

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
          nPageSelects: TableTap1nPage_MR,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable1_MR,
          nTableCellPerEachPage: nTableCellPerEachPageTable1_MR,
        )
      ],
    );
  }
}
