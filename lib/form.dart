import 'package:counter_7/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:counter_7/drawer.dart';


import 'main.dart';

class AddBudgetPage extends StatefulWidget {
  static List<List<Object>> listData = _AddBudgetPageState.list;
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  static final List<List<Object>> list = [];
  final _formKey = GlobalKey<FormState>();
  String jenis = 'Pemasukan';
  String title = '';
  int amount = 0;
  DateTime datetime = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  late final String dateString = dateFormat.format(datetime);

  TextEditingController dateInputController = TextEditingController();


  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  List<Object> listForm = [];

  List<List<Object>> _getList(){
    return list;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Budget Form', style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22, color: Colors.black,
        ),),
      ),
      // Adding drawer menu
      drawer: DrawerClass('Add Budget'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(0,102,102,1),),

                      ),
                      hintText: "Judul",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },

                    // Lakukan validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },

                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(0,102,102,1),),

                      ),
                      hintText: "Jumlah",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        amount = int.parse(value!);
                      });
                    },

                    // Saat save ditekan
                    onSaved: (String? value) {
                      setState(() {
                        amount = int.parse(value!);
                      });
                    },
                    // Lakukan validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan jumlah!';
                      }
                      return null;
                    },


                  ),
                ),
                const Divider(
                  height: 1,
                ),
                DropdownButton<String>(
                  value: jenis,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 10,
                  hint: Text(
                    "Pilih Jenis",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  items: listJenis.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    jenis = value!;
                  });
                },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Tanggal',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(0,102,102,1), width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(0,102,102,1), width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(0,102,102,1), width: 1)),

                  ),
                  controller: dateInputController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Color.fromRGBO(0,102,102,1), // header background color
                                onPrimary: Colors.white, // header text color
                                onSurface: Color.fromRGBO(0,102,102,1), // body text color
                              ),
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));


                    if (pickedDate != null) {
                      dateInputController.text = DateFormat('dd MMMM yyyy').format(pickedDate);
                    }
                  },
                ),

                SizedBox(height: 20.0,),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(0,102,102,1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      )
                  ),

                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      listForm.add(title);
                      listForm.add(amount);
                      listForm.add(jenis);

                      listForm.add(dateInputController.text);
                      list.add(listForm);
                      listForm = [];
                      _sendDataToBudgetData(context);
                    }
                  },
                ),
              ],),
          ),
        ),

      ),
    );
  }
  void _sendDataToBudgetData(BuildContext context){
    var dataToSend = list;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BudgetDataPage(list: dataToSend,))
    );

  }
}

class BudgetDataPage extends StatelessWidget {
  final list;
  BudgetDataPage({super.key, @required this.list});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text('Data Budget', style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22, color: Colors.black,
          ),),
        ),
        // Adding drawer menu
        drawer: DrawerClass('Budget Data'),

        body: SafeArea(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: Color.fromRGBO(0,102,102,1)
                    )
                ),
                elevation: 10,
                margin: const EdgeInsets.all(10),

                child:  ListTile(
                  title: Text(list[index][0]),
                  subtitle: Text("Rp. " + list[index][1].toString() + ", " + list[index][3]),
                  trailing: Text(list[index][2]),
                ),
              )


          ),
        )
    );
  }


}