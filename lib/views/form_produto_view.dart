import 'package:flutter/material.dart';

class FormProdutoView extends StatefulWidget {
  const FormProdutoView({super.key});

  @override
  State<FormProdutoView> createState() => _FormProdutoViewState();
}

class _FormProdutoViewState extends State<FormProdutoView> {
  final _precoFocus = FocusNode();
  final _descricaoFocus = FocusNode();
  final _imgUrlFocuus = FocusNode();
  final _imgUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imgUrlFocuus.addListener(atualizaImagem);
  }

  @override
  void dispose() {
    super.dispose();
    _precoFocus.dispose();
    _descricaoFocus.dispose();
    _imgUrlFocuus.removeListener(atualizaImagem);
    _imgUrlFocuus.dispose();
  }

  void atualizaImagem() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FORMULÁRIO DE PRODUTO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_precoFocus),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Preço',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                textInputAction: TextInputAction.next,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                focusNode: _precoFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descricaoFocus),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                textInputAction: TextInputAction.next,
                focusNode: _descricaoFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descricaoFocus),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Url da Imagem',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      textInputAction: TextInputAction.done,
                      focusNode: _imgUrlFocuus,
                      keyboardType: TextInputType.url,
                      controller: _imgUrlController,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                    alignment: Alignment.center,
                    child: _imgUrlController.text.isEmpty
                        ? Text(
                            'informe a Url',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imgUrlController.text),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
