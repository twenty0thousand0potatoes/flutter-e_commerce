import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';

class SDummyData {
  //Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: SImages.banner1, targetScreen: SRoutes.order, active: false),
    BannerModel(
        imageUrl: SImages.banner2,
        targetScreen: SRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: SImages.banner3,
        targetScreen: SRoutes.userProfile,
        active: true),
    BannerModel(
        imageUrl: SImages.banner4, targetScreen: SRoutes.store, active: true),
    BannerModel(
        imageUrl: SImages.banner5,
        targetScreen: SRoutes.productDetail,
        active: true),
    BannerModel(
        imageUrl: SImages.banner6,
        targetScreen: SRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: SImages.banner7,
        targetScreen: SRoutes.allProducts,
        active: true),
    BannerModel(
        imageUrl: SImages.banner8,
        targetScreen: SRoutes.favourites,
        active: false),
    BannerModel(
        imageUrl: SImages.banner9, targetScreen: SRoutes.cart, active: true),
  ];

  static final List<CategoryModel> categories = [
    //Featured categories
    CategoryModel(
        id: '1',
        name: 'Оружие',
        image: SImages.allWeaponsIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Аксессуары',
        image: SImages.accessoriesIcon,
        isFeatured: true),
    CategoryModel(
        id: '4',
        name: 'Снаряжение',
        image: SImages.equipmentIcon,
        isFeatured: true),
    CategoryModel(
        id: '7', name: 'Форма', image: SImages.uniformIcon, isFeatured: true),
    CategoryModel(
        id: '9',
        name: 'Защита',
        image: SImages.protectionIcon,
        isFeatured: true),
    CategoryModel(
        id: '12', name: 'Прочее', image: SImages.patchesIcon, isFeatured: true),

    //Sub categories
    CategoryModel(
        id: '3',
        name: 'Штурмовые винтовки',
        image: SImages.assaultRifleIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '6',
        name: 'Пулеметы',
        image: SImages.allWeaponsIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '8',
        name: 'Пистолеты',
        image: SImages.pistolIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Снайперские винтовки',
        image: SImages.sniperRifleIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '11',
        name: 'Пистолет-пулеметы',
        image: SImages.submachineIcon,
        parentId: '1',
        isFeatured: false),

    CategoryModel(
        id: '13',
        name: 'Обувь',
        image: SImages.footwearIcon,
        parentId: '7',
        isFeatured: false),

    CategoryModel(
        id: '5',
        name: 'Знаки различия',
        image: SImages.insigniaIcon,
        parentId: '12',
        isFeatured: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'AK-74',
        stock: 15,
        price: 275,
        isFeatured: true,
        thumbnail: SImages.ak74thumb,
        description: 'AK-74',
        brand: BrandModel(
            id: '1',
            name: 'KENWOOD',
            image: SImages.kenwoodLogo,
            productCount: 256,
            isFeatured: true),
        images: [SImages.ak74thumb, SImages.ak74, SImages.ak742, SImages.ak743],
        salePrice: 230,
        sku: 'ZXC7481',
        categoryId: '3',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Black', 'Brown']),
          ProductAttributeModel(name: 'Mod', values: ['AK-74', 'AKS-74', 'AKSM-74']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            stock: 34,
            price: 240,
            salePrice: 230,
            image: SImages.ak74,
            description: 'AK-74 description',
            attributeValues: {'Color': 'Brown', 'Mod': 'AK-74'},
          ),
          ProductVariationModel(
            id: '2',
            stock: 34,
            price: 240,
            image: SImages.ak742,
            description: 'AK-74 description 2',
            attributeValues: {'Color': 'Black', 'Mod': 'AKS-74'},
          ),
          ProductVariationModel(
            id: '3',
            stock: 34,
            price: 300,
            image: SImages.ak743,
            description: 'AK-74 description 2',
            attributeValues: {'Color': 'Brown', 'Mod': 'AKSM-74'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '002',
        title: 'ГП-5',
        stock: 15,
        price: 25,
        salePrice: 20,
        isFeatured: true,
        thumbnail: SImages.gp5,
        description: 'ГП-5',
        brand: BrandModel(
            id: '2',
            name: 'ХЗ',
            image: SImages.acerlogo,
            productCount: 256,
            isFeatured: true),
        images: [SImages.gp5, SImages.gasMask],
        sku: 'KDD4846',
        categoryId: '9',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['1', '2', '3']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '003',
        title: 'MP-5',
        stock: 15,
        price: 150,
        isFeatured: true,
        thumbnail: SImages.mp5Thumb,
        description: 'MP-5',
        brand: BrandModel(
            id: '3',
            name: 'Dragon',
            image: SImages.jordanLogo,
            productCount: 30,
            isFeatured: true),
        images: [SImages.mp5Thumb, SImages.mp5Thumb],
        sku: 'DOS2603',
        categoryId: '11',
        productType: 'ProductType.single'),
    ProductModel(
        id: '004',
        title: 'Plate-Carrier',
        stock: 5,
        price: 100,
        isFeatured: true,
        thumbnail: SImages.bodyaAmorThumb,
        description: 'Plate-Carrier description',
        brand: BrandModel(
            id: '4',
            name: 'WarTech',
            image: SImages.robotlogo,
            productCount: 102,
            isFeatured: true),
        images: [SImages.bodyaAmorThumb, SImages.bodyaAmorThumb],
        sku: 'MSO9523',
        categoryId: '9',
        productType: 'ProductType.single'),
    ProductModel(
        id: '005',
        title: 'Colt-1911',
        stock: 15,
        price: 100,
        isFeatured: true,
        thumbnail: SImages.colt1911,
        description: 'Colt-1911',
        brand: BrandModel(
            id: '1',
            name: 'WE',
            image: SImages.adidasLogo,
            productCount: 256,
            isFeatured: true),
        images: [SImages.colt1911, SImages.colt1911],
        sku: 'JJS5674',
        categoryId: '8',
        productType: 'ProductType.single'),
    ProductModel(
        id: '006',
        title: 'Рюкзак',
        stock: 15,
        price: 75,
        isFeatured: true,
        thumbnail: SImages.backpack,
        description: 'Описание Рюкзака ',
        brand: BrandModel(
            id: '5',
            name: 'Nike)))',
            image: SImages.nikeLogo,
            productCount: 25456,
            isFeatured: true),
        images: [SImages.backpack, SImages.backpack2, SImages.backpack3],
        salePrice: 60,
        sku: 'NVJ3285',
        categoryId: '4',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Black', 'Brown', 'Green']),
          ProductAttributeModel(
              name: 'Capacity', values: ['15l.', '25l.', '50l.']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '3',
            stock: 34,
            price: 60,
            image: SImages.backpack,
            description: 'First backpack for the assault',
            attributeValues: {'Color': 'Green', 'Capacity': '25l.'},
          ),
          ProductVariationModel(
            id: '4',
            stock: 0,
            price: 50,
            image: SImages.backpack2,
            description: 'Backpack description 2',
            attributeValues: {'Color': 'Black', 'Capacity': '15l.'},
          ),
          ProductVariationModel(
            id: '5',
            stock: 30,
            price: 75,
            image: SImages.backpack3,
            description: 'Backpack description 3',
            attributeValues: {'Color': 'Brown', 'Capacity': '50l.'},
          ),
        ],
        productType: 'ProductType.variable'),
  ];
}
