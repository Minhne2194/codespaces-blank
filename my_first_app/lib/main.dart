import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo CSE702027-1-1-26(N05): Mobile Programming'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 1. Hàm Lambda (Hàm mũi tên) tính năm sinh 
  int _calculateBirthYear(int currentAge) => 2026 - currentAge;

  // 2. Thuật toán sắp xếp "code chay" (Bubble Sort) thay vì dùng .sort()
  // Ứng dụng cấu trúc lặp for và điều kiện if
  List<String> _manualSort(List<String> inputList) {
    List<String> list = List.from(inputList); 
    for (int i = 0; i < list.length - 1; i++) {
      for (int j = 0; j < list.length - i - 1; j++) {
        if (list[j].compareTo(list[j + 1]) > 0) {
          // Hoán đổi vị trí (Swap)
          String temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // 3. Khai báo Biến và Kiểu dữ liệu cơ bản
    int age = 22;
    String name = "Dương Công Minh";
    bool isMale = true;
    
    // Hằng số
    const double gpaGoal = 3.8;

    // 4. Kiểu Map lưu thông tin sinh viên
    var info = {
      'MaSV': '222010009', 
      'Lop': 'K16-CNTT_3',
      'Truong': 'Phenikaa University'
    };

    // 5. Kiểu List lưu danh sách môn học
    var subjects = [
      'Lập trình Mobile', 
      'Cấu trúc dữ liệu', 
      'Mạng máy tính', 
      'Trí tuệ nhân tạo'
    ];

    // Áp dụng hàm code chay để sắp xếp List môn học theo bảng chữ cái
    var sortedSubjects = _manualSort(subjects);

    // Toán tử điều kiện (Ternary operator)
    String genderText = isMale ? "Nam" : "Nữ";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Sử dụng SingleChildScrollView để tránh lỗi tràn màn hình khi nội dung dài
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phần Counter mặc định của Flutter
              const Center(
                child: Text('You have pushed the button this many times:'),
              ),
              Center(
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              
              const Divider(height: 40, thickness: 2),

              // Phần áp dụng kiến thức Tuần 2
              const Text(
                '1. Thông tin sinh viên (Variables & Data Types):', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)
              ),
              const SizedBox(height: 8),
              Text('Họ và tên: $name'),
              Text('Giới tính: $genderText'),
              Text('Tuổi: $age -> Năm sinh (Lambda): ${_calculateBirthYear(age)}'),
              Text('Mục tiêu GPA: $gpaGoal'),
              
              const SizedBox(height: 20),
              
              const Text(
                '2. Thông tin học tập (Map):', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)
              ),
              const SizedBox(height: 8),
              Text('Mã SV: ${info['MaSV']}'),
              Text('Lớp: ${info['Lop']} - Trờng: ${info['Truong']}'),
              
              const SizedBox(height: 20),
              
              const Text(
                '3. Danh sách môn học (List + Vòng lặp For + Code chay Sắp xếp):', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)
              ),
              const SizedBox(height: 8),
              // 6. Cấu trúc lặp for duyệt qua List đã sắp xếp
              for (var subject in sortedSubjects)
                Text('• $subject'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}