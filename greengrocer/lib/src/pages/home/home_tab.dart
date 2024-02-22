import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_shimmer.dart';
import 'package:greengrocer/src/pages/home/componets/category_tile.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/home/componets/item_tile.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  //Criando lista de categorias
  String selectedCategory = 'Frutas';

  //Chamando a chave global
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  //Criando uma nova função
  late Function(GlobalKey) runAddToCardAnimation;
  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  //Criando variável isLoading
  bool isLoading = true;

  //Ao carregar app
  @override
  void initState() {
    super.initState();

    //Tempo de carregamento da tela ao entrar no app
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppNameWidget(),
        //Botão Carrinho de compras
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        //duração da animação ao saltar da tela
        previewDuration: const Duration(milliseconds: 100),
        //animação da imagem saltando para o carrinho de compras
        previewCurve: Curves.ease,
        //ao clicar na imagem ela será direcionada ao carrinho
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCardAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            //Compo Pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  //Icone pesquisa
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            //Categorias
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: !isLoading
                  ? ListView.separated(
                      scrollDirection:
                          Axis.horizontal, //Indicando direção da lista
                      itemBuilder: (_, index) {
                        return CategoryTile(
                          onPressed: () {
                            setState(() {
                              selectedCategory = app_data.categories[index];
                            });
                          },
                          category: app_data.categories[index],
                          isSelected:
                              app_data.categories[index] == selectedCategory,
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(width: 10),
                      itemCount: app_data.categories.length,
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 12),
                          child: CustomShimmer(
                            height: 20,
                            width: 80,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
            ),

            //Grid - Produtos
            Expanded(
              child: !isLoading
                  ? GridView.builder(
                      //Espaçamento das grid/produtos
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: app_data.items
                          .length, //Apresentar quantidade de itens na tela
                      itemBuilder: (_, index) {
                        return ItemTile(
                            item: app_data.items[index],
                            cartAnimationMethod: itemSelectedCartAnimation);
                      },
                    )
                  : GridView.count(
                      //Espaçamento das grid/produtos
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(
                        10,
                        (index) => CustomShimmer(
                          height: double.infinity,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
