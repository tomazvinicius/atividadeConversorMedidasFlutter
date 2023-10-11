import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String category = 'Comprimento';
  double inputValue = 0.0;
  double result = 0.0;

  final Map<String, Map<String, double>> conversions = {
    'Comprimento': {
      'Metro': 1.0,
      'Centímetro': 100.0,
      'Milímetro': 1000.0,
    },
    'Massa': {
      'Quilograma': 1.0,
      'Grama': 1000.0,
      'Miligrama': 1000000.0,
    },
    'Tempo': {
      'Segundo': 1.0,
      'Minuto': 1 / 60,
      'Hora': 1 / 3600,
    },
  };

  List<String> categories = ['Comprimento', 'Massa', 'Tempo'];
  List<String> units = [];
  String selectedUnit = '';

  @override
  void initState() {
    super.initState();
    units = conversions[category]!.keys.toList();
    selectedUnit = units[0];
  }

  void calculateResult() {
    setState(() {
      result = inputValue * conversions[category]![selectedUnit]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,  // Define a cor do AppBar para roxo
        title: Text('Conversor Universal de Unidades'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: category,
                onChanged: (String? newCategory) {
                  setState(() {
                    category = newCategory!;
                    units = conversions[category]!.keys.toList();
                    selectedUnit = units[0];
                  });
                },
                items: categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              DropdownButton<String>(
                value: selectedUnit,
                onChanged: (String? newUnit) {
                  setState(() {
                    selectedUnit = newUnit!;
                  });
                },
                items: units.map((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    inputValue = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Valor a ser convertido',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: calculateResult,
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,  // Cor do botão para roxo
                ),
                child: Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              if (result != 0.0)
                Text(
                  'Resultado: $result',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
