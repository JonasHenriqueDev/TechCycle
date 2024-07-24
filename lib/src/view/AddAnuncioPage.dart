import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techcycle/src/provider/anuncio_provider.dart';

class AddAdPage extends StatefulWidget {
  @override
  _AddAdPageState createState() => _AddAdPageState();
}

class _AddAdPageState extends State<AddAdPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Anúncio'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Preço',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um preço';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final String title = _titleController.text;
                    final String description = _descriptionController.text;
                    final double price = double.tryParse(_priceController.text) ?? 0.0;

                    // Adiciona o novo anúncio usando o AnuncioProvider
                    Provider.of<AnuncioProvider>(context, listen: false)
                        .addAnuncio(title, description, price);

                    Navigator.pop(context); // Retorna à página anterior
                  }
                },
                child: Text('Adicionar Anúncio'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
