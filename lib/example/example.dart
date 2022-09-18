import 'package:restaurant_orders/models/open_order_model.dart';

final Map<String, dynamic> auth = {
  "isSuccess": true,
  "result":
      "{\"Mobile\":\"9851143148\",\"EmpIName\":null,\"Address\":\"\",\"FPIN\":\"201270\",\"Email\":\"\",\"EmpNum\":\"0\"}"
};

final Map<String, dynamic> menuGroup = {
  "isSuccess": true,
  "result":
      "[{\"GroupName\":\"APERITIFS \"},{\"GroupName\":\"BAKERY\"},{\"GroupName\":\"BEER\"},{\"GroupName\":\"Beer Can\"},{\"GroupName\":\"BLENDED VANILLA MOCHA\"},{\"GroupName\":\"BREAKFAST\"},{\"GroupName\":\"Chinese Corner\"},{\"GroupName\":\"COCKTAIL\"},{\"GroupName\":\"Continental\"},{\"GroupName\":\"Dessert\"},{\"GroupName\":\"GIN\"},{\"GroupName\":\"Hot Beverage\"},{\"GroupName\":\"Imported Brandy (30 Ml)\"},{\"GroupName\":\"Imported Gin (30 Ml)\"},{\"GroupName\":\"Indian Corner\"},{\"GroupName\":\"JUICE [HOMEMADE]\"},{\"GroupName\":\"LIQUEUR\"},{\"GroupName\":\"Mocktails\"},{\"GroupName\":\"OTHERS\"},{\"GroupName\":\"Pasta and pizza\"},{\"GroupName\":\"RUM\"},{\"GroupName\":\"Salad\"},{\"GroupName\":\"Sandwich and Burger\"},{\"GroupName\":\"SNACKS\"},{\"GroupName\":\"Soft Drinks \"},{\"GroupName\":\"Soup\"},{\"GroupName\":\"Starter\"},{\"GroupName\":\"TANDOOR CORNER\"},{\"GroupName\":\"TEQUILA\"},{\"GroupName\":\"Tobacco\"},{\"GroupName\":\"VODKA\"},{\"GroupName\":\"WHISKY\"},{\"GroupName\":\"WINE\"}]"
};

final Map<String, dynamic> menuItem = {
  "isSuccess": true,
  "result":
      "[{\"ItemName\":\"100 pipers(30ml)\",\"INum\":507,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"100 pipers(60ml)\",\"INum\":177,\"Rate\":600.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Absolute vodka (half bottle)\",\"INum\":229,\"Rate\":3218.02,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Antiquenty Blue [60ML]\",\"INum\":289,\"Rate\":500.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Antiquity Blue(30ml)\",\"INum\":120,\"Rate\":250.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Antiquity Rare\",\"INum\":121,\"Rate\":250.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Ballantines(30ml]\",\"INum\":648,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Ballantines(full btl.)\",\"INum\":722,\"Rate\":5000.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Ballantiness (60ml)\",\"INum\":395,\"Rate\":700.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"BLACK AND WHITE(60ml)\",\"INum\":765,\"Rate\":700.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"black label(60ml)\",\"INum\":385,\"Rate\":800.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Black label(bqt)\",\"INum\":749,\"Rate\":6436.04,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"black label(full bottle)\",\"INum\":190,\"Rate\":9654.06,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"black label(half bottle)\",\"INum\":411,\"Rate\":4022.53,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Blue Label\",\"INum\":87,\"Rate\":1500.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Blue Label (60ml)\",\"INum\":797,\"Rate\":3000.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Chivas Regal [BTL}\",\"INum\":252,\"Rate\":9654.06,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Chivas Regal half Btl.\",\"INum\":198,\"Rate\":4827.03,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Chivas Regal(30ml)\",\"INum\":90,\"Rate\":400.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"chivas regal(60ml)\",\"INum\":175,\"Rate\":800.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Dimple Bottle\",\"INum\":837,\"Rate\":9655.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"DOBLE BLACK(60ML)\",\"INum\":172,\"Rate\":1200.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"DOUBLE BLACK FULL BOTTLE\",\"INum\":524,\"Rate\":10860.82,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Double Black(30ml)\",\"INum\":88,\"Rate\":650.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Glenfeddich(Bottle)\",\"INum\":216,\"Rate\":10056.31,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"GLENFIDDICH(30ml)\",\"INum\":189,\"Rate\":650.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"GLENFIDDICH(60ml) | \",\"INum\":812,\"Rate\":1287.2,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Golden Oak(half)\",\"INum\":822,\"Rate\":643.6,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"J&B(30ml)\",\"INum\":98,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"J.D [BTL]\",\"INum\":505,\"Rate\":9654.06,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"J.D [HALF]\",\"INum\":620,\"Rate\":4000.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Jack Danel(Bottle)\",\"INum\":806,\"Rate\":9654.06,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Jack Daniel(30ml)\",\"INum\":97,\"Rate\":400.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Jameson [60ML]\",\"INum\":553,\"Rate\":800.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Jameson(30ml)\",\"INum\":99,\"Rate\":400.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Jim Beam(30ml)\",\"INum\":96,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"MC Dowells no1(Half)\",\"INum\":123,\"Rate\":925.18,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Mc Dowells(bottle)\",\"INum\":808,\"Rate\":1850.36,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Old Durbar [30ML]\",\"INum\":516,\"Rate\":250.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Old Durbar Black [30ML]\",\"INum\":515,\"Rate\":300.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Old Durbar Black [BTL]\",\"INum\":313,\"Rate\":4022.53,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Old Durbar Black(Half)\",\"INum\":557,\"Rate\":2252.62,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"OLD DURBAR R.BOTTLE\",\"INum\":734,\"Rate\":4424.78,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"OLD DURBAR(R.S)\",\"INum\":733,\"Rate\":3057.11,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"other Charge\",\"INum\":307,\"Rate\":1206.76,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"passport(btl)\",\"INum\":821,\"Rate\":1126.3,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"passport(half)\",\"INum\":565,\"Rate\":643.6,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Red Label [60ML]\",\"INum\":509,\"Rate\":700.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Red Label(30ml)\",\"INum\":92,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Royal Stag(Btl)\",\"INum\":820,\"Rate\":1850.36,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Royal Stage\",\"INum\":122,\"Rate\":200.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Royal Stage [HALF]\",\"INum\":356,\"Rate\":925.18,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Royal Stage(Full)\",\"INum\":841,\"Rate\":2414.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Signature [Half Bottle]\",\"INum\":407,\"Rate\":1126.31,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Signature(30ml)\",\"INum\":124,\"Rate\":250.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"SIGNATURE(60ML)\",\"INum\":737,\"Rate\":500.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"SOL DE CHILE\",\"INum\":342,\"Rate\":490.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Teachers(30ml)\",\"INum\":614,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Teachers(60ml)\",\"INum\":93,\"Rate\":700.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"Vat 69(30ML)\",\"INum\":94,\"Rate\":350.0,\"GroupName\":\"WHISKY\"},{\"ItemName\":\"White Horse(30ml)\",\"INum\":95,\"Rate\":350.0,\"GroupName\":\"WHISKY\"}]"
};

