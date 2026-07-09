import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[_RecipesCard(context), _RecipesCard(context)],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showBottom(context);
        },
      ),
    );
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (contexto) => Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: Colors.white,
        child: RecipeForm(),
      ),
    );
  }

  Widget _RecipesCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          color: const Color.fromARGB(255, 255, 139, 7),
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 100,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(12),
                //   color: Colors.blue,
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://static.platzi.com/media/uploads/flutter_lasana_b894f1aee1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 26),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Lasania",
                    style: TextStyle(fontSize: 20, fontFamily: "Quicksand"),
                  ),
                  SizedBox(height: 4),
                  Container(height: 2, width: 75, color: Colors.deepOrange),
                  SizedBox(height: 4),
                  Text("Jhoseph C"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _recipeName = TextEditingController();
    final TextEditingController _recipeAuthor = TextEditingController();
    final TextEditingController _recipeIMG = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add new Recipe",
              style: TextStyle(color: Colors.deepOrange, fontSize: 20),
            ),
            SizedBox(height: 16),
            _buildTextField(controller: _recipeName, label: "Recipe Name"),
            _buildTextField(controller: _recipeAuthor, label: "Recipe Author"),
            _buildTextField(controller: _recipeIMG, label: "Image URL"),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: "Quicksand",
            color: Colors.deepOrange,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
