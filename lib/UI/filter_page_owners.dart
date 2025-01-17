import 'package:carRecordApp/Operations/shared_operations.dart';
import 'package:carRecordApp/Templates/string_content_template.dart';
import 'package:carRecordApp/model/filter_data_car_model.dart';
import 'package:carRecordApp/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  static String routeName = '/filter';
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool isStarting = true;
  GlobalKey<ScaffoldState> _scaffoldKey3 = new GlobalKey<ScaffoldState>();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController color = new TextEditingController();
  TextEditingController carModel = new TextEditingController();
  List<String> countryList = new List<String>();
  List<String> colorList = new List<String>();
  List<DropdownMenuItem> genderList = [
    DropdownMenuItem(
      child: Text('All'),
      value: 'All',
    ),
    DropdownMenuItem(
      child: Text('Male'),
      value: 'Male',
    ),
    DropdownMenuItem(child: Text('Female'), value: 'Female')
  ];
  String gender;

  Future<Null> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: DateTime(2015, 1),
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2015, 12));
    if (picked != null) {
      setState(() {
        controller.text = picked.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var dimension = MediaQuery.of(context).size;
    if (isStarting && provider.filterCarModel != null) {
      fromDate.text = provider.filterCarModel.fromYear;
      toDate.text = provider.filterCarModel.toYear;
      gender = provider.filterCarModel.gender;
      carModel.text = provider.filterCarModel.model;
      countryList = provider.filterCarModel.countries;
      colorList = provider.filterCarModel.colors;
      setState(() {});
      isStarting = false;
    }
    return Scaffold(
      key: _scaffoldKey3,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Filter list',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan[400],
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: dimension.width * 0.05,
                top: dimension.height * 0.05,
                right: dimension.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Date Range',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.cyan),
                ),
                SizedBox(
                  height: dimension.height * 0.01,
                ),
                Text(
                  'From: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.cyan),
                ),
                InkWell(
                  onTap: () {
                    selectDate(context, fromDate);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextField(
                      controller: fromDate,
                      decoration: InputDecoration(
                        border: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.cyan),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height * 0.01,
                ),
                Text(
                  'To: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.cyan),
                ),
                InkWell(
                  onTap: () {
                    selectDate(context, toDate);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextField(
                      controller: toDate,
                      decoration: InputDecoration(
                        border: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.cyan),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height * 0.04,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.cyan),
                ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.cyan),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                    hint: Text('Select gender'),
                    value: gender,
                    items: genderList,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    }),
                SizedBox(
                  height: dimension.height * 0.04,
                ),
                Text(
                  'Car Model',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.cyan),
                ),
                TextField(
                  controller: carModel,
                  decoration: InputDecoration(
                    hintText: 'Enter Car Model',
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.cyan),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height * 0.04,
                ),
                Text(
                  'Countries',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.cyan),
                ),
                TextField(
                  onSubmitted: (value) {
                    setState(() {
                      countryList.add(value);
                      country.clear();
                    });
                  },
                  controller: country,
                  decoration: InputDecoration(
                    hintText: 'Enter Country',
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.cyan),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height * 0.02,
                ),
                countryList.length > 0
                    ? Container(
                        height: dimension.height * 0.04,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: countryList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      countryList.remove(countryList[index]);
                                    });
                                  },
                                  child: StringContent(
                                      content: countryList[index]));
                            }),
                      )
                    : SizedBox(),
                SizedBox(
                  height: dimension.height * 0.04,
                ),
                Text(
                  'Color',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.cyan),
                ),
                TextField(
                  onSubmitted: (value) {
                    setState(() {
                      colorList.add(value);
                      color.clear();
                    });
                  },
                  controller: color,
                  decoration: InputDecoration(
                    hintText: 'Enter Color',
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.cyan),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height * 0.025,
                ),
                colorList.length > 0
                    ? Container(
                        height: dimension.height * 0.04,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colorList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      colorList.remove(colorList[index]);
                                    });
                                  },
                                  child:
                                      StringContent(content: colorList[index]));
                            }),
                      )
                    : SizedBox(),
                SizedBox(
                  height: dimension.height * 0.025,
                ),
                Row(
                  children: [
                    FlatButton(
                      color: Colors.cyan[400],
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(dimension.width * 0.04)),
                      onPressed: () {
                        if (fromDate.text.isEmpty &&
                            toDate.text.isEmpty &&
                            carModel.text.isEmpty &&
                            gender == null &&
                            colorList.length == 0 &&
                            countryList.length == 0) {
                          SharedOperations.showMessage(
                              _scaffoldKey3, 'You must set atleast one filter');
                          return;
                        }
                        if (fromDate.text.isNotEmpty &&
                            toDate.text.isNotEmpty) {
                          int from = int.parse(fromDate.text);
                          int to = int.parse(toDate.text);
                          if (from > to) {
                            SharedOperations.showMessage(_scaffoldKey3,
                                'start date must be less than end data');
                            return;
                          }
                        }
                        FilterCarModel filterData = new FilterCarModel(
                            colors: colorList,
                            countries: countryList,
                            model: carModel.text.isEmpty ? null : carModel.text,
                            fromYear:
                                fromDate.text.isEmpty ? null : fromDate.text,
                            gender: gender,
                            toYear: toDate.text.isEmpty ? null : toDate.text);
                        provider.filterCarModel = filterData;
                        Navigator.pop(context, filterData);
                      },
                      child: Text(
                        'Apply Filter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: dimension.width * 0.02,
                    ),
                    FlatButton(
                        color: Colors.cyan[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(dimension.width * 0.04)),
                        onPressed: () {
                          provider.ownersDataList = provider.ownersDataListCopy;
                          provider.filterCarModel = null;
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Remove Filter',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: dimension.height * 0.04,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
