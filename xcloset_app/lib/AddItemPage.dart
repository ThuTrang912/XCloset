import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:xcloset/MyHomePage.dart';

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
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_idController.text.isEmpty || _drawerNameController.text.isEmpty || _itemNameController.text.isEmpty || _image == null) {
      // Hiển thị thông báo lỗi nếu có trường trống
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields and select an image.')));
      return;
    }

    setState(() {
      _isLoading = true; // Bắt đầu tải lên
    });

    try {
      var uri = Uri.parse('http://127.0.0.1:8000/api/items/upload');

      var request = http.MultipartRequest("POST", uri);
      request.fields['id'] = _idController.text;
      request.fields['drawer_name'] = _drawerNameController.text;
      request.fields['item_name'] = _itemNameController.text;

      if (_image != null) {
        var length = await _image!.length();
        var stream = http.ByteStream(_image!.openRead().cast());
        var multipartFile = http.MultipartFile(
          'image',
          stream,
          length,
          filename: p.basename(_image!.path),
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        print('Uploaded successfully!');
        print('Response body: $responseBody');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      } else {
        print('Upload failed with status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload failed!')));
      }
    } catch (e) {
      print('Error during form submission: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred!')));
    } finally {
      setState(() {
        _isLoading = false; // Kết thúc tải lên
      });
    }
  }

  Widget _buildImageWidget() {
    if (kIsWeb) {
      return _image != null
          ? Image.network(_image!.path)
          : Image.asset('images/logo.png');
    } else {
      return _image != null
          ? Image.file(_image!)
          : Text('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Input'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                keyboardType: TextInputType.text,
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
              _isLoading
                  ? CircularProgressIndicator() // Hiển thị vòng xoay tải
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
