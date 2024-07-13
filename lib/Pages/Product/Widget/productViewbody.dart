import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o3d/o3d.dart';
import 'package:recsan/Pages/Product/Widget/productViewbody.dart';
import 'package:recsan/Pages/Product/Widget/produtnotfound.dart';
import 'package:recsan/Pages/ingredients/ingredients.dart';
import 'package:recsan/Statemanagment/ProductCubit.dart';
import 'package:recsan/const.dart';
import 'package:recsan/constance.dart';

class Productviewbody extends StatefulWidget {
  const Productviewbody({super.key,required this.barcodes});
final String barcodes;
  @override
  State<Productviewbody> createState() => _ProductviewbodyState();
}

class _ProductviewbodyState extends State<Productviewbody> {
  @override
  void initState() {
  print(widget.barcodes);
  print(widget.barcodes.startsWith('5000159'));
    super.initState();
  }
  double x=0;

  double y=0;

  double amplitude=0.3;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Productcubit, ProductState>(
      builder: (context, state) {
        var c = context.read<Productcubit>();
        if (state is Succ && c.product['status'] == 1) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              color: kPrimary,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppConstants.height55(context),
                      ),
                      (widget.barcodes.startsWith('544900')||widget.barcodes.startsWith('5449'))?
                      Image3D(context,'assets/Images/coca-cola_can__can_of_soda.glb'):
            (widget.barcodes.startsWith('5000159')||widget.barcodes.startsWith('590095')||widget.barcodes.startsWith('004000'))?
            Image3D(context,'assets/Images/snickers.glb')
             :   (widget.barcodes.startsWith('594')||widget.barcodes.startsWith('6223001361725')||widget.barcodes.startsWith('4060'))?
            Image3D(context,'assets/Images/pepsi_can.glb')
          : (widget.barcodes.startsWith('9016')||widget.barcodes.startsWith('9045')||widget.barcodes.startsWith('900')||widget.barcodes.startsWith('9037')||widget.barcodes.startsWith('9041'))?

            Image3D(context,'assets/Images/red_bull_energy_drink_can.glb'):
            (widget.barcodes.startsWith('6223001361732')||widget.barcodes.startsWith('8902080'))?

            Image3D(context,'assets/Images/7up_soda_can.glb'):
            (widget.barcodes.startsWith('074323')||widget.barcodes.startsWith('84126')||widget.barcodes.startsWith('7575280'))?

            Image3D(context,'assets/Images/takis_fuego_-_mexico.glb'):
            (widget.barcodes.startsWith('628557'))?

            Image3D(context,'assets/Images/Rita.glb'):

                      Align(
                          alignment: Alignment.center,
                          child:
                          Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()..rotateX(x)..rotateY(y),
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                if (y - details.delta.dx < 0) {
                                  setState(() {
                                    y = max(y - details.delta.dx / 100, -amplitude);
                                  });
                                }
                                else {
                                  setState(() {
                                    y = min(y - details.delta.dx / 100, amplitude);
                                  });
                                }
                                if (x + details.delta.dy < 0) {
                                  setState(() {
                                    x = max(x +details.delta.dy / 100, -amplitude);
                                  });
                                }
                                else {
                                  setState(() {
                                    x = min(x + details.delta.dy / 100, amplitude);
                                    //y
                                  });
                                }
                              },

                              child:
                           Image(
                                image:

                                NetworkImage(
                                    '${c.product['product']['image_url'] == null ? 'https://www.alamy.com/aggregator-api/download?url=https://c8.alamy.com/comp/AGJ5K6/choice-of-juices-and-soft-drinks-in-small-supermarket-north-london-AGJ5K6.jpg' : c.product['product']['image_url']}'),
                                height: AppConstants.height500(context),
                              ),
                            ),
                          )),
                      Expanded(child: SizedBox()),
                      Container(
                        height: AppConstants.height60(context),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xff6A8B85),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffAD6C48), blurRadius: 50)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: AppConstants.width90(context),
                              child: Image(
                                  image: NetworkImage(
                                      '${c.product['product']['image_url'] == null || c.product['product']['image_url'] == "" ? 'https://www.alamy.com/aggregator-api/download?url=https://c8.alamy.com/comp/AGJ5K6/choice-of-juices-and-soft-drinks-in-small-supermarket-north-london-AGJ5K6.jpg' : c.product['product']['image_url']}')),
                            ),
                            SizedBox(width: AppConstants.width20(context)),
                            SizedBox(
                                width: AppConstants.width80(context),
                                child:
                                (widget.barcodes.startsWith('5000159')||widget.barcodes.startsWith('590095')||widget.barcodes.startsWith('004000'))?
                                Text('Snickers'):
                                Text(
                                  "${c.product['product']['product_name'] == null || c.product['product']['product_name'] == "" ? 'name not found' : c.product['product']['product_name']}",
                                  style: const TextStyle(
                                      color: Color(0xff4E4D4D), fontSize: 15),
                                )),
                            SizedBox(width: AppConstants.width20(context)),
                            bottmNavigation(widget: widget, c: c)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.height30(context),
                      )
                    ]),
              ));
        }
        else {

          return const notFound();
        }
      },
    );
  }

  SizedBox Image3D(BuildContext context,String path) {
    return SizedBox(
              height: AppConstants.height500(context),
              child: O3D.asset(
                src:path,

              ));
  }
}

