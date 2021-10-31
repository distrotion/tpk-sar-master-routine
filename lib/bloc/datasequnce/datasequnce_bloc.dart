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

// String server = "http://172.20.30.46:9200/";
String server = "http://127.0.0.1:9200/";

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
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

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
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
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
    "Username": EditDataTable1buffer_MR.field01,
    "Password": EditDataTable1buffer_MR.field02,
    "Name": EditDataTable1buffer_MR.field03,
    "Section": EditDataTable1buffer_MR.field04,
    "RoleId": EditDataTable1buffer_MR.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "user_update"), body: input_init);
  //-------------------------------------------------------------------------
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

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
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1_MR>> deleteData_fn_MR(
    List<MainStrucTableTap1_MR> state) async* {
  print("DELETE FUNCTION BLOC");
  var input_init = {
    "Id": DeleteDataTable1buffer_MR.number,
    "Username": DeleteDataTable1buffer_MR.field01,
    "Password": DeleteDataTable1buffer_MR.field02,
    "Name": DeleteDataTable1buffer_MR.field03,
    "Section": DeleteDataTable1buffer_MR.field04,
    "RoleId": DeleteDataTable1buffer_MR.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "user_delete"), body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

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
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1_MR>> InsertData_fn_MR(
    List<MainStrucTableTap1_MR> state) async* {
  print("INSERT FUNCTION BLOC");
  var input_init = {
    "Id": "insert",
    "Username": EditDataTable1buffer_MR.field01,
    "Password": EditDataTable1buffer_MR.field02,
    "Name": EditDataTable1buffer_MR.field03,
    "Section": EditDataTable1buffer_MR.field04,
    "RoleId": EditDataTable1buffer_MR.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "user_insert"), body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

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
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
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
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

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
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
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
    "Branch": EditDataTable2buffer_MR.field04,
    "CODE": EditDataTable2buffer_MR.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "Custommer_data_update"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

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
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_MR>> deleteData2_fn_MR(
    List<MainStrucTableTap2_MR> state) async* {
  print("DELETE FUNCTION BLOC 2");
  var input_init = {
    "Id": DeleteDataTable2buffer_MR.number,
    "CustId": DeleteDataTable2buffer_MR.field01,
    "CustFull": DeleteDataTable2buffer_MR.field02,
    "CustShort": DeleteDataTable2buffer_MR.field03,
    "Branch": DeleteDataTable2buffer_MR.field04,
    "CODE": DeleteDataTable2buffer_MR.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "Custommer_data_delete"), body: input_init);
  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

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
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap2_MR>> InsertData2_fn_MR(
    List<MainStrucTableTap2_MR> state) async* {
  print("INSERT FUNCTION BLOC 2");
  var input_init = {
    "Id": "insert",
    "CustId": EditDataTable2buffer_MR.field01,
    "CustFull": EditDataTable2buffer_MR.field02,
    "CustShort": EditDataTable2buffer_MR.field03,
    "Branch": EditDataTable2buffer_MR.field04,
    "CODE": EditDataTable2buffer_MR.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "Customer_Data_insert"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

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
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
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
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

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
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
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
    "FrequencyId": EditDataTable3buffer_MR.field01,
    "Frequency": EditDataTable3buffer_MR.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Frequency_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

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
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_MR>> deleteData3_fn_MR(
    List<MainStrucTableTap3_MR> state) async* {
  print("DELETE FUNCTION BLOC 3");
  var input_init = {
    "Id": DeleteDataTable3buffer_MR.number,
    "FrequencyId": DeleteDataTable3buffer_MR.field01,
    "Frequency": DeleteDataTable3buffer_MR.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Frequency_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

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
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3_MR>> InsertData3_fn_MR(
    List<MainStrucTableTap3_MR> state) async* {
  print("INSERT FUNCTION BLOC 3");
  var input_init = {
    "Id": "insert",
    "FrequencyId": EditDataTable3buffer_MR.field01,
    "Frequency": EditDataTable3buffer_MR.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Frequency_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

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
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

//------------------------------------------------------------------------------ dropdowndata

class DropDownData {
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

  DropDownData({
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

DropDownData zeroDropDownData = DropDownData(
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

class Dropdowndata extends Bloc<dropdownrequrst, DropDownData> {
  Dropdowndata() : super(zeroDropDownData);

  @override
  Stream<DropDownData> mapEventToState(dropdownrequrst event) async* {
    if (event == dropdownrequrst.set04) {
      yield* set_01_MR(state);
    } else if (event == dropdownrequrst.set06) {
      yield* set_02_MR(state);
    } else if (event == dropdownrequrst.set07) {
      yield* set_03_MR(state);
    }
  }
}

Stream<DropDownData> set_01_MR(DropDownData state) async* {
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

    // TB4data.tb401 = state.list01;
    // TB4data.tb402 = state.list02;
    // TB4data.tb403 = state.list03;
    // TB4data.tb404 = state.list04;
    // TB4data.tb405 = state.list05;
    // TB4data.tb406 = state.list06;
    // TB4data.tb407 = state.list07;

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

Stream<DropDownData> set_02_MR(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_06"), body: {"Qurey": ""});

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

    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
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

Stream<DropDownData> set_03_MR(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_07"), body: {"Qurey": ""});
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
      state.list01.add(data_input['list01'][i]);
    }

    for (var i = 0; i < data_input['list02'].length; i++) {
      state.list02.add(data_input['list02'][i]);
    }

    for (var i = 0; i < data_input['list03'].length; i++) {
      state.list03.add(data_input['list03'][i]);
    }
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
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

class CallDropDownDataS {
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

  CallDropDownDataS({
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

CallDropDownDataS ZeCallDropdowndata = CallDropDownDataS(
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

class CallDropdowndata extends Bloc<calldropdownrequrst, CallDropDownDataS> {
  CallDropdowndata() : super(ZeCallDropdowndata);

  @override
  Stream<CallDropDownDataS> mapEventToState(calldropdownrequrst event) async* {
    if (event == calldropdownrequrst.set04_1) {
      yield* set_01_1_MR(state);
    } else if (event == calldropdownrequrst.set06_1) {
      yield* set_02_1_MR(state);
    } else if (event == calldropdownrequrst.set07_1) {
      yield* set_03_1_MR(state);
    }
  }
}

Stream<CallDropDownDataS> set_01_1_MR(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_04_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable4.field01 = data_input['data01'];
    // EditDataTable4.field03 = data_input['data02'];
    // EditDataTable4.field04 = data_input['data03'];
    // EditDataTable4.field05 = data_input['data04'];
    // EditDataTable4buffer.field01 = data_input['data01'];
    // EditDataTable4buffer.field03 = data_input['data02'];
    // EditDataTable4buffer.field04 = data_input['data03'];
    // EditDataTable4buffer.field05 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_02_1_MR(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_06_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable6.field01 = data_input['data02'];
    // EditDataTable6buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_03_1_MR(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_07_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable7.field01 = data_input['data02'];
    // EditDataTable7buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}
