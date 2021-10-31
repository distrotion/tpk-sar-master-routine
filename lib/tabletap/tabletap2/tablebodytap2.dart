import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';

import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/tablestruc2.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComBtnImage.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComYNPopup.dart';
import 'package:pick_edit_datatable/widget/Easydropdown.dart';

import 'modelintable.dart';

int ListTable2Status_MR = 0;

class DataListTable2 extends StatefulWidget {
  const DataListTable2({Key? key, required this.datainput}) : super(key: key);
  final List<MainStrucTableTap2_MR> datainput;
  @override
  _DataListTable2State createState() => _DataListTable2State();
}

class _DataListTable2State extends State<DataListTable2> {
  int nCurrentSortIndex_MR = 0; //index from Header DataColumn
  bool isSortAscending_MR = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap2_MR> Listdata_Clone = widget.datainput;

    double nDataColumnWidth = 75;
    double nDataColumnWidthIcon = 100;
    double nDataWidthIcon = 50;
    double nMarginToMakeIconSmaller = 8;

    void tapSort(int nIndex, int columnIndex, bool ascending) {
      if (ascending) {
        print(nIndex);
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item1.field01.compareTo(item2.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item1.field02.compareTo(item2.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item1.field03.compareTo(item2.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item1.field04.compareTo(item2.field04));
            break;
          case 5:
            Listdata_Clone.sort(
                (item1, item2) => item1.field05.compareTo(item2.field05));
            break;
          case 6:
            Listdata_Clone.sort(
                (item1, item2) => item1.field06.compareTo(item2.field06));
            break;
          case 7:
            Listdata_Clone.sort(
                (item1, item2) => item1.field07.compareTo(item2.field07));
            break;
          case 8:
            Listdata_Clone.sort(
                (item1, item2) => item1.field08.compareTo(item2.field08));
            break;
          case 9:
            Listdata_Clone.sort(
                (item1, item2) => item1.field09.compareTo(item2.field09));
            break;
          case 10:
            Listdata_Clone.sort(
                (item1, item2) => item1.field10.compareTo(item2.field10));
            break;
          case 11:
            Listdata_Clone.sort(
                (item1, item2) => item1.field11.compareTo(item2.field11));
            break;
          case 12:
            Listdata_Clone.sort(
                (item1, item2) => item1.field12.compareTo(item2.field12));
            break;
          case 13:
            Listdata_Clone.sort(
                (item1, item2) => item1.field13.compareTo(item2.field13));
            break;
          case 14:
            Listdata_Clone.sort(
                (item1, item2) => item1.field14.compareTo(item2.field14));
            break;
          case 15:
            Listdata_Clone.sort(
                (item1, item2) => item1.field15.compareTo(item2.field15));
            break;
          case 16:
            Listdata_Clone.sort(
                (item1, item2) => item1.field16.compareTo(item2.field16));
            break;
          case 17:
            Listdata_Clone.sort(
                (item1, item2) => item1.field17.compareTo(item2.field17));
            break;
          case 18:
            Listdata_Clone.sort(
                (item1, item2) => item1.field18.compareTo(item2.field18));
            break;
          case 19:
            Listdata_Clone.sort(
                (item1, item2) => item1.field19.compareTo(item2.field19));
            break;
        }
      } else {
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item2.field01.compareTo(item1.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item2.field02.compareTo(item1.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item2.field03.compareTo(item1.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item2.field04.compareTo(item1.field04));
            break;
          case 5:
            Listdata_Clone.sort(
                (item1, item2) => item2.field05.compareTo(item1.field05));
            break;
          case 6:
            Listdata_Clone.sort(
                (item1, item2) => item2.field06.compareTo(item1.field06));
            break;
          case 7:
            Listdata_Clone.sort(
                (item1, item2) => item2.field07.compareTo(item1.field07));
            break;
          case 8:
            Listdata_Clone.sort(
                (item1, item2) => item2.field08.compareTo(item1.field08));
            break;
          case 9:
            Listdata_Clone.sort(
                (item1, item2) => item2.field09.compareTo(item1.field09));
            break;
          case 10:
            Listdata_Clone.sort(
                (item1, item2) => item2.field10.compareTo(item1.field10));
            break;
          case 11:
            Listdata_Clone.sort(
                (item1, item2) => item2.field11.compareTo(item1.field11));
            break;
          case 12:
            Listdata_Clone.sort(
                (item1, item2) => item2.field12.compareTo(item1.field12));
            break;
          case 13:
            Listdata_Clone.sort(
                (item1, item2) => item2.field13.compareTo(item1.field13));
            break;
          case 14:
            Listdata_Clone.sort(
                (item1, item2) => item2.field14.compareTo(item1.field14));
            break;
          case 15:
            Listdata_Clone.sort(
                (item1, item2) => item2.field15.compareTo(item1.field15));
            break;
          case 16:
            Listdata_Clone.sort(
                (item1, item2) => item2.field16.compareTo(item1.field16));
            break;
          case 17:
            Listdata_Clone.sort(
                (item1, item2) => item2.field17.compareTo(item1.field17));
            break;
          case 18:
            Listdata_Clone.sort(
                (item1, item2) => item2.field18.compareTo(item1.field18));
            break;
          case 19:
            Listdata_Clone.sort(
                (item1, item2) => item2.field19.compareTo(item1.field19));
            break;
        }
      }
      //BlocPatientList.sort();
      setState(() {
        nCurrentSortIndex_MR = columnIndex;
        isSortAscending_MR = ascending;
      });
    }

    //------------------------------------------------------------------------------------------------

    void _tapView(MainStrucTableTap2_MR s) {
      //click all
      // print("123");
      ListTable2Status_MR = 1;
      EditDataTable2_MR = s;
      EditDataTable2buffer_MR = s;
      undercontroltap2_MR = true;
      // Branch_MR = s.field04;
      // Code_MR = s.field05;

      context.read<FetchDataTable2Bloc_MR>().add(DataSequncePage2_MR.select);
      _ConsoleBox(s, context, zeroDropDownData);
    }

    void _CallYNPopup(
        String sTxtHead,
        String sTxtBody,
        String sTxtBtnYes,
        String sTxtBtnNo,
        Function funcYes,
        Function funcNo,
        String sFuncData,
        bool isSwitchYNBtnPos) {
      showDialog<String>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => ComYNPopup(
          sTxtHead: sTxtHead,
          sTxtBody: sTxtBody,
          sTxtBtnYes: sTxtBtnYes,
          sTxtBtnNo: sTxtBtnNo,
          funcYes: funcYes,
          funcNo: funcNo,
          sFuncData: sFuncData,
          isSwitchYNBtnPos: isSwitchYNBtnPos,
        ),
      );
    }

    void _CloseYNPopup() {
      Navigator.pop(context, '');
    }

    // void GoToTele(String s) {
    //   CloseYNPopup();
    //   BlocProvider.of<BlocChangePage>(context).changePage(enumPageList.Tele);
    // }
    void _Edit(MainStrucTableTap2_MR s) {
      _CloseYNPopup();
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();
      context.read<FetchDataTable2Bloc_MR>().add(DataSequncePage2_MR.delete);
    }

    void _tapEdit(MainStrucTableTap2_MR s) {
      // _CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
      //     _Edit, _CloseYNPopup, s, false);
      EditDataTable2_MR = s;
      EditDataTable2buffer_MR = s;
      undercontroltap2_MR = true;
      context.read<FetchDataTable2Bloc_MR>().add(DataSequncePage2_MR.select);
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap2_MR s) {
      DeleteDataTable2buffer_MR.number = s.number;
      DeleteDataTable2buffer_MR.field01 = s.field01;
      DeleteDataTable2buffer_MR.field02 = s.field02;
      DeleteDataTable2buffer_MR.field03 = s.field03;
      DeleteDataTable2buffer_MR.field04 = s.field04;
      DeleteDataTable2buffer_MR.field05 = s.field05;
      DeleteDataTable2buffer_MR.field06 = s.field06;
      _CallYNPopup(
          'Delete ${s.number}',
          'Are you sure you want to delete ${s.number}?',
          'Delete',
          'Cancel',
          _Delete,
          _CloseYNPopup,
          s.number,
          true);
    }

    //all cells data for this page.
    List<DataRow> RowDataInput = _getDataRowList(
      Listdata_Clone,
      nDataColumnWidth,
      nDataColumnWidthIcon,
      nDataWidthIcon,
      nMarginToMakeIconSmaller,
      _tapView,
      _tapEdit,
      _tapDelete,
      TableTap2nPage_MR, //data
    );

    //fixed error when sort the hide column on mobile
    // nCurrentSortIndex = 0;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                // color: Colors.red,
                child: ComBtnBlackBorder(
                    sLabel: "New",
                    func: () {
                      ListTable2Status_MR = 0;
                      MainStrucTableTap2_MR Zerodata = MainStrucTableTap2_MR(
                        number: "",
                        field01: "",
                        field02: "",
                        field03: "",
                        field04: "",
                        field05: "",
                        field06: "",
                        field07: "",
                        field08: "",
                        field09: "",
                        field10: "",
                        field11: "",
                        field12: "",
                        field13: "",
                        field14: "",
                        field15: "",
                        field16: "",
                        field17: "",
                        field18: "",
                        field19: "",
                        field20: "",
                      );
                      // CustFull = '';
                      // FrequencyRequest = '';
                      // Incharge = '';
                      // SubLeader = '';
                      // GL = '';
                      // JP = '';
                      // DMG = '';
                      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      _ConsoleBox(Zerodata, context, zeroDropDownData);
                    },
                    nWidth: 134),
              ),
              // SizedBox(
              //   width: 100,
              // ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: nCurrentSortIndex_MR,
              sortAscending: isSortAscending_MR,
              showCheckboxColumn:
                  false, //Hide checkbox that come from tap row 'onselectchanged'
              columnSpacing: 10,
              dataRowHeight: 56,
              // Header Column -----------------------------------------------------------
              columns: [
                _getDataColumn(
                    1, "No", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "CustId", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(
                    3, "CustFull", 'Sort Field 3', nDataColumnWidth, tapSort),
                _getDataColumn(
                    4, "CustShort", 'Sort Field 4', nDataColumnWidth, tapSort),
                _getDataColumn(5, "FrequencyRequest", 'Sort Field 5',
                    nDataColumnWidth, tapSort),
                _getDataColumn(6, "SampleGroup", 'Sort Field 6',
                    nDataColumnWidth, tapSort),
                _getDataColumn(
                    7, "SampleType", 'Sort Field 7', nDataColumnWidth, tapSort),
                _getDataColumn(
                    8, "SampleTank", 'Sort Field 8', nDataColumnWidth, tapSort),
                _getDataColumn(
                    9, "SampleName", 'Sort Field 9', nDataColumnWidth, tapSort),
                _getDataColumn(10, "Frequency", 'Sort Field 10',
                    nDataColumnWidth, tapSort),
                _getDataColumn(
                    11, "ItemNo", 'Sort Field 11', nDataColumnWidth, tapSort),
                _getDataColumn(12, "Instrument", 'Sort Field 12',
                    nDataColumnWidth, tapSort),
                _getDataColumn(
                    13, "ItemName", 'Sort Field 13', nDataColumnWidth, tapSort),
                _getDataColumn(
                    14, "Position", 'Sort Field 14', nDataColumnWidth, tapSort),
                _getDataColumn(
                    15, "Mag", 'Sort Field 15', nDataColumnWidth, tapSort),
                _getDataColumn(
                    16, "Temp", 'Sort Field 16', nDataColumnWidth, tapSort),
                _getDataColumn(17, "StdFactor", 'Sort Field 17',
                    nDataColumnWidth, tapSort),
                _getDataColumn(
                    18, "StdMax", 'Sort Field 18', nDataColumnWidth, tapSort),
                _getDataColumn(
                    19, "StdMin", 'Sort Field 19', nDataColumnWidth, tapSort),
                _getBlankDataColumn(nDataColumnWidthIcon),
              ],
              // Cell Row  -----------------------------------------------------------
              rows: [
                for (DataRow dataRow in RowDataInput) dataRow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Header Column --------------------------------------------------------------

DataColumn _getDataColumn(int nIndex, String sLabel, String sTooltip,
    double nDataColumnWidth, Function func) {
  return DataColumn(
    label: Container(
      width: nDataColumnWidth,
      child: Text(sLabel),
      //color: Colors.red,
    ),
    numeric: false,
    tooltip: sTooltip,
    onSort: (int columnIndex, bool ascending) {
      func(nIndex, columnIndex, ascending);
    },
  );
}

// blank for call icon
DataColumn _getBlankDataColumn(double nDataColumnWidthIcon) {
  return DataColumn(
    label: Expanded(
      child: Container(
          // color: Colors.red,
          ),
    ),
  );
}

// Cell Row -------------------------------------------------------------------
List<DataRow> _getDataRowList(
  List<MainStrucTableTap2_MR> Listdata_Clone,
  double nDataColumnWidth,
  double nDataColumnWidthIcon,
  double nDataWidthIcon,
  double nMarginToMakeIconSmaller,
  // enumScreenResponsiveList screenResponsive,
  Function funcView,
  Function funcEdit,
  Function funcDelete,
  int currentPage,
) {
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable2_MR;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable2_MR);
      n++) {
    if (n < Listdata_Clone.length) {
      dataRowList.add(_getDataRow(
        Listdata_Clone[n].number,
        Listdata_Clone[n].field01,
        Listdata_Clone[n].field02,
        Listdata_Clone[n].field03,
        Listdata_Clone[n].field04,
        Listdata_Clone[n].field05,
        Listdata_Clone[n].field06,
        Listdata_Clone[n].field07,
        Listdata_Clone[n].field08,
        Listdata_Clone[n].field09,
        Listdata_Clone[n].field10,
        Listdata_Clone[n].field11,
        Listdata_Clone[n].field12,
        Listdata_Clone[n].field13,
        Listdata_Clone[n].field14,
        Listdata_Clone[n].field15,
        Listdata_Clone[n].field16,
        Listdata_Clone[n].field17,
        Listdata_Clone[n].field18,
        Listdata_Clone[n].field19,
        nDataColumnWidth,
        nDataColumnWidthIcon,
        nDataWidthIcon,
        nMarginToMakeIconSmaller,
        // screenResponsive,
        funcView,
        funcEdit,
        funcDelete,
        Listdata_Clone[n],
      ));
    }
  }
  return dataRowList;
}

DataRow _getDataRow(
    String number,
    String field01,
    String field02,
    String field03,
    String field04,
    String field05,
    String field06,
    String field07,
    String field08,
    String field09,
    String field10,
    String field11,
    String field12,
    String field13,
    String field14,
    String field15,
    String field16,
    String field17,
    String field18,
    String field19,
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete,
    MainStrucTableTap2_MR getData) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        _getDataCell_Label(number, nDataColumnWidth),
        _getDataCell_Label(field01, nDataColumnWidth),
        _getDataCell_Label(field02, nDataColumnWidth),
        _getDataCell_Label(field03, nDataColumnWidth),
        _getDataCell_Label(field04, nDataColumnWidth),
        _getDataCell_Label(field05, nDataColumnWidth),
        _getDataCell_Label(field06, nDataColumnWidth),
        _getDataCell_Label(field07, nDataColumnWidth),
        _getDataCell_Label(field08, nDataColumnWidth),
        _getDataCell_Label(field09, nDataColumnWidth),
        _getDataCell_Label(field10, nDataColumnWidth),
        _getDataCell_Label(field11, nDataColumnWidth),
        _getDataCell_Label(field12, nDataColumnWidth),
        _getDataCell_Label(field13, nDataColumnWidth),
        _getDataCell_Label(field14, nDataColumnWidth),
        _getDataCell_Label(field15, nDataColumnWidth),
        _getDataCell_Label(field16, nDataColumnWidth),
        _getDataCell_Label(field17, nDataColumnWidth),
        _getDataCell_Label(field18, nDataColumnWidth),
        // _getDataCell_Label(field19, nDataColumnWidth),
        _getDataCell_Icon(number, funcEdit, funcDelete, nDataColumnWidthIcon,
            nDataWidthIcon, nMarginToMakeIconSmaller, getData),
      ],
      onSelectChanged: (value) {
        // funcView(number);
        // print(value);
        // print(number);
        funcView(getData);
      });
}

