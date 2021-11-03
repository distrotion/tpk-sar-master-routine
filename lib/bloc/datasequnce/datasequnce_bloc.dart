import 'dart:async';
import 'dart:convert';

//----------------------------------------------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pick_edit_datatable/bloc/global.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/datatap1/datatap1.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/modelintable.dart';

import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/datatap3/datatap3.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/modelintable.dart';
import 'datasequnce_event.dart';
import 'datatest.dart';
//----------------------------------------------------------------

String server = "http://172.20.30.46:9200/";
// String server = "http://127.0.0.1:9200/";

//------------------------------------------------------- First

class FetchDataTable1Bloc_MR
    extends Bloc<DataSequncePage1_MR, List<MainStrucTableTap1_MR>> {
  FetchDataTable1Bloc_MR() : super([]);

  @override
  Stream<List<MainStrucTableTap1_MR>> mapEventToState(
      DataSequncePage1_MR event) async* {
    if (event == DataSequncePage1_MR.select) {
      yield* selectData_fn_MR(state);
    } else if (event == DataSequncePage1_MR.update) {
      yield* updateData_fn_MR(state);
    } else if (event == DataSequncePage1_MR.delete) {
      yield* deleteData_fn_MR(state);
    } else if (event == DataSequncePage1_MR.insert) {
      yield* InsertData_fn_MR(state);
    }
  }
}

