import 'package:counter_app/api_service.dart';
import 'package:counter_app/dynamic_list.dart';
import 'package:counter_app/textFiledForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatepickerScreen extends StatefulWidget {
  @override
  const DatepickerScreen({super.key});
  State<DatepickerScreen> createState() => _Datepickerpage();
}

class _Datepickerpage extends State<DatepickerScreen> {
  TextEditingController timecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController dateioscontroller = TextEditingController();
  TextEditingController timeioscontroller = TextEditingController();
  TextEditingController cityName = TextEditingController();
  DateTime? selectedIOSDate;
  int selectedcityIndex = 0;
  String? selectedCity;
  String? selectedGender;

  final List<String> gender = ['Female', 'Male', 'Other'];

  final List<String> cities = [
    'Mumbai',
    'Ahmedbad',
    'Vadodara',
    'Banglore',
    'Pune',
    'Delhi',
  ];
  @override
  void initState(){
    super.initState();
    _loadSavedDate();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Date picker',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: datecontroller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Select date',
                labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                hintText: 'DD/MM/YYYY',
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                print('date is ${date}');
                if (date != null) {
                  datecontroller.text =
                      '${date.day}/${date.month}/${date.year}';
                      _saveDate(date);
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: timecontroller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Select time',
                labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                hintText: 'HH:MM',
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                suffixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  timecontroller.text = time.format(context);
                  _saveTime(time.format(context));
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: dateioscontroller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Select date',
                labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                hintText: 'DD/MM/YYYY',
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    DateTime selectedDate = selectedIOSDate ?? DateTime.now();
                    return SizedBox(
                      height: 330,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  selectedIOSDate = selectedDate;
                                  dateioscontroller.text =
                                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 1),
                          Expanded(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime:
                                  selectedIOSDate ?? DateTime.now(),
                              maximumDate: DateTime(2030),
                              onDateTimeChanged: (date) {
                                selectedDate = date;
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: timeioscontroller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Select time',
                labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                hintText: 'HH:MM',
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                suffixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    DateTime selectedTime = DateTime.now();
                    return SizedBox(
                      height: 330,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  final hour = selectedTime.hour > 12
                                      ? selectedTime.hour - 12
                                      : selectedTime.hour;
                                  final amPm = selectedTime.hour >= 12
                                      ? 'PM'
                                      : 'AM';
                                  timeioscontroller.text =
                                      '${hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} $amPm';
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 1),
                          Expanded(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (time) {
                                selectedTime = time;
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            TextFormField(
              controller: cityName,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Select city',
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                labelText: 'Select cityw',
                labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    int tempIndex = selectedcityIndex;
                    return SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  selectedcityIndex = tempIndex;
                                  cityName.text = cities[tempIndex];
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 1, color: Colors.grey),
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 40,
                              scrollController: FixedExtentScrollController(
                                initialItem: selectedcityIndex,
                              ),
                              onSelectedItemChanged: (index) {
                                tempIndex = index;
                              },
                              children: cities
                                  .map((city) => Center(child: Text(city)))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedCity,
              hint: Text(
                'Select city',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
              ),
              decoration: InputDecoration(
                labelText: 'Select city',
                labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              isExpanded: true,
              items: cities.map((city) {
                return DropdownMenuItem(value: city, child: Text(city));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownMenu(
              hintText: 'Select City',
              textStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
              expandedInsets: EdgeInsets.all(2),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              dropdownMenuEntries: cities.map((city) {
                return DropdownMenuEntry(value: city, label: city);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadSavedDate() async{
    final pref = await SharedPreferences.getInstance();
   // await pref.remove('selectedDate');
    final savedDate = pref.getString('selectedDate');

    if (savedDate != null){
      final date = DateTime.parse(savedDate);
      setState(() {
        datecontroller.text = '${date.day}/${date.month}/${date.year}';
      });
    }
     final savedTime = pref.getString('selectedTime');
     if (savedTime != null){
      setState(() {
        timecontroller.text = savedTime;
      });
     }

     final cityname = pref.getString('selectedCity');
     if (cityname != null){
      setState(() {
        cityName.text = cityname;
      });
     }
     final product = await ApiService.getProduct();
     print('product length is ${product.length}');
  }

  Future<void> _saveDate(DateTime date) async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString('selectedDate', date.toIso8601String());
  }

  Future<void> _saveTime(String time) async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString('selectedTime', time);
  }

  Future<void> _saveCity(String city) async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString('selectedCity', city);
  }
}