DataCell _getDataCell_ImgName(
    String sName, double nDataColumnWidth, int nGender) {
  return DataCell(InkWell(
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              // ComProfileImg(
              //   profileImg: enumProfileImgList.Patient_Default,
              //   nGender: nGender,
              //   nWidthHeight: 40,
              // ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(sName,
                      overflow: TextOverflow.fade, softWrap: false)),
            ],
          ))));
}

// each cell inside 1 row
DataCell _getDataCell_Label(String sLabel, double nDataColumnWidth) {
  return DataCell(InkWell(
      child: Container(
    // color: Colors.red,
    width: nDataColumnWidth,
    child: Text(sLabel, overflow: TextOverflow.fade, softWrap: false),
  )));
}

DataCell _getDataCell_Icon(
    String sId,
    Function funcEdit,
    Function funcDelete,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    MainStrucTableTap2_MR GetData) {
  void _tapEdit() {
    funcEdit(GetData);
  }

  void _tapDelete() {
    funcDelete(GetData);
  }

  return DataCell(
    Container(
      width: nDataColumnWidthIcon,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   width: nDataWidthIcon,
          //   height: 100,
          //   // color: Colors.blue,
          //   child: ComBtnImage(
          //     sImgPath: Icons.edit,
          //     func: _tapEdit,
          //     nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
          //   ),
          // ),
          Container(
            width: nDataWidthIcon,
            height: 100,
            child: ComBtnImage(
              sImgPath: Icons.delete,
              func: _tapDelete,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
        ],
      ),
    ),
  );
}

