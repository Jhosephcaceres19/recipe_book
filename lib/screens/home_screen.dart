import 'package:flutter/material.dart';
import 'package:project_restaurant/screens/recipe_detail.dart';

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
      isScrollControlled: true,
      builder: (contexto) => Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: Colors.white,
        child: RecipeForm(),
      ),
    );
  }

  Widget _RecipesCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipeName: 'lasania'),
          ),
        );
      },
      child: Padding(
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
      ),
    );
  }
}

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  // 1. Las llaves y controladores se declaran AQUÍ, fuera del build
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _recipeName = TextEditingController();
  final TextEditingController _recipeAuthor = TextEditingController();
  final TextEditingController _recipeIMG = TextEditingController();
  final TextEditingController _recipeDescription = TextEditingController();

  // Es una buena práctica limpiar los controladores para evitar fugas de memoria
  @override
  void dispose() {
    _recipeName.dispose();
    _recipeAuthor.dispose();
    _recipeIMG.dispose();
    _recipeDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding dinámico para que el teclado no tape el formulario
      padding: EdgeInsets.only(
        top: 12,
        left: 12,
        right: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 12,
      ),
      child: SingleChildScrollView(
        // Permite hacer scroll si el teclado es muy grande
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
            children: [
              Text(
                "Add new Recipe",
                style: TextStyle(color: Colors.deepOrange, fontSize: 20),
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: _recipeName,
                label: "Recipe Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name recipe';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _recipeAuthor,
                label: "Recipe Author",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' Please enter the author recipe';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _recipeIMG,
                label: "Image URL",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the image';
                  }
                  return null;
                },
              ),
              _buildTextField(
                maxLines: 4,
                label: "Description",
                controller: _recipeDescription,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter description";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Save Recipe',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
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
        controller: controller,
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }
}
