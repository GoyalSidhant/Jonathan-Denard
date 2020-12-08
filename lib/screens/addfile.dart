import 'dart:io';

import 'package:Jonathan_Denard/widgets/Database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uuid/uuid.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:Jonathan_Denard/global.dart'as global;
class AddFile extends StatefulWidget {
  @override
  _AddFileState createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  TextEditingController staff = TextEditingController();
  String ID;
  FileType _pickingType = FileType.any;
  String fileID = Uuid().v4();
  final DateTime timestamp = DateTime.now();
  final CollectionReference filesCollection =
      Firestore.instance.collection('files');

  TextEditingController _controller = TextEditingController();
  TextEditingController filename = TextEditingController();
  String fileName;
  String path;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType fileType;
  File file;

  void _openFileExplorer() async {
    setState(() => isLoadingPath = true);
    try {
      if (isMultiPick) {
        path = null;
        //paths = await FilePicker.getMultiFilePath(type: fileType? fileType: FileType.any, allowedExtensions: extensions);
      } else {
        file = await FilePicker.getFile(
          type: _pickingType,
        );
        //path = await FilePicker.getFilePath(type: _pickingType, allowedExtensions: extensions);
        paths = null;
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      isLoadingPath = false;
      fileName = path != null
          ? path.split('/').last
          : paths != null
              ? paths.keys.toString()
              : '...';
    });
  }

  Future<String> uploadFile(file) async {
    StorageUploadTask uploadTask =
        FirebaseStorage().ref().child("post_$fileID").putFile(file);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  void handleSubmit() async {
    print(file.path.toString());
    String mediaURL = await uploadFile(file);
    filesCollection.document(fileID).setData(<String,dynamic>{
      "fileID": fileID,
      "mediaURL": mediaURL,
      "name": filename.text,
      "clientName": staff.text,
      "timestamp": timestamp,
      "Filetype": _pickingType.toString()
    });
    await DatabaseService(uid: fileID).updateClientFile(ID);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Jonathan Denard Pro",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff14345e),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_alert_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height / 10),
                        Center(
                            child: TextFormField(
                          controller: filename,
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                            labelText: "Filename",
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusColor: Colors.black,
                            labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                        SizedBox(height: 5),
                        SizedBox(height: 5),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: DropdownButton(
                              hint: Text('LOAD PATH FROM'),
                              value: _pickingType,
                              items: <DropdownMenuItem>[
                                DropdownMenuItem(
                                  child: Text('FROM AUDIO'),
                                  value: FileType.audio,
                                ),
                                DropdownMenuItem(
                                  child: Text('FROM IMAGE'),
                                  value: FileType.image,
                                ),
                                DropdownMenuItem(
                                  child: Text('FROM VIDEO'),
                                  value: FileType.video,
                                ),
                                DropdownMenuItem(
                                  child: Text('FROM MEDIA'),
                                  value: FileType.media,
                                ),
                                DropdownMenuItem(
                                  child: Text('FROM ANY'),
                                  value: FileType.any,
                                ),
                                DropdownMenuItem(
                                  child: Text('CUSTOM FORMAT'),
                                  value: FileType.custom,
                                ),
                              ],
                              onChanged: (value) => setState(() {
                                    _pickingType = value;
                                    if (_pickingType != FileType.custom) {
                                      //_controller.text = _extension = '';
                                    }
                                  })),
                        )),
                        SizedBox(height: 5),
                        Center(
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints.tightFor(width: 100.0),
                            child: _pickingType == FileType.custom
                                ? TextFormField(
                                    maxLength: 15,
                                    autovalidateMode: AutovalidateMode.always,
                                    controller: _controller,
                                    decoration: InputDecoration(
                                        labelText: 'File extension'),
                                    keyboardType: TextInputType.text,
                                    textCapitalization: TextCapitalization.none,
                                  )
                                : const SizedBox(),
                          ),
                        ),
                        SizedBox(height: 5),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 20.0),
                            child: Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () => _openFileExplorer(),
                                  child: Text("Open file picker"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        /* Center(
                          child: Builder(
                            builder: (BuildContext context) => _loadingPath
                                ? Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: const CircularProgressIndicator(),
                                  )
                                : _directoryPath != null
                                    ? ListTile(
                                        title: Text('Directory path'),
                                        subtitle: Text(_directoryPath),
                                      )
                                    : _paths != null
                                        ? Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 30.0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.50,
                                            child: Scrollbar(
                                                child: ListView.separated(
                                              itemCount: _paths != null &&
                                                      _paths.isNotEmpty
                                                  ? _paths.length
                                                  : 1,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final bool isMultiPath =
                                                    _paths != null &&
                                                        _paths.isNotEmpty;
                                                final String name =
                                                    'File $index: ' +
                                                        (isMultiPath
                                                            ? _paths
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList()[index]
                                                            : _fileName ??
                                                                '...');
                                                final path = _paths
                                                    .map((e) => e.path)
                                                    .toList()[index]
                                                    .toString();

                                                return ListTile(
                                                  title: Text(
                                                    "Name"+name,
                                                  ),
                                                  subtitle: Text(path),
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      const Divider(),
                                            )),
                                          )
                                        : const SizedBox(),
                          ),
                        ), */
                        SearchableDropdown<dynamic>.single(
                          //value: global.staff[0].fullName,
                            items: global.doc.map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.split('_')[0]),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                print(newValue);
                                staff.text = newValue.split('_')[0];
                                ID = newValue.split('_')[1];
                              });
                            },
                            iconSize: 24,
                            hint: Text('Please Select whom to send'),
                            isExpanded: true,
                            searchHint: new Text(
                              'Select ',
                              style: new TextStyle(fontSize: 20),
                            ),
                            icon: Icon(Icons.arrow_downward)),
                        SizedBox(height: 5),
                        SizedBox(height: 5),
                        Center(
                            child: InkWell(
                          onTap: () {
                            handleSubmit();
                          },
                          child: Text(
                            "Upload ",
                            style: TextStyle(
                                color: Color(0xffef4f4e),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: height / 4.5,
                width: width,
                color: Color(0xff14345e),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add File",
                          style: TextStyle(
                              color: Color(0xffef4f4e),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Upload the File",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