final List<OpenOrderModel> openOrders = [
  OpenOrderModel.fromJson({
    "TableNum": "12",
    "Account": "",
    "CustomerName": "",
    "PTypeName": "Cash",
    "Qty": 1.0,
    "TotAmt": 372.9,
    "OrderDate": "2022-07-03T13:40:31",
    "OrderTimeGone": "19:58:24"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "010",
    "Account": "",
    "CustomerName": "Bishwendra Pashwan",
    "PTypeName": "Cash",
    "Qty": 5.0,
    "TotAmt": 621.5,
    "OrderDate": "2021-07-25T13:00:12",
    "OrderTimeGone": "20:38:43"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "010",
    "Account": "",
    "CustomerName": "Bishwendra Pashwan",
    "PTypeName": "Cash",
    "Qty": 4.0,
    "TotAmt": 621.5,
    "OrderDate": "2021-07-25T13:00:12",
    "OrderTimeGone": "20:38:43"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "1",
    "Account": "Nepal Airlines Corporation",
    "CustomerName": "Nepal Airlines Corporation(SUNDRY DEBTORS (AIRLINE",
    "PTypeName": "Credit Sales",
    "Qty": 4.0,
    "TotAmt": 1491.6,
    "OrderDate": "2022-08-31T14:59:42",
    "OrderTimeGone": "18:39:13"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "11",
    "Account": "",
    "CustomerName": "",
    "PTypeName": "Cash",
    "Qty": 1.0,
    "TotAmt": 745.8,
    "OrderDate": "2022-07-02T19:59:51",
    "OrderTimeGone": "13:39:04"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "010",
    "Account": "",
    "CustomerName": "Bishwendra Pashwan",
    "PTypeName": "Cash",
    "Qty": 1.0,
    "TotAmt": 621.5,
    "OrderDate": "2021-07-25T13:00:12",
    "OrderTimeGone": "20:38:43"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "15",
    "Account": "Bal Krishna Shivakoti",
    "CustomerName": "Bal Krishna Shivakoti",
    "PTypeName": "Credit Sales",
    "Qty": 4.5,
    "TotAmt": 807.95,
    "OrderDate": "2021-01-20T09:39:28",
    "OrderTimeGone": "23:59:27"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "5",
    "Account": "",
    "CustomerName": "",
    "PTypeName": "Cash",
    "Qty": 1.0,
    "TotAmt": 559.35,
    "OrderDate": "2021-10-06T18:13:41",
    "OrderTimeGone": "15:25:14"
  }),
  OpenOrderModel.fromJson({
    "TableNum": "803",
    "Account": "",
    "CustomerName": "Rekha Amir Uddin | ",
    "PTypeName": "Room Guest",
    "Qty": 5.0,
    "TotAmt": 1435.66,
    "OrderDate": "2021-05-21T17:26:35",
    "OrderTimeGone": "16:12:20"
  }),
];
