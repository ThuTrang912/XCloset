import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'constants.dart'; // Import your API constants file

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _drawerNameController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    try {
      var uri = Uri.parse('http://127.0.0.1:8000/api/items');

      var request = http.MultipartRequest("POST", uri);
      request.fields['id'] = _idController.text;
      request.fields['drawer_name'] = _drawerNameController.text;
      request.fields['item_name'] = _itemNameController.text;

      if (_image != null) {
        try {
          var length = await _image!.length();
          var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
          var multipartFile = http.MultipartFile(
            'image',
            stream,
            length,
            filename: basename(_image!.path),
          );
          request.files.add(multipartFile);
        } catch (e) {
          print('Error handling image file: $e');
        }
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Uploaded!');
      } else {
        print('Upload failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during form submission: $e');
    }
  }

  Widget _buildImageWidget() {
    if (kIsWeb) {
      return _image != null
          ? Image.network(_image!.path) // Show selected image on web
          : Image.asset('images/logo.png'); // Show placeholder image on web
    } else {
      return _image != null
          ? Image.file(_image!) // Show selected image on mobile
          : Text('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Input'),
      ),
      body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _drawerNameController,
              decoration: InputDecoration(labelText: 'Drawer Name'),
            ),
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            SizedBox(height: 20),
            _buildImageWidget(),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Capture Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    ));
  }
}