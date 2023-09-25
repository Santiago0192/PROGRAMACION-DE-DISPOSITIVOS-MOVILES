import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  final String imageUrl;
  final String food;
  final int index;

  Page2({required this.imageUrl, required this.food, required this.index});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool fav = false;
  String message = '';

  final List<List<String>> ingredients = [
    ['1 1/2 cups panko breadcrumbs', '1 egg', '2 tbsp flour', '500 g/1 lb chicken tenderloins'],
    ['3 tablespoons olive oil', '1 small onion, chopped', '2 skinless, boneless chicken breast', '1 tablespoon tomato paste'],
    ['1/3 cup plain flour','2 eggs','2 cups fresh multi-grain breadcrumbs','1 lemon, rind finely grated','1/2 cup grated parmesan cheese','800g chicken tenderloins, tendons removed, trimmed',],
    ['1 tbsp olive oil','1 brown onion, chopped','2 garlic cloves, crushed','1 x 800g can Italian diced tomatoes','1 tbsp tomato paste','400g Cucina Matese Penne Rigate Italian Pasta',],
  ];

  final List<List<String>> steps = [
    ['Preheat oven to 200C/390F.', 'Spread panko on a baking tray, spray with oil (spray vertically to avoid blowing the panko off the tray), then bake for 3 to 5 minutes until light golden. Transfer to bowl.', 'Place the Batter ingredients in a bowl and whisk with a fork until combined.', 'Add the chicken into the Batter and toss to coat.'],
    ['Heat olive oil in a skillet over medium heat. Saut� onion until lightly browned.', 'Stir in garlic, curry powder, cinnamon, paprika, bay leaf, ginger, sugar, and salt. Continue stirring for 2 minutes.', 'Add chicken pieces, tomato paste, yogurt, and coconut milk. Bring to a boil, reduce heat, and simmer for 20 to 25 minutes.', 'Remove bay leaf, and stir in lemon juice and cayenne pepper. Simmer 5 more minutes.'],
    ['Preheat oven to 130C. Combine flour and salt and pepper on a large plate. Lightly whisk eggs in a shallow dish. Combine breadcrumbs, lemon rind, parmesan, parsley and salt and pepper in a separate shallow dish.','Lightly coat chicken in seasoned flour, shaking off excess, then dip in egg, then breadcrumb mixture, pressing crumbs on gently with your fingertips to coat.','Add oil to a large frying pan so it is 1cm deep. Heat over medium-high heat until sizzling. Cook chicken, in batches, for 2 minutes each side or until just cooked through. Transfer to a baking tray and keep warm in oven.','Serve chicken with mashed potato, green beans and lemon wedges.'],
    ['Heat the oil in a large frying pan over medium heat. Add the onion and cook, uncovered, stirring often, for 3 minutes or until it softens slightly. Add the garlic and cook, stirring, for 1 minute or until aromatic.','Stir in the tomatoes and tomato paste. Increase heat to high and bring to the boil. Reduce heat to medium and simmer, uncovered, stirring often, for 6-7 minutes or until the sauce reduces and thickens slightly.','Stir in the parsley and sugar. Taste and season with salt and pepper.','Meanwhile, cook the pasta in a large saucepan of salted boiling water following packet directions or until al dente. Drain and return to the pan.'],
  ];

  final List<bool> favs = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    final foodIngredients = ingredients[widget.index];
    final foodSteps = steps[widget.index];
    final fav = favs[widget.index];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 23, 23),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 23, 23),
        title: Text(widget.food),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              fav ? Icons.star : Icons.star_border
              ), 
            onPressed: () {
              setState(() {
                favs[widget.index] = !favs[widget.index];
                message = favs[widget.index] ? 'Added To Favorites' : 'Removed From Favorites';
              });
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.imageUrl),
            const SizedBox(height: 15.0),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Color.fromARGB(255, 219, 149, 108),
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: foodIngredients.map((ingredient) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    ingredient,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Steps',
              style: TextStyle(
                color: Color.fromARGB(255, 219, 149, 108),
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: foodSteps.map((step) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}