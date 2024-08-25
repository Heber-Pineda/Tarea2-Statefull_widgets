import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Aritméticas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _selectedOperation = 'Suma';
  double _result = 0.0;
  String _statusText1 = '';
  String _statusText2 = '';

  void _calculate() {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;

    switch (_selectedOperation) {
      case 'Suma':
        setState(() {
          _result = num1 + num2;
        });
        break;
      case 'Resta':
        setState(() {
          _result = num1 - num2;
        });
        break;
      case 'Multiplicación':
        setState(() {
          _result = num1 * num2;
        });
        break;
      case 'División':
        setState(() {
          _result = num2 != 0 ? num1 / num2 : 0.0;
        });
        break;
    }

    setState(() {
      _statusText1 = 'Valor correcto';
      _statusText2 = 'Valor correcto';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operaciones Aritméticas'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField('Ingrese el primer valor', _controller1, _statusText1),
            _buildInputField('Ingrese el segundo valor', _controller2, _statusText2),
            _buildDropdown(),
            _buildResultField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, String statusText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.purple), // Contorno morado
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.purple), // Contorno morado
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.purple, width: 2.0), // Contorno morado más grueso al enfocar
            ),
          ),
        ),
        Text(statusText, style: const TextStyle(color: Colors.green)),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Seleccione la operación'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.purple), // Contorno morado
          ),
          child: DropdownButton<String>(
            value: _selectedOperation,
            isExpanded: true,
            underline: Container(), // Eliminar la línea inferior predeterminada del DropdownButton
            items: ['Suma', 'Resta', 'Multiplicación', 'División']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedOperation = newValue!;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildResultField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Total'),
        TextField(
          readOnly: true,
          controller: TextEditingController(text: _result.toString()),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.purple), // Contorno morado
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.purple), // Contorno morado
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.purple, width: 2.0), // Contorno morado más grueso al enfocar
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}