Stream<List<MainStrucTableTap1_MR>> selectData_fn_MR(
    List<MainStrucTableTap1_MR> state) async* {
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response = await http
      .post(Uri.parse(server + "Routine_MasterCustomer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
      field13: "",
      field14: "",
      field15: "",
      field16: "",
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap1_MR>> updateData_fn_MR(
    List<MainStrucTableTap1_MR> state) async* {
  print("UPDATE FUNCTION BLOC");

  var input_init = {
    "Id": EditDataTable1buffer_MR.number,
    "CustId": EditDataTable1buffer_MR.field01,
    "CustFull": EditDataTable1buffer_MR.field02,
    "CustShort": EditDataTable1buffer_MR.field03,
    "Branch": EditDataTable1buffer_MR.field04,
    "Code": EditDataTable1buffer_MR.field05,
    "FrequencyRequest": EditDataTable1buffer_MR.field06,
    "Incharge": EditDataTable1buffer_MR.field07,
    "SubLeader": EditDataTable1buffer_MR.field08,
    "GL": EditDataTable1buffer_MR.field09,
    "JP": EditDataTable1buffer_MR.field10,
    "DMG": EditDataTable1buffer_MR.field11,
  };

  final response_init = await http.post(
      Uri.parse(server + "Routine_MasterCustomer_update"),
      body: input_init);
  //-------------------------------------------------------------------------
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response = await http
      .post(Uri.parse(server + "Routine_MasterCustomer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
      field13: "",
      field14: "",
      field15: "",
      field16: "",
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1_MR>> deleteData_fn_MR(
    List<MainStrucTableTap1_MR> state) async* {
  print("DELETE FUNCTION BLOC");
  var input_init = {
    "Id": EditDataTable1buffer_MR.number,
    "CustId": EditDataTable1buffer_MR.field01,
    "CustFull": EditDataTable1buffer_MR.field02,
    "CustShort": EditDataTable1buffer_MR.field03,
    "Branch": EditDataTable1buffer_MR.field04,
    "Code": EditDataTable1buffer_MR.field05,
    "FrequencyRequest": EditDataTable1buffer_MR.field06,
    "Incharge": EditDataTable1buffer_MR.field07,
    "SubLeader": EditDataTable1buffer_MR.field08,
    "GL": EditDataTable1buffer_MR.field09,
    "JP": EditDataTable1buffer_MR.field10,
    "DMG": EditDataTable1buffer_MR.field11,
  };

  final response_init = await http.post(
      Uri.parse(server + "Routine_MasterCustomer_delete"),
      body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response = await http
      .post(Uri.parse(server + "Routine_MasterCustomer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
      field13: "",
      field14: "",
      field15: "",
      field16: "",
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1_MR>> InsertData_fn_MR(
    List<MainStrucTableTap1_MR> state) async* {
  print("INSERT FUNCTION BLOC");
  var input_init = {
    "Id": EditDataTable1buffer_MR.number,
    "CustId": EditDataTable1buffer_MR.field01,
    "CustFull": EditDataTable1buffer_MR.field02,
    "CustShort": EditDataTable1buffer_MR.field03,
    "Branch": EditDataTable1buffer_MR.field04,
    "Code": EditDataTable1buffer_MR.field05,
    "FrequencyRequest": EditDataTable1buffer_MR.field06,
    "Incharge": EditDataTable1buffer_MR.field07,
    "SubLeader": EditDataTable1buffer_MR.field08,
    "GL": EditDataTable1buffer_MR.field09,
    "JP": EditDataTable1buffer_MR.field10,
    "DMG": EditDataTable1buffer_MR.field11,
  };

  final response_init = await http.post(
      Uri.parse(server + "Routine_MasterCustomer_insert"),
      body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response = await http
      .post(Uri.parse(server + "Routine_MasterCustomer_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
      field13: "",
      field14: "",
      field15: "",
      field16: "",
      field17: "",
      field18: "",
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

//------------------------------------------------------------------------------

class FetchDataTable2Bloc_MR
    extends Bloc<DataSequncePage2_MR, List<MainStrucTableTap2_MR>> {
  FetchDataTable2Bloc_MR() : super([]);

  @override
  Stream<List<MainStrucTableTap2_MR>> mapEventToState(
      DataSequncePage2_MR event) async* {
    if (event == DataSequncePage2_MR.select) {
      yield* selectData2_fn_MR(state);
    } else if (event == DataSequncePage2_MR.update) {
      yield* updateData2_fn_MR(state);
    } else if (event == DataSequncePage2_MR.delete) {
      yield* deleteData2_fn_MR(state);
    } else if (event == DataSequncePage2_MR.insert) {
      yield* InsertData2_fn_MR(state);
    }
  }
}

Stream<List<MainStrucTableTap2_MR>> selectData2_fn_MR(
    List<MainStrucTableTap2_MR> state) async* {
  print("SELECT FUNCTION BLOC 2");
  String input = "hi data";
  final response = await http
      .post(Uri.parse(server + "Routine_MasterLab_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_MR>> updateData2_fn_MR(
    List<MainStrucTableTap2_MR> state) async* {
  print("UPDATE FUNCTION BLOC 2");

  var input_init = {
    "Id": EditDataTable2buffer_MR.number,
    "CustId": EditDataTable2buffer_MR.field01,
    "CustFull": EditDataTable2buffer_MR.field02,
    "CustShort": EditDataTable2buffer_MR.field03,
    "FrequencyRequest": EditDataTable2buffer_MR.field04,
    "SampleGroup": EditDataTable2buffer_MR.field05,
    "SampleType": EditDataTable2buffer_MR.field06,
    "SampleTank": EditDataTable2buffer_MR.field07,
    "SampleName": EditDataTable2buffer_MR.field08,
    "Frequency": EditDataTable2buffer_MR.field09,
    "ItemNo": EditDataTable2buffer_MR.field10,
    "Instrument": EditDataTable2buffer_MR.field11,
    "ItemName": EditDataTable2buffer_MR.field12,
    "Position": EditDataTable2buffer_MR.field13,
    "Mag": EditDataTable2buffer_MR.field14,
    "Temp": EditDataTable2buffer_MR.field15,
    "StdFactor": EditDataTable2buffer_MR.field16,
    "StdMax": EditDataTable2buffer_MR.field17,
    "StdMin": EditDataTable2buffer_MR.field18,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_MasterLab_update"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response = await http
      .post(Uri.parse(server + "Routine_MasterLab_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_MR>> deleteData2_fn_MR(
    List<MainStrucTableTap2_MR> state) async* {
  print("DELETE FUNCTION BLOC 2");
  var input_init = {
    "Id": EditDataTable2buffer_MR.number,
    "CustId": EditDataTable2buffer_MR.field01,
    "CustFull": EditDataTable2buffer_MR.field02,
    "CustShort": EditDataTable2buffer_MR.field03,
    "FrequencyRequest": EditDataTable2buffer_MR.field04,
    "SampleGroup": EditDataTable2buffer_MR.field05,
    "SampleType": EditDataTable2buffer_MR.field06,
    "SampleTank": EditDataTable2buffer_MR.field07,
    "SampleName": EditDataTable2buffer_MR.field08,
    "Frequency": EditDataTable2buffer_MR.field09,
    "ItemNo": EditDataTable2buffer_MR.field10,
    "Instrument": EditDataTable2buffer_MR.field11,
    "ItemName": EditDataTable2buffer_MR.field12,
    "Position": EditDataTable2buffer_MR.field13,
    "Mag": EditDataTable2buffer_MR.field14,
    "Temp": EditDataTable2buffer_MR.field15,
    "StdFactor": EditDataTable2buffer_MR.field16,
    "StdMax": EditDataTable2buffer_MR.field17,
    "StdMin": EditDataTable2buffer_MR.field18,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_MasterLab_delete"), body: input_init);
  //------------------------------------------------------------------------------

  String input = "hi data";
  final response = await http
      .post(Uri.parse(server + "Routine_MasterLab_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap2_MR>> InsertData2_fn_MR(
    List<MainStrucTableTap2_MR> state) async* {
  print("INSERT FUNCTION BLOC 2");
  var input_init = {
    "Id": EditDataTable2buffer_MR.number,
    "CustId": EditDataTable2buffer_MR.field01,
    "CustFull": EditDataTable2buffer_MR.field02,
    "CustShort": EditDataTable2buffer_MR.field03,
    "FrequencyRequest": EditDataTable2buffer_MR.field04,
    "SampleGroup": EditDataTable2buffer_MR.field05,
    "SampleType": EditDataTable2buffer_MR.field06,
    "SampleTank": EditDataTable2buffer_MR.field07,
    "SampleName": EditDataTable2buffer_MR.field08,
    "Frequency": EditDataTable2buffer_MR.field09,
    "ItemNo": EditDataTable2buffer_MR.field10,
    "Instrument": EditDataTable2buffer_MR.field11,
    "ItemName": EditDataTable2buffer_MR.field12,
    "Position": EditDataTable2buffer_MR.field13,
    "Mag": EditDataTable2buffer_MR.field14,
    "Temp": EditDataTable2buffer_MR.field15,
    "StdFactor": EditDataTable2buffer_MR.field16,
    "StdMax": EditDataTable2buffer_MR.field17,
    "StdMin": EditDataTable2buffer_MR.field18,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_MasterLab_insert"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response = await http
      .post(Uri.parse(server + "Routine_MasterLab_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }

  state = stateoutput;
  yield state;
}

//------------------------------------------------------------------------------ 3

class FetchDataTable3Bloc_MR
    extends Bloc<DataSequncePage3_MR, List<MainStrucTableTap3_MR>> {
  FetchDataTable3Bloc_MR() : super([]);

  @override
  Stream<List<MainStrucTableTap3_MR>> mapEventToState(
      DataSequncePage3_MR event) async* {
    if (event == DataSequncePage3_MR.select) {
      yield* selectData3_fn_MR(state);
    } else if (event == DataSequncePage3_MR.update) {
      yield* updateData3_fn_MR(state);
    } else if (event == DataSequncePage3_MR.delete) {
      yield* deleteData3_fn_MR(state);
    } else if (event == DataSequncePage3_MR.insert) {
      yield* InsertData3_fn_MR(state);
    }
  }
}

Stream<List<MainStrucTableTap3_MR>> selectData3_fn_MR(
    List<MainStrucTableTap3_MR> state) async* {
  print("SELECT FUNCTION BLOC 3");
  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_MasterTS_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_MR>> updateData3_fn_MR(
    List<MainStrucTableTap3_MR> state) async* {
  print("UPDATE FUNCTION BLOC 3");
  var input_init = {
    "Id": EditDataTable3buffer_MR.number,
    "CustId": EditDataTable3buffer_MR.field01,
    "CustFull": EditDataTable3buffer_MR.field02,
    "CustShort": EditDataTable3buffer_MR.field03,
    "FrequencyRequest": EditDataTable3buffer_MR.field04,
    "SampleGroup": EditDataTable3buffer_MR.field05,
    "SampleType": EditDataTable3buffer_MR.field06,
    "SampleTank": EditDataTable3buffer_MR.field07,
    "SampleName": EditDataTable3buffer_MR.field08,
    "Frequency": EditDataTable3buffer_MR.field09,
    "ItemNo": EditDataTable3buffer_MR.field10,
    "Instrument": EditDataTable3buffer_MR.field11,
    "ItemName": EditDataTable3buffer_MR.field12,
    "Position": EditDataTable3buffer_MR.field13,
    "Mag": EditDataTable3buffer_MR.field14,
    "Temp": EditDataTable3buffer_MR.field15,
    "StdFactor": EditDataTable3buffer_MR.field16,
    "StdMax": EditDataTable3buffer_MR.field17,
    "StdMin": EditDataTable3buffer_MR.field18,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_MasterTS_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_MasterTS_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_MR>> deleteData3_fn_MR(
    List<MainStrucTableTap3_MR> state) async* {
  print("DELETE FUNCTION BLOC 3");
  var input_init = {
    "Id": EditDataTable3buffer_MR.number,
    "CustId": EditDataTable3buffer_MR.field01,
    "CustFull": EditDataTable3buffer_MR.field02,
    "CustShort": EditDataTable3buffer_MR.field03,
    "FrequencyRequest": EditDataTable3buffer_MR.field04,
    "SampleGroup": EditDataTable3buffer_MR.field05,
    "SampleType": EditDataTable3buffer_MR.field06,
    "SampleTank": EditDataTable3buffer_MR.field07,
    "SampleName": EditDataTable3buffer_MR.field08,
    "Frequency": EditDataTable3buffer_MR.field09,
    "ItemNo": EditDataTable3buffer_MR.field10,
    "Instrument": EditDataTable3buffer_MR.field11,
    "ItemName": EditDataTable3buffer_MR.field12,
    "Position": EditDataTable3buffer_MR.field13,
    "Mag": EditDataTable3buffer_MR.field14,
    "Temp": EditDataTable3buffer_MR.field15,
    "StdFactor": EditDataTable3buffer_MR.field16,
    "StdMax": EditDataTable3buffer_MR.field17,
    "StdMin": EditDataTable3buffer_MR.field18,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_MasterTS_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_MasterTS_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_MR>> InsertData3_fn_MR(
    List<MainStrucTableTap3_MR> state) async* {
  print("INSERT FUNCTION BLOC 3");
  var input_init = {
    "Id": EditDataTable3buffer_MR.number,
    "CustId": EditDataTable3buffer_MR.field01,
    "CustFull": EditDataTable3buffer_MR.field02,
    "CustShort": EditDataTable3buffer_MR.field03,
    "FrequencyRequest": EditDataTable3buffer_MR.field04,
    "SampleGroup": EditDataTable3buffer_MR.field05,
    "SampleType": EditDataTable3buffer_MR.field06,
    "SampleTank": EditDataTable3buffer_MR.field07,
    "SampleName": EditDataTable3buffer_MR.field08,
    "Frequency": EditDataTable3buffer_MR.field09,
    "ItemNo": EditDataTable3buffer_MR.field10,
    "Instrument": EditDataTable3buffer_MR.field11,
    "ItemName": EditDataTable3buffer_MR.field12,
    "Position": EditDataTable3buffer_MR.field13,
    "Mag": EditDataTable3buffer_MR.field14,
    "Temp": EditDataTable3buffer_MR.field15,
    "StdFactor": EditDataTable3buffer_MR.field16,
    "StdMax": EditDataTable3buffer_MR.field17,
    "StdMin": EditDataTable3buffer_MR.field18,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_MasterTS_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_MasterTS_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3_MR> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3_MR(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['FrequencyRequest'].toString(),
      field05: data_input[i]['SampleGroup'].toString(),
      field06: data_input[i]['SampleType'].toString(),
      field07: data_input[i]['SampleTank'].toString(),
      field08: data_input[i]['SampleName'].toString(),
      field09: data_input[i]['Frequency'].toString(),
      field10: data_input[i]['ItemNo'].toString(),
      field11: data_input[i]['Instrument'].toString(),
      field12: data_input[i]['ItemName'].toString(),
      field13: data_input[i]['Position'].toString(),
      field14: data_input[i]['Mag'].toString(),
      field15: data_input[i]['Temp'].toString(),
      field16: data_input[i]['StdFactor'].toString(),
      field17: data_input[i]['StdMax'].toString(),
      field18: data_input[i]['StdMin'].toString(),
      field19: "",
      field20: "",
    ));
  }
  state = stateoutput;
  yield state;
}

//------------------------------------------------------------------------------ dropdowndata

class DropDownData_MR {
  List<String> list01 = [""];
  List<String> list02 = [""];
  List<String> list03 = [""];
  List<String> list04 = [""];
  List<String> list05 = [""];
  List<String> list06 = [""];
  List<String> list07 = [""];
  List<String> list08 = [""];
  List<String> list09 = [""];
  List<String> list10 = [""];

  DropDownData_MR({
    required this.list01,
    required this.list02,
    required this.list03,
    required this.list04,
    required this.list05,
    required this.list06,
    required this.list07,
    required this.list08,
    required this.list09,
    required this.list10,
  });
}

DropDownData_MR zeroDropDownData_MR = DropDownData_MR(
  list01: [],
  list02: [],
  list03: [],
  list04: [],
  list05: [],
  list06: [],
  list07: [],
  list08: [],
  list09: [],
  list10: [],
);

class Dropdowndata_MR extends Bloc<dropdownrequrst_MR, DropDownData_MR> {
  Dropdowndata_MR() : super(zeroDropDownData_MR);

  @override
  Stream<DropDownData_MR> mapEventToState(dropdownrequrst_MR event) async* {
    if (event == dropdownrequrst_MR.set01) {
      yield* set_01_MR(state);
    } else if (event == dropdownrequrst_MR.set02) {
      yield* set_02_MR(state);
    } else if (event == dropdownrequrst_MR.set03) {
      yield* set_03_MR(state);
    }
  }
}

Stream<DropDownData_MR> set_01_MR(DropDownData_MR state) async* {
  final response =
      await http.post(Uri.parse(server + "set_04"), body: {"Qurey": ""});

  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      // print(data_input['list01'][i].toString());
      state.list01.add(data_input['list01'][i].toString());
    }

    print(state.list01);

    for (var i = 0; i < data_input['list02'].length; i++) {
      // print(data_input['list02'][i].toString());
      state.list02.add(data_input['list02'][i].toString());
    }

    for (var i = 0; i < data_input['list03'].length; i++) {
      // print(data_input['list03'][i].toString());
      state.list03.add(data_input['list03'][i].toString());
    }

    for (var i = 0; i < data_input['list04'].length; i++) {
      // print(data_input['list04'][i].toString());
      state.list04.add(data_input['list04'][i].toString());
    }

    for (var i = 0; i < data_input['list05'].length; i++) {
      // print(data_input['list05'][i].toString());
      state.list05.add(data_input['list05'][i].toString());
    }

    for (var i = 0; i < data_input['list06'].length; i++) {
      // print(data_input['list06'][i].toString());
      state.list06.add(data_input['list06'][i].toString());
    }

    for (var i = 0; i < data_input['list07'].length; i++) {
      // print(data_input['list07'][i].toString());
      state.list07.add(data_input['list07'][i].toString());
    }

    state.list08 = [""];
    state.list09 = [""];
    state.list10 = [""];
  } else {
    state.list01 = [""];
    state.list02 = [""];
    state.list03 = [""];
    state.list04 = [""];
    state.list05 = [""];
    state.list06 = [""];
    state.list07 = [""];
    state.list08 = [""];
    state.list09 = [""];
    state.list10 = [""];
  }

  // print(state.list01);
  // print(state.list02);
  // print(state.list03);

  yield state;
}

Stream<DropDownData_MR> set_02_MR(DropDownData_MR state) async* {
  final response =
      await http.post(Uri.parse(server + "set_02_MR"), body: {"Qurey": ""});

  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i].toString());
    }
    for (var i = 0; i < data_input['list02'].length; i++) {
      state.list02.add(data_input['list02'][i].toString());
    }
    for (var i = 0; i < data_input['list03'].length; i++) {
      state.list03.add(data_input['list03'][i].toString());
    }
    for (var i = 0; i < data_input['list04'].length; i++) {
      state.list04.add(data_input['list04'][i].toString());
    }
    for (var i = 0; i < data_input['list05'].length; i++) {
      state.list05.add(data_input['list05'][i].toString());
    }
    for (var i = 0; i < data_input['list06'].length; i++) {
      state.list06.add(data_input['list06'][i].toString());
    }
    for (var i = 0; i < data_input['list07'].length; i++) {
      state.list07.add(data_input['list07'][i].toString());
    }
    for (var i = 0; i < data_input['list08'].length; i++) {
      state.list08.add(data_input['list08'][i].toString());
    }
    for (var i = 0; i < data_input['list09'].length; i++) {
      state.list09.add(data_input['list09'][i].toString());
    }
    for (var i = 0; i < data_input['list10'].length; i++) {
      state.list10.add(data_input['list10'][i].toString());
    }
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData_MR> set_03_MR(DropDownData_MR state) async* {
  final response =
      await http.post(Uri.parse(server + "set_03_MR"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i].toString());
    }
    for (var i = 0; i < data_input['list02'].length; i++) {
      state.list02.add(data_input['list02'][i].toString());
    }
    for (var i = 0; i < data_input['list03'].length; i++) {
      state.list03.add(data_input['list03'][i].toString());
    }
    for (var i = 0; i < data_input['list04'].length; i++) {
      state.list04.add(data_input['list04'][i].toString());
    }
    for (var i = 0; i < data_input['list05'].length; i++) {
      state.list05.add(data_input['list05'][i].toString());
    }
    for (var i = 0; i < data_input['list06'].length; i++) {
      state.list06.add(data_input['list06'][i].toString());
    }
    for (var i = 0; i < data_input['list07'].length; i++) {
      state.list07.add(data_input['list07'][i].toString());
    }
    for (var i = 0; i < data_input['list08'].length; i++) {
      state.list08.add(data_input['list08'][i].toString());
    }
    for (var i = 0; i < data_input['list09'].length; i++) {
      state.list09.add(data_input['list09'][i].toString());
    }
    for (var i = 0; i < data_input['list10'].length; i++) {
      state.list10.add(data_input['list10'][i].toString());
    }
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

//--------------------------------

class CallDropDownDataS_MR {
  String data01 = '';
  String data02 = '';
  String data03 = '';
  String data04 = '';
  String data05 = '';
  String data06 = '';
  String data07 = '';
  String data08 = '';
  String data09 = '';
  String data10 = '';

  CallDropDownDataS_MR({
    required this.data01,
    required this.data02,
    required this.data03,
    required this.data04,
    required this.data05,
    required this.data06,
    required this.data07,
    required this.data08,
    required this.data09,
    required this.data10,
  });
}

CallDropDownDataS_MR ZeCallDropdowndata_MR = CallDropDownDataS_MR(
    data01: '',
    data02: '',
    data03: '',
    data04: '',
    data05: '',
    data06: '',
    data07: '',
    data08: '',
    data09: '',
    data10: '');

class CallDropdowndata_MR
    extends Bloc<calldropdownrequrst_MR, CallDropDownDataS_MR> {
  CallDropdowndata_MR() : super(ZeCallDropdowndata_MR);

  @override
  Stream<CallDropDownDataS_MR> mapEventToState(
      calldropdownrequrst_MR event) async* {
    if (event == calldropdownrequrst_MR.set01_1) {
      yield* set_01_1_MR(state);
    } else if (event == calldropdownrequrst_MR.set02_1) {
      yield* set_02_1_MR(state);
    } else if (event == calldropdownrequrst_MR.set03_1) {
      yield* set_03_1_MR(state);
    }
  }
}

Stream<CallDropDownDataS_MR> set_01_1_MR(CallDropDownDataS_MR state) async* {
  final response = await http.post(Uri.parse(server + "set_01_1_MRcall"),
      body: {"Qurey": EditDataTable1_MR.field02});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    EditDataTable1_MR.field01 = data_input['data02'];
    EditDataTable1_MR.field03 = data_input['data04'];
    EditDataTable1_MR.field04 = data_input['data05'];
    EditDataTable1_MR.field05 = data_input['data06'];
    EditDataTable1buffer_MR.field01 = data_input['data02'];
    EditDataTable1buffer_MR.field03 = data_input['data04'];
    EditDataTable1buffer_MR.field04 = data_input['data05'];
    EditDataTable1buffer_MR.field05 = data_input['data06'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS_MR> set_02_1_MR(CallDropDownDataS_MR state) async* {
  final response = await http.post(Uri.parse(server + "set_02_1_MRcall"),
      body: {"Qurey": EditDataTable2_MR.field02});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    EditDataTable2_MR.field01 = data_input['data02'];
    EditDataTable2_MR.field03 = data_input['data04'];
    EditDataTable2_MR.field04 = data_input['data07'];

    EditDataTable2buffer_MR.field01 = data_input['data02'];
    EditDataTable2buffer_MR.field03 = data_input['data04'];
    EditDataTable2buffer_MR.field04 = data_input['data07'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS_MR> set_03_1_MR(CallDropDownDataS_MR state) async* {
  final response = await http.post(Uri.parse(server + "set_03_1_MRcall"),
      body: {"Qurey": EditDataTable3_MR.field02});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    EditDataTable3_MR.field01 = data_input['data02'];
    EditDataTable3_MR.field03 = data_input['data04'];
    EditDataTable3_MR.field04 = data_input['data07'];

    EditDataTable3buffer_MR.field01 = data_input['data02'];
    EditDataTable3buffer_MR.field03 = data_input['data04'];
    EditDataTable3_MR.field04 = data_input['data07'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}