void _ConsoleBox(MainStrucTableTap2_MR input, BuildContext contextinput,
    DropDownData dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      // DropDownData _datadropdown = dropdowndata;
      // EditDataTable2_MR.field04 = Branch_MR;
      // EditDataTable2_MR.field05 = Code_MR;
      return Dialog(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
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
            width: 1350,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 400,
                              height: 20,
                              // color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Id")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.number,
                              returnfunc: () {},
                              isEnabled: false,
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("CustId")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                                isContr: undercontroltap2_MR,
                                fnContr: (input) {
                                  undercontroltap2_MR = input;
                                },
                                sValue: EditDataTable2_MR.field01,
                                returnfunc: (String s) {
                                  EditDataTable2buffer_MR.field01 = s;
                                }),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("CustFull")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field02,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field02 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("CustShort")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field03,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field03 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("FrequencyRequest")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field04,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field04 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("SampleGroup")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field05,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field05 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("SampleType")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field06,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field06 = s;
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 400,
                              height: 20,
                              // color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("SampleTank")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field07,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field07 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("SampleName")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                                isContr: undercontroltap2_MR,
                                fnContr: (input) {
                                  undercontroltap2_MR = input;
                                },
                                sValue: EditDataTable2_MR.field08,
                                returnfunc: (String s) {
                                  EditDataTable2buffer_MR.field08 = s;
                                }),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Frequency")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field09,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field09 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("ItemNo")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field10,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field10 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Instrument")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field11,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field11 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("ItemName")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field12,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field12 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Position")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field13,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field13 = s;
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 400,
                              height: 20,
                              // color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Mag")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field14,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field14 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Temp")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                                isContr: undercontroltap2_MR,
                                fnContr: (input) {
                                  undercontroltap2_MR = input;
                                },
                                sValue: EditDataTable2_MR.field15,
                                returnfunc: (String s) {
                                  EditDataTable2buffer_MR.field15 = s;
                                }),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("StdFactor")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field16,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field16 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("StdMax")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field17,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field17 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("StdMin")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap2_MR,
                              fnContr: (input) {
                                undercontroltap2_MR = input;
                              },
                              sValue: EditDataTable2_MR.field18,
                              returnfunc: (String s) {
                                EditDataTable2buffer_MR.field18 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            // child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child: Text("CODE")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            // child: ComInputText(
                            //   isContr: undercontroltap2_MR,
                            //   fnContr: (input) {
                            //     undercontroltap2_MR = input;
                            //   },
                            //   sValue: EditDataTable2_MR.field05,
                            //   returnfunc: (String s) {
                            //     EditDataTable2buffer_MR.field05 = s;
                            //   },
                            // ),
                          ),
                          SizedBox(
                            width: 400,
                            height: 15,
                            // child:
                            //     Align(alignment: Alignment.centerLeft, child: Text("test")),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            // child: ComInputText(
                            //   isContr: undercontroltap2_MR,
                            //   fnContr: (input) {
                            //     undercontroltap2_MR = input;
                            //   },
                            //   sValue: EditDataTable2_MR.field06,
                            //   returnfunc: (String s) {
                            //     EditDataTable2buffer_MR.field06 = s;
                            //   },
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 460,
                      height: 40,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ComBtnBlack(
                              sLabel: "Update",
                              func: () {
                                // print(EditDataTable2buffer.field04);
                                // EditDataTable2buffer = EditDataTable2;
                                contextinput.read<FetchDataTable2Bloc_MR>().add(
                                    DataSequncePage2_MR
                                        .update); //<------------------
                                Navigator.pop(contextinput);
                              },
                              nWidth: 80),
                          SizedBox(
                            width: 10,
                          ),
                          ComBtnBlackBorder(
                              sLabel: "Clear",
                              cBg: Colors.red,
                              func: () {
                                undercontroltap2_MR = true;
                                EditDataTable2_MR = MainStrucTableTap2_MR(
                                  number: "",
                                  field01: "",
                                  field02: "",
                                  field03: "",
                                  field04: "",
                                  field05: "",
                                  field06: "",
                                  field07: "",
                                  field08: "",
                                  field09: "",
                                  field10: "",
                                  field11: "",
                                  field12: "",
                                  field13: "",
                                  field14: "",
                                  field15: "",
                                  field16: "",
                                  field17: "",
                                  field18: "",
                                  field19: "",
                                  field20: "",
                                );

                                BlocProvider.of<BlocPageRebuild>(contextinput)
                                    .rebuildPage();
                              },
                              nWidth: 80),
                          SizedBox(
                            width: 10,
                          ),
                          ComBtnBlackBorder(
                              sLabel: "Insert",
                              func: () {
                                contextinput
                                    .read<FetchDataTable2Bloc_MR>()
                                    .add(DataSequncePage2_MR.insert);
                                Navigator.pop(contextinput);
                              },
                              nWidth: 80),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class TxtStylePOP extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily = 'Mitr';
  final FontStyle fontStyle = FontStyle.normal;

  const TxtStylePOP(
      {this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal})
      : super();
}

void _onLoading(BuildContext contextin, void newValue) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      newValue;
      return Container(
        // color: Colors.red,

        child: Dialog(
          child: Container(
              height: 75,
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 30),
                  new CircularProgressIndicator(),
                  SizedBox(width: 20),
                  new Text("Loading"),
                ],
              )),
        ),
      );
    },
  );

  Timer(Duration(seconds: 1), () {
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    Navigator.pop(contextin);
  });
}
