import 'package:tab_container/tab_container.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Form_Control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabContainer(
            color: Colors.blue[100] ?? Colors.blue,
            tabEdge: TabEdge.right,
            childPadding: const EdgeInsets.all(20.0),
            tabs: _getTabs3(context),
            children: _getChildren3(context),
          ),
        ),
      ),
    );
  }
}

List<Widget> _getTabs3(BuildContext context) => <Widget>[
  const Icon(Icons.info),
  const Icon(Icons.text_snippet),
  const Icon(Icons.analytics),
  const Icon(Icons.menu),
];

List<Widget> _getChildren3(BuildContext context) => <Widget>[
  // Tab Info
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Information', style: Theme.of(context).textTheme.headlineSmall),
      // Settings tab
      const Expanded(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.thermostat, color: Colors.blue, size: 13),
              title: Text('Temperature (32°C)'),
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny, color: Colors.orange, size: 13),
              title: Text('Light (400 lx)'),
            ),
            ListTile(
              leading:
              Icon(Icons.water_drop, color: Colors.green, size: 13),
              title: Text('Humidity (60 %RH)'),
            ),
            ListTile(
              leading: Icon(Icons.compress, color: Colors.purple, size: 13),
              title: Text('Pressure (1 atm)'),
            ),
            ListTile(
              leading: Icon(Icons.speed, color: Colors.red, size: 13),
              title: Text('Acceleration (9.8 m/s²)'),
            )
          ],
        ),
      ),
    ],
  ),
  // Tab Documents
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: FormControl()),
    ],
  ),
  SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.insights, color: Colors.blue),
              const SizedBox(width: 8),
              Text('Thống kê',
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 20),

          // Biểu đồ tròn với ký hiệu
          Column(
            children: [
              SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 20,
                        color: Colors.blue,
                        title: '20%',
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Colors.orange,
                        title: '20%',
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Colors.green,
                        title: '20%',
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Colors.purple,
                        title: '20%',
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Colors.red,
                        title: '20%',
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pie_chart, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Text('Biểu đồ tròn',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat, color: Colors.blue, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.circle, color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      Text('Nhiệt độ', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.orange, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.circle, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text('Ánh sáng', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.water_drop, color: Colors.green, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.circle, color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      Text('Độ ẩm', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.compress, color: Colors.purple, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.circle, color: Colors.purple, size: 16),
                      const SizedBox(width: 4),
                      Text('Áp suất', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.speed, color: Colors.red, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.circle, color: Colors.red, size: 16),
                      const SizedBox(width: 4),
                      Text('Gia tốc', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
// Biểu đồ cột với ký hiệu
          Column(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(x: 0, barsSpace: 10, barRods: [
                        BarChartRodData(
                          y: 30,
                          colors: [Colors.blue],
                          width: 20,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]),
                      BarChartGroupData(x: 1, barsSpace: 10, barRods: [
                        BarChartRodData(
                          y: 25,
                          colors: [Colors.orange],
                          width: 20,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]),
                      BarChartGroupData(x: 2, barsSpace: 10, barRods: [
                        BarChartRodData(
                          y: 20,
                          colors: [Colors.green],
                          width: 20,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]),
                      BarChartGroupData(x: 3, barsSpace: 10, barRods: [
                        BarChartRodData(
                          y: 15,
                          colors: [Colors.purple],
                          width: 20,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]),
                      BarChartGroupData(x: 4, barsSpace: 10, barRods: [
                        BarChartRodData(
                          y: 10,
                          colors: [Colors.red],
                          width: 20,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        interval: 5, // Khoảng cách số trên trục trái
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Nhiệt độ';
                            case 1:
                              return 'Ánh sáng';
                            case 2:
                              return 'Độ ẩm';
                            case 3:
                              return 'Áp suất';
                            case 4:
                              return 'Gia tốc';
                            default:
                              return '';
                          }
                        },
                        rotateAngle: 45, // Xoay tên cột 45 độ
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Tên và icon dưới biểu đồ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bar_chart, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Text('Biểu đồ cột',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),

              // Ký hiệu dưới biểu đồ
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat, color: Colors.blue, size: 13),
                      const SizedBox(width: 4),
                      Container(width: 16, height: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text('Nhiệt độ', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.orange, size: 13),
                      const SizedBox(width: 4),
                      Container(
                          width: 16, height: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text('Ánh sáng', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.water_drop, color: Colors.green, size: 13),
                      const SizedBox(width: 4),
                      Container(width: 16, height: 16, color: Colors.green),
                      const SizedBox(width: 4),
                      Text('Độ ẩm', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.compress, color: Colors.purple, size: 13),
                      const SizedBox(width: 4),
                      Container(
                          width: 16, height: 16, color: Colors.purple),
                      const SizedBox(width: 4),
                      Text('Áp suất', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.speed, color: Colors.red, size: 13),
                      const SizedBox(width: 4),
                      Container(width: 16, height: 16, color: Colors.red),
                      const SizedBox(width: 4),
                      Text('Gia tốc', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),

// Biểu đồ đường với ký hiệu
          Column(
            children: [
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      // Nhiệt độ
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 30),
                          FlSpot(1, 32),
                          FlSpot(2, 29),
                          FlSpot(3, 35),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        colors: [Colors.blue],
                      ),
                      // Ánh sáng
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 25),
                          FlSpot(1, 28),
                          FlSpot(2, 26),
                          FlSpot(3, 27),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        colors: [Colors.orange],
                      ),
                      // Độ ẩm
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 20),
                          FlSpot(1, 18),
                          FlSpot(2, 22),
                          FlSpot(3, 21),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        colors: [Colors.green],
                      ),
                      // Áp suất
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 15),
                          FlSpot(1, 16),
                          FlSpot(2, 14),
                          FlSpot(3, 15),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        colors: [Colors.purple],
                      ),
                      // Gia tốc
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 10),
                          FlSpot(1, 12),
                          FlSpot(2, 11),
                          FlSpot(3, 13),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        colors: [Colors.red],
                      ),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        interval: 5, // Khoảng cách số trên trục trái
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'T1';
                            case 1:
                              return 'T2';
                            case 2:
                              return 'T3';
                            case 3:
                              return 'T4';
                            default:
                              return '';
                          }
                        },
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 5, // Khoảng cách số ngang
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Tên và icon dưới biểu đồ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.show_chart, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Text('Biểu đồ đường',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),

              // Ký hiệu dưới biểu đồ
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat, color: Colors.blue, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.horizontal_rule,
                          color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      Text('Nhiệt độ', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.orange, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.horizontal_rule,
                          color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text('Ánh sáng', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.water_drop, color: Colors.green, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.horizontal_rule,
                          color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      Text('Độ ẩm', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.compress, color: Colors.purple, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.horizontal_rule,
                          color: Colors.purple, size: 16),
                      const SizedBox(width: 4),
                      Text('Áp suất', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.speed, color: Colors.red, size: 13),
                      const SizedBox(width: 4),
                      Icon(Icons.horizontal_rule,
                          color: Colors.red, size: 16),
                      const SizedBox(width: 4),
                      Text('Gia tốc', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),

  // Tab Menu với các tab con
  SizedBox(
    height: double.infinity,
    child: DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Menu', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Group info',),
              Tab(text: 'Software info'),
              Tab(text: 'Profile'),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.groups),
                        title: Text('Tên Nhóm: VĨ ĐẠI'),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Số Lượng Thành Viên: 6 người'),
                      ),
                      ListTile(
                        leading: Icon(Icons.book),
                        title: Text(
                            'Nhóm được lập ra với mục tiêu hoàn thành đồ án quy mô nhỏ môn lập trình nhúng'),
                      ),
                      ListTile(
                        leading: Icon(Icons.person_4),
                        title: Text('Giáo Viên: Thầy Lữ Cao Tiến'),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.mobile_friendly),
                        title: Text('Team Vĩ Đại Application'),
                      ),
                      ListTile(
                        leading: Icon(Icons.folder),
                        title: Text(
                            'Giới Thiệu: Ứng dụng sẽ có ba chức năng chính là theo dõi 5 chỉ số, điều khiển 5 thông tin cũng như lập bản thống kê với nhiều kiểu biểu đồ dựa trên 5 chỉ số đó'),
                      ),
                      ListTile(
                        leading: Icon(Icons.folder),
                        title:
                        Text('Các Công Cụ: Visual Studio Code, GitHub'),
                      ),
                      ListTile(
                        leading: Icon(Icons.copyright),
                        title: Text('Team Vĩ Đại'),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Phạm Vĩ Đại - 0306221010'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Trịnh Phúc Hậu - 0306221019'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Đinh Xuân Hoàng - 0306221022'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Trần Quốc Bảo - 0306221003'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Phạm Thị Thu Hiền - 0306221021'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Huỳnh Minh Ngọc - 0306221499'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
];