class bottmNavigation extends StatelessWidget {
  const bottmNavigation({
    super.key,
    required this.widget,
    required this.c,
  });

  final Productviewbody widget;
  final Productcubit c;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ingredients(

                  ingredients:
                  (widget.barcodes.startsWith('5000159')||widget.barcodes.startsWith('590095')||widget.barcodes.startsWith('004000'))?
                  'Milk chocolate (sugar, cocoa butter, chocolate, skim milk, lactose, milkfat, soy lecithin, artificial flavor), peanuts, corn syrup, sugar, palm oil, skim milk, lactose, salt, egg whites, artificial flavor.':
                  (widget.barcodes.startsWith('628557'))?
                  "Rita Mixed Berry Glass: Strawberries, blueberries, raspberries and blackberries combine to create a refreshing flavor1Rita Mojito Cans: Inspired by the classic mojito drink.Rita Blue Cans: Comes in blue flavour.Rita Berry Cans: Contains a mix of berries.Rita Mojito Cans: Inspired by the Mojito drink.Rita Cherry Soft Drink: Offers cherry flavour.Rita Cranberry Cans: Contains cranberry flavour.Rita Red Grape Strawberry Tutti Frutti White Grape: A Variety of Distinctive Flavors1"
               :(widget.barcodes.startsWith('594')||widget.barcodes.startsWith('62230')||widget.barcodes.startsWith('4060'))?
                  '(RO) Ingrediente:  apă, zahăr, dioxid de carbon, colorant (caramel cu sulfat de amoniu), arome (conțin cofeină), acidifiat (acid fosforic), îndulcitor (acesulfam K, sucraloză)':
                  c.product['product'][
                  'ingredients_text'] ==
                      null ||
                      c.product['product'][
                      'ingredients_text'] ==
                          ''
                      ? 'Sorry,\n there is not enough data\n for this product'
                      : c.product['product']
                  ['ingredients_text']),
            ));
      },
      child: Container(
        height: AppConstants.height50(context),
        width: AppConstants.width250(context),
        decoration: BoxDecoration(
            color: const Color(0xff345A53),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: AppConstants.width10(context)),
            SizedBox(
                width: AppConstants.width80(context),
                child:
                const Text("Read the ingredients")),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ingredients(

                            ingredients:
                            (widget.barcodes.startsWith('5000159')||widget.barcodes.startsWith('590095')||widget.barcodes.startsWith('004000'))?
                            'Milk chocolate (sugar, cocoa butter, chocolate, skim milk, lactose, milkfat, soy lecithin, artificial flavor), peanuts, corn syrup, sugar, palm oil, skim milk, lactose, salt, egg whites, artificial flavor.':
                            (widget.barcodes.startsWith('594')||widget.barcodes.startsWith('62230')||widget.barcodes.startsWith('4060'))?
                            '(RO) Ingrediente:  apă, zahăr, dioxid de carbon, colorant (caramel cu sulfat de amoniu), arome (conțin cofeină), acidifiat (acid fosforic), îndulcitor (acesulfam K, sucraloză)':
                            c.product['product'][
                            'ingredients_text'] ==
                                null ||
                                c.product['product'][
                                'ingredients_text'] ==
                                    ''
                                ? 'Sorry,\n there is not enough data\n for this product'
                                : c.product['product']
                            ['ingredients_text']),
                      ));
                           },
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}