import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tes/user/homepage.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile; // Variable to hold the selected image file
  DateTime? _selectedDate; // Variable to hold the selected date
 
  final auth = FirebaseAuth.instance;
  var room = TextEditingController();
  var dateTime = TextEditingController();
  var problem = TextEditingController();
  var service = TextEditingController();
  String pathFile = "";
  String urlFile = "";
  List roomOptions = [
    // Add more room options as needed
    ];
  List listService = [
    'ช่างไฟ',
    'ช่างแอร์',
    'ช่างคอมพิวเตอร์',
    'ช่างปะปา',
  ];

  List BuilOption = [
    'อาคาร 50',
    'อาคาร 50A',
    'อาคาร 50B',
    'อาคาร 50C',
    'อาคาร 50D',
    'อาคาร 50F',
    'อาคาร 50E',
    'อาคาร 50G',
    // Add more room options as needed
  ];


  String? selectedRoom, selectedBuild,selectedFloor,selectedService;
  List listItemsR = [];
  List listItemsF = [];
  List listItemsS = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // ใส่ไอคอนลูกศรย้อนกลับ
          onPressed: () {
            Navigator.of(context)
                .pop(); // ใช้ Navigator.pop() เพื่อกลับไปหน้าก่อนหน้านี้
          },
        ),
        title: Text('การแจ้งปัญหา'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Form fields
            // TextFormField(
            //   controller: room,
            //   decoration: InputDecoration(
            //     labelText: 'ชั้น/ห้อง',
            //     border: OutlineInputBorder(),
            //   ),
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'กรุณากรอกชั้น/ห้อง';
            //     }
            //     return null;
            //   },
            // ),
// showButton(),
            // button(),

//  DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'หมวดช่าง',
//                 border: OutlineInputBorder(),
//               ),
//               value: selectedService,
//               onChanged: (Value) {
//                 setState(() {
//                  selectedService = Value;
//                 },
//                 );
//               },
//               items: listService.map((listService) {
//                 return DropdownMenuItem<String>(
//                   value: listService,
//                   child: Text(listService),
//                 );
//               }).toList(),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'กรุณาเลือกหมวดช่าง';
//                 }
//                 return null;
//               },
//             ),


DropdownButtonFormField<String>(
  decoration: InputDecoration(
    labelText: 'หมวดช่าง',
    border: OutlineInputBorder(),
  ),
  value: selectedService,
  onChanged: (Value) {
    setState(() {
      selectedService = Value;
    });
  },
  items: listService.map((listService) {
    return DropdownMenuItem<String>(
      value: listService,
      child: Text(listService),
    );
  }).toList(),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'กรุณาเลือกหมวดช่าง';
    }
    return null;
  },
),

            SizedBox(height: 16.0),

             
            
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'อาคาร',
                border: OutlineInputBorder(),
              ),
              value: selectedBuild,
              onChanged: (newValue) {
                setState(() {
                  selectedBuild = newValue;
                  //------------------ค้นห่ชั้นของตึก
                  FirebaseFirestore.instance
                      .collection("Building")
                      .snapshots()
                      .listen((event) {
                    List listItems = [];

                    event.docs.map((val) => listItems.add(val.id)).toList();
                    print(listItems.toString());

                    setState(() {
                      listItemsF = [];
                      for (String listItem in listItems) {
                        //listItem ------------- 50-F1, 50A-F1
                        // print(selectedBuild!.split(" ")[1]);
                        String Bname = selectedBuild!
                            .split(" ")[1]; //Bname------------- 50, 50A
                        String Bname2 = (Bname.length == 2)
                            ? "$Bname-"
                            : Bname; //Bname------------- 50-, 50A
                        // print(Bname);
                        if (listItem.substring(0, 3) == Bname2) {
                          String Fname = listItem.split(Bname + "-F")[1];
                          print(Fname);
                          listItemsF.add("ชั้น $Fname");
                        }
                      }
                    });
                    // print(listItemsF);
                  });
                  //--------------------------------
                });
              },
              items: BuilOption.map((roomOption) {
                return DropdownMenuItem<String>(
                  value: roomOption,
                  child: Text(roomOption),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาเลือกอาคาร';
                }
                return null;
              },
            ),

            SizedBox(height: 16.0),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'ชั้น',
                border: OutlineInputBorder(),
              ),
              value: selectedFloor,
              onChanged: (newValue) {
                setState(() {
                  print("$selectedBuild-$selectedFloor");
                  selectedFloor = newValue;
                  FirebaseFirestore.instance
              .collection("Building")
              .doc(selectedBuild!.split(" ")[1]+"-F"+selectedFloor!.split(" ")[1])
              .snapshots()
              .listen((event) {
            setState(() {
              listItemsR = [];
              if (event.data() != null) listItemsR.add(event.data());
              // print(listItemsR.toString());
              // print(listItemsR[0]["room"]);
              // print(roomOptions);
              roomOptions = listItemsR[0]["room"];
            });
          });
                });
              },
              items: listItemsF.map((roomOption) {
                return DropdownMenuItem<String>(
                  value: roomOption,
                  child: Text(roomOption),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาเลือกชั้น';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'ห้อง',
                border: OutlineInputBorder(),
              ),
              value: selectedRoom,
              onChanged: (newValue) {
                setState(() {
                  selectedRoom = newValue;
                });
              },
              items: roomOptions.map((roomOption) {
                return DropdownMenuItem<String>(
                  value: roomOption,
                  child: Text(roomOption),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาเลือกห้อง';
                }
                return null;
              },
            ),

            // SizedBox(height: 16.0),
            // GestureDetector(
            //   onTap: () => _selectDate(
            //       context), // เรียกใช้ฟังก์ชันเมื่อคลิกที่ช่องวันที่
            //   child: AbsorbPointer(
            //     child: TextFormField(
            //       decoration: InputDecoration(
            //         labelText: 'วัน/เดือน/ปี',
            //         border: OutlineInputBorder(),
            //         suffixIcon: Icon(Icons.calendar_today), // เพิ่มไอคอนปฏิทิน
            //       ),
            //       validator: (value) {
            //         if (_selectedDate == null) {
            //           return 'กรุณาเลือกวันที่';
            //         }
            //         return null;
            //       },
            //       controller: TextEditingController(
            //         // ใช้ TextEditingController เพื่อแสดงวันที่ที่ถูกเลือก
            //         text: _selectedDate == null
            //             ? ''
            //             : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(height: 16.0),
            TextFormField(
              controller: problem,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'ปัญหา',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกปัญหา';
                }
                return null;
              },
            ),

            SizedBox(height: 16.0),

            // Image upload button and selected image display
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 200, // กำหนดความสูง
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: _imageFile == null
                    ? Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 50.0,
                        ),
                      )
                    : Image.file(_imageFile!, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            String id = DateTime.now().toString();
            await uploadeStorage(id);
            // print("url:  "+ uploadeStorage(id).toString());
            // print(url);
            // Add form submission logic here
            if (_formKey.currentState!.validate() && urlFile != null) { 
              //   // Form is valid, process the data
              //   // Example: Submit the data to a server

              Map<String, dynamic> data = {};

              data["dateTime"] = id;
              data["service"] = selectedService;
              data["Building"] = selectedBuild;
              data["floor"] = selectedFloor;
              data["room"] = selectedRoom;
              data["problem"] = problem.text;
              data["user"] = auth.currentUser!.email;
              data["url"] = urlFile;
              
              
              print("data ${data}");
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(id)
                  .set(data)
                  .then((_) {
                    debugPrint('ส่งข้อมูลแล้ว');
                    Widget okButton = TextButton(
                      child: Text("ตกลง"),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    );

                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: Text("บันทึกคำร้องเสร็จแล้ว"),
                      content: Text("กดปุ่ม 'ตกลง' เพื่อกลับสู่หน้าหลัก"),
                      actions: [
                        okButton,
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                    ;
                  })
                  .then((value) {})
                  .catchError((error) {
                    debugPrint('เกิดข้อผิดพลาดในการส่งข้อมูล: $error');
                  });
            }
          },
          child: Text('ยืนยัน'),
        ),
      ),
    );
  }

  // Function to open the image picker
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        pathFile = pickedFile.path;
      }
    });
  }

  // Function to select a date
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //     });
  //   }
  // }

  Future<void> uploadeStorage(String name) async {
    // print(pathFile);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    await firebaseStorage
        .ref()
        .child("reportPic/$name.jpg")
        .putFile(File(pathFile))
        .then((p0) async {
      urlFile = await p0.ref.getDownloadURL();
    });
    // .snapshot
    // .ref
    // .getDownloadURL();

    print(urlFile);
  }

  Widget showButton() {
    return ElevatedButton(
        onPressed: () async {
          FirebaseFirestore.instance
              .collection("Building")
              .doc("50A-F1")
              .snapshots()
              .listen((event) {
            setState(() {
              listItemsR = [];
              if (event.data() != null) listItemsR.add(event.data());
              print(listItemsR.toString());
              print(listItemsR[0]["room"]);
              print(roomOptions);
              roomOptions = listItemsR[0]["room"];
            });
          });
        },
        child: const Text("แสดงรายการ"));
  }

  Widget button() {
    return ElevatedButton(
        onPressed: () async {
          FirebaseFirestore.instance
              .collection("Building")
              .snapshots()
              .listen((event) {
            List listItems = [];

            event.docs.map((val) => listItems.add(val.id)).toList();
            print(listItems.toString());

            setState(() {
              listItemsF = [];
              for (String listItem in listItems) {
                //listItem ------------- 50-F1, 50A-F1
                // print(selectedBuild!.split(" ")[1]);
                String Bname =
                    selectedBuild!.split(" ")[1]; //Bname------------- 50, 50A
                String Bname2 = (Bname.length == 2)
                    ? "$Bname-"
                    : Bname; //Bname------------- 50-, 50A
                // print(Bname);
                if (listItem.substring(0, 3) == Bname2) {
                  String Fname = listItem.split(Bname + "-F")[1];
                  print(Fname);
                  listItemsF.add("ชั้น $Fname");
                }
              }
            });
            print(listItemsF);
          });
        },
        child: const Text("แสดงรายการ"));
  }
}
