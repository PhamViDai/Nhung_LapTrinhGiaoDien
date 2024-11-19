import 'package:flutter/material.dart';

class FormControl extends StatefulWidget {
  const FormControl({super.key});
  @override
  FormControl1 createState() => FormControl1();
}

class FormControl1 extends State<FormControl> {
  final Color lightBlue = Colors.lightBlue.shade100;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Container(
        color: Colors.blue[100] ?? Colors.blue,
        child: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.control_camera,
                          color: Color.fromARGB(255, 130, 140, 118),
                        ),
                        const SizedBox(width: 10),
                        // Removed 'const' to make it dynamic for scaling
                        Expanded(
                          child: Text(
                            'Control',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          // Row for Temperature with Button in same row
                          Row(
                            children: [
                              const Icon(
                                Icons.thermostat,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: const Text(
                                  'Temperature (℃):',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                      Text('Nhiệt độ bây giờ là 32 độ'),
                                    ),
                                  );
                                },
                                child: const Text('Check'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Row for Operating Status with Checkbox in same row
                          Row(
                            children: [
                              const Icon(
                                Icons.broadcast_on_personal_outlined,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: const Text(
                                  'Check the operating status:',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              const CheckboxWidget(),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Row for Light with Slider below text
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.lightbulb,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: const Text(
                                  'Light (lx):',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Slider is placed below the text for light
                          const SliderWidget(),
                          const SizedBox(height: 40),
                          // Row for Pressure Measurement with Dropdown in same row
                          Row(
                            children: [
                              const Icon(
                                Icons.unfold_more_outlined,
                                color: Colors.purple,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: const Text(
                                  'Pressure Measurement Unit:',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              const DropdownWidget(),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Row for Activating sea breeze with Switch in same row
                          Row(
                            children: [
                              const Icon(
                                Icons.notifications_active_outlined,
                                color: Colors.redAccent,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: const Text(
                                  'Activating the sea breeze:',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              const SwitchWidget(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          isChecked = newValue ?? false;
        });
      },
    );
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue = 'atm';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      items: <String>['atm', 'Torr', 'psi', 'Pa', 'Bar']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double sliderValue = 31;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderValue,
      min: 0,
      max: 100,
      divisions: 100,
      label: sliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          sliderValue = value;
        });
      },
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (bool newValue) {
        setState(() {
          isSwitched = newValue;
        });
      },
      activeColor: Colors.redAccent,
    );
  }
}