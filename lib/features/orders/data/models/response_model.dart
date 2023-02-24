// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.orderInfo,
    required this.totalRecord,
  });

  OrderInfo orderInfo;
  int totalRecord;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderInfo: OrderInfo.fromJson(json["orderInfo"]),
        totalRecord: json["total_record"],
      );

  Map<String, dynamic> toJson() => {
        "orderInfo": orderInfo.toJson(),
        "total_record": totalRecord,
      };
}

class OrderInfo {
  OrderInfo({
    required this.orders,
  });

  List<OrderModel> orders;

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        orders: List<OrderModel>.from(json["orders"].map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class OrderModel {
  OrderModel({
    required this.orderId,
    required this.phone,
    required this.phonePinCode,
    required this.address,
    required this.restaurantBrandId,
    required this.latitude,
    required this.longitude,
    required this.sequenceNo,
    required this.type,
    required this.orderType,
    required this.companySupportNo,
    required this.orderTypeId,
    required this.amount,
    required this.subTotal,
    required this.total,
    required this.tip,
    required this.tax,
    required this.deliveryFee,
    required this.serviceFee,
    required this.discount,
    required this.bagFee,
    required this.deliveryDate,
    required this.submitedDate,
    required this.expectedDate,
    required this.deliveryType,
    required this.isPickup,
    required this.orderStatus,
    this.orderNotes,
    required this.referenceNo,
    this.dinerCount,
    required this.ordersItems,
    required this.sortDate,
    required this.isFuture,
    required this.driverImage,
    required this.driverThumbImage,
    required this.driverId,
    required this.companyDriver,
    required this.isOnlyReceipt,
    required this.isFoodreadyorderNew,
    required this.isCancelorderNew,
    required this.isRefundorderNew,
    required this.isDelayorderNew,
    required this.isAdjustorderpriceNew,
    required this.isOutfordeliveryNew,
    required this.isFoodreadyorder,
    required this.isCancelorder,
    required this.isRefundorder,
    required this.isDelayorder,
    required this.isAdjustorderprice,
    required this.isOutfordelivery,
    required this.printCount,
    required this.adjustedCount,
    required this.canceledCount,
    required this.modifiedCount,
  });

  int orderId;
  String phone;
  String phonePinCode;
  String address;
  int restaurantBrandId;
  String latitude;
  String longitude;
  int sequenceNo;
  int type;
  OrderType orderType;
  CompanySupportNo companySupportNo;
  int orderTypeId;
  double amount;
  double subTotal;
  double total;
  int tip;
  double tax;
  int deliveryFee;
  int serviceFee;
  int discount;
  int bagFee;
  DateTime deliveryDate;
  DateTime submitedDate;
  DateTime expectedDate;
  int deliveryType;
  int isPickup;
  int orderStatus;
  String? orderNotes;
  String referenceNo;
  dynamic dinerCount;
  List<OrdersItem> ordersItems;
  DateTime sortDate;
  int isFuture;
  String driverImage;
  String driverThumbImage;
  String driverId;
  CompanyDriver companyDriver;
  int isOnlyReceipt;
  int isFoodreadyorderNew;
  int isCancelorderNew;
  int isRefundorderNew;
  int isDelayorderNew;
  int isAdjustorderpriceNew;
  int isOutfordeliveryNew;
  bool isFoodreadyorder;
  bool isCancelorder;
  bool isRefundorder;
  bool isDelayorder;
  bool isAdjustorderprice;
  bool isOutfordelivery;
  int printCount;
  int adjustedCount;
  int canceledCount;
  int modifiedCount;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json["order_id"],
        phone: json["phone"],
        phonePinCode: json["phone_pin_code"],
        address: json["address"],
        restaurantBrandId: json["restaurant_brand_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        sequenceNo: json["sequence_no"],
        type: json["type"],
        orderType: orderTypeValues.map[json["order_type"]]!,
        companySupportNo:
            companySupportNoValues.map[json["company_support_no"]]!,
        orderTypeId: json["order_type_id"],
        amount: json["amount"]?.toDouble(),
        subTotal: json["sub_total"]?.toDouble(),
        total: json["total"]?.toDouble(),
        tip: json["tip"],
        tax: json["tax"]?.toDouble(),
        deliveryFee: json["delivery_fee"],
        serviceFee: json["service_fee"],
        discount: json["discount"],
        bagFee: json["bag_fee"],
        deliveryDate: DateTime.parse(json["delivery_date"]),
        submitedDate: DateTime.parse(json["submited_date"]),
        expectedDate: DateTime.parse(json["expected_date"]),
        deliveryType: json["delivery_type"],
        isPickup: json["is_pickup"],
        orderStatus: json["order_status"],
        orderNotes: json["order_notes"],
        referenceNo: json["reference_no"],
        dinerCount: json["diner_count"],
        ordersItems: List<OrdersItem>.from(
            json["ordersItems"].map((x) => OrdersItem.fromJson(x))),
        sortDate: DateTime.parse(json["sort_date"]),
        isFuture: json["is_future"],
        driverImage: json["driver_image"],
        driverThumbImage: json["driver_thumb_image"],
        driverId: json["driver_id"],
        companyDriver: CompanyDriver.fromJson(json["company_driver"]),
        isOnlyReceipt: json["is_only_receipt"],
        isFoodreadyorderNew: json["is_foodreadyorder_new"],
        isCancelorderNew: json["is_cancelorder_new"],
        isRefundorderNew: json["is_refundorder_new"],
        isDelayorderNew: json["is_delayorder_new"],
        isAdjustorderpriceNew: json["is_adjustorderprice_new"],
        isOutfordeliveryNew: json["is_outfordelivery_new"],
        isFoodreadyorder: json["is_foodreadyorder"],
        isCancelorder: json["is_cancelorder"],
        isRefundorder: json["is_refundorder"],
        isDelayorder: json["is_delayorder"],
        isAdjustorderprice: json["is_adjustorderprice"],
        isOutfordelivery: json["is_outfordelivery"],
        printCount: json["print_count"],
        adjustedCount: json["adjusted_count"],
        canceledCount: json["canceled_count"],
        modifiedCount: json["modified_count"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "phone": phone,
        "phone_pin_code": phonePinCode,
        "address": address,
        "restaurant_brand_id": restaurantBrandId,
        "latitude": latitude,
        "longitude": longitude,
        "sequence_no": sequenceNo,
        "type": type,
        "order_type": orderTypeValues.reverse[orderType],
        "company_support_no": companySupportNoValues.reverse[companySupportNo],
        "order_type_id": orderTypeId,
        "amount": amount,
        "sub_total": subTotal,
        "total": total,
        "tip": tip,
        "tax": tax,
        "delivery_fee": deliveryFee,
        "service_fee": serviceFee,
        "discount": discount,
        "bag_fee": bagFee,
        "delivery_date": deliveryDate.toIso8601String(),
        "submited_date": submitedDate.toIso8601String(),
        "expected_date": expectedDate.toIso8601String(),
        "delivery_type": deliveryType,
        "is_pickup": isPickup,
        "order_status": orderStatus,
        "order_notes": orderNotes,
        "reference_no": referenceNo,
        "diner_count": dinerCount,
        "ordersItems": List<dynamic>.from(ordersItems.map((x) => x.toJson())),
        "sort_date": sortDate.toIso8601String(),
        "is_future": isFuture,
        "driver_image": driverImage,
        "driver_thumb_image": driverThumbImage,
        "driver_id": driverId,
        "company_driver": companyDriver.toJson(),
        "is_only_receipt": isOnlyReceipt,
        "is_foodreadyorder_new": isFoodreadyorderNew,
        "is_cancelorder_new": isCancelorderNew,
        "is_refundorder_new": isRefundorderNew,
        "is_delayorder_new": isDelayorderNew,
        "is_adjustorderprice_new": isAdjustorderpriceNew,
        "is_outfordelivery_new": isOutfordeliveryNew,
        "is_foodreadyorder": isFoodreadyorder,
        "is_cancelorder": isCancelorder,
        "is_refundorder": isRefundorder,
        "is_delayorder": isDelayorder,
        "is_adjustorderprice": isAdjustorderprice,
        "is_outfordelivery": isOutfordelivery,
        "print_count": printCount,
        "adjusted_count": adjustedCount,
        "canceled_count": canceledCount,
        "modified_count": modifiedCount,
      };
}

class CompanyDriver {
  CompanyDriver({
    required this.driverImage,
    required this.driverThumbImage,
    required this.driverId,
    required this.driverName,
    required this.driverNumber,
    required this.driverEta,
    required this.driverStatus,
  });

  String driverImage;
  String driverThumbImage;
  String driverId;
  String driverName;
  String driverNumber;
  String driverEta;
  int driverStatus;

  factory CompanyDriver.fromJson(Map<String, dynamic> json) => CompanyDriver(
        driverImage: json["driver_image"],
        driverThumbImage: json["driver_thumb_image"],
        driverId: json["driver_id"],
        driverName: json["driver_name"],
        driverNumber: json["driver_number"],
        driverEta: json["driver_eta"],
        driverStatus: json["driver_status"],
      );

  Map<String, dynamic> toJson() => {
        "driver_image": driverImage,
        "driver_thumb_image": driverThumbImage,
        "driver_id": driverId,
        "driver_name": driverName,
        "driver_number": driverNumber,
        "driver_eta": driverEta,
        "driver_status": driverStatus,
      };
}

enum CompanySupportNo { THE_18777984141, THE_18559731040 }

final companySupportNoValues = EnumValues({
  "+1 (855) 973-1040": CompanySupportNo.THE_18559731040,
  "+1 (877) 798-4141": CompanySupportNo.THE_18777984141
});

enum OrderType { GRUBHUB, DOOR_DASH }

final orderTypeValues =
    EnumValues({"DoorDash": OrderType.DOOR_DASH, "Grubhub": OrderType.GRUBHUB});

class OrdersItem {
  OrdersItem({
    required this.description,
    required this.printers,
    required this.defaultPrinters,
    required this.sortNo,
    required this.catSortNo,
    required this.finalSortNo,
    required this.quantity,
    required this.price,
    this.modifiers,
    required this.printItemName,
    this.printModifiers,
    this.notes,
  });

  String description;
  List<String> printers;
  List<String> defaultPrinters;
  int sortNo;
  int catSortNo;
  int finalSortNo;
  int quantity;
  double price;
  List<OrdersItemModifier>? modifiers;
  List<PrintItemName> printItemName;
  List<PrintModifier>? printModifiers;
  String? notes;

  factory OrdersItem.fromJson(Map<String, dynamic> json) => OrdersItem(
        description: json["description"],
        printers: List<String>.from(json["printers"].map((x) => x)),
        defaultPrinters:
            List<String>.from(json["default_printers"].map((x) => x)),
        sortNo: json["sort_no"],
        catSortNo: json["cat_sort_no"],
        finalSortNo: json["final_sort_no"],
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
        modifiers: json["modifiers"] == null
            ? []
            : List<OrdersItemModifier>.from(
                json["modifiers"]!.map((x) => OrdersItemModifier.fromJson(x))),
        printItemName: List<PrintItemName>.from(
            json["print_item_name"].map((x) => PrintItemName.fromJson(x))),
        printModifiers: json["print_modifiers"] == null
            ? []
            : List<PrintModifier>.from(
                json["print_modifiers"]!.map((x) => PrintModifier.fromJson(x))),
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "printers": List<dynamic>.from(printers.map((x) => x)),
        "default_printers": List<dynamic>.from(defaultPrinters.map((x) => x)),
        "sort_no": sortNo,
        "cat_sort_no": catSortNo,
        "final_sort_no": finalSortNo,
        "quantity": quantity,
        "price": price,
        "modifiers": modifiers == null
            ? []
            : List<dynamic>.from(modifiers!.map((x) => x.toJson())),
        "print_item_name":
            List<dynamic>.from(printItemName.map((x) => x.toJson())),
        "print_modifiers": printModifiers == null
            ? []
            : List<dynamic>.from(printModifiers!.map((x) => x.toJson())),
        "notes": notes,
      };
}

class OrdersItemModifier {
  OrdersItemModifier({
    required this.category,
    required this.modifiers,
  });

  Category category;
  List<ModifierModifier> modifiers;

  factory OrdersItemModifier.fromJson(Map<String, dynamic> json) =>
      OrdersItemModifier(
        category: categoryValues.map[json["category"]]!,
        modifiers: List<ModifierModifier>.from(
            json["modifiers"].map((x) => ModifierModifier.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "modifiers": List<dynamic>.from(modifiers.map((x) => x.toJson())),
      };
}

enum Category {
  EMPTY,
  FETTUCCINE,
  SIZE,
  PANCAKE_OPTIONS,
  BREAKFAST_SIDES,
  THE_20_OZ_BOTTLE
}

final categoryValues = EnumValues({
  "Breakfast Sides": Category.BREAKFAST_SIDES,
  "": Category.EMPTY,
  "Fettuccine": Category.FETTUCCINE,
  "Pancake Options": Category.PANCAKE_OPTIONS,
  "Size": Category.SIZE,
  "20oz Bottle": Category.THE_20_OZ_BOTTLE
});

class ModifierModifier {
  ModifierModifier({
    required this.name,
    required this.price,
  });

  String name;
  String price;

  factory ModifierModifier.fromJson(Map<String, dynamic> json) =>
      ModifierModifier(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}

class PrintItemName {
  PrintItemName({
    required this.printer,
    required this.itemName,
  });

  String printer;
  String itemName;

  factory PrintItemName.fromJson(Map<String, dynamic> json) => PrintItemName(
        printer: json["printer"],
        itemName: json["item_name"],
      );

  Map<String, dynamic> toJson() => {
        "printer": printer,
        "item_name": itemName,
      };
}

class PrintModifier {
  PrintModifier({
    required this.printer,
    required this.modifiers,
  });

  String printer;
  List<PrintModifierModifier> modifiers;

  factory PrintModifier.fromJson(Map<String, dynamic> json) => PrintModifier(
        printer: json["printer"],
        modifiers: List<PrintModifierModifier>.from(
            json["modifiers"].map((x) => PrintModifierModifier.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "printer": printer,
        "modifiers": List<dynamic>.from(modifiers.map((x) => x.toJson())),
      };
}

class PrintModifierModifier {
  PrintModifierModifier({
    required this.category,
    required this.name,
    required this.sortNo,
    required this.price,
    required this.quantity,
  });

  Category category;
  String name;
  int sortNo;
  String price;
  int quantity;

  factory PrintModifierModifier.fromJson(Map<String, dynamic> json) =>
      PrintModifierModifier(
        category: categoryValues.map[json["category"]]!,
        name: json["name"],
        sortNo: json["sort_no"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "name": name,
        "sort_no": sortNo,
        "price": price,
        "quantity": quantity,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
