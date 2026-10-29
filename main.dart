// Lab 3: Final Midterm Project - The Dart App Simulator
// System: Online Store Cart Simulator
import 'dart:async';

// 1. Abstract Class / Interface
abstract class Describable {
  String getDescription();
}

// 2. Mixin for Code Reuse (Discount calculation logic)
mixin Discountable {
  double applyDiscount(double price, double discountPercent) {
    if (discountPercent < 0 || discountPercent > 100) {
      throw ArgumentError("Discount percentage must be between 0 and 100.");
    }
    return price - (price * (discountPercent / 100));
  }
}

// 3. Base Class with Constructor and Methods
class Product implements Describable {
  String name;
  double price;
  int stock;

  // Constructor
  Product(this.name, this.price, this.stock);

  @override
  String getDescription() {
    return 'Product: $name | Price: PHP ${price.toStringAsFixed(2)} | Stock: $stock';
  }

  void updateStock(int quantity) {
    stock -= quantity;
  }
}

// 4. Subclass demonstrating Inheritance and using the Mixin
class ElectronicProduct extends Product with Discountable {
  String brand;
  int warrantyMonths;

  // Constructor using super
  ElectronicProduct(String name, double price, int stock, this.brand, this.warrantyMonths)
      : super(name, price, stock);

  @override
  String getDescription() {
    return '${super.getDescription()} | Brand: $brand | Warranty: ${warrantyMonths}mo';
  }
}

// 5. Async Function simulating server data fetch with delay
Future<List<ElectronicProduct>> fetchCatalog() async {
  print("Connecting to inventory server and fetching catalog...");
  await Future.delayed(Duration(seconds: 2));
  
  // Simulating a successful catalog load
  return [
    ElectronicProduct("Wireless Earbuds", 2499.00, 15, "SoundPro", 12),
    ElectronicProduct("Mechanical Keyboard", 3500.00, 8, "KeyMaster", 24),
    ElectronicProduct("Smart Watch", 4999.00, 5, "TimeTech", 6),
  ];
}

// 6. Async Checkout Process with Error Handling (Try-Catch)
Future<void> processCheckout(List<ElectronicProduct> cart) async {
  print("\nProcessing checkout securely...");
  try {
    await Future.delayed(Duration(seconds: 2));
    
    if (cart.isEmpty) {
      throw Exception("Cart is empty! Cannot proceed with checkout.");
    }
    
    double total = 0;
    for (var item in cart) {
      total += item.price;
    }
    print("Checkout successful! Total amount due: PHP ${total.toStringAsFixed(2)}");
  } catch (e) {
    print("Error during checkout: $e");
  }
}

// Main entry point with async/await
void main() async {
  print("=== THE DART APP SIMULATOR: ONLINE STORE CART ===");
  
  List<ElectronicProduct> catalog = [];
  
  // Try-catch block for fetching catalog data
  try {
    catalog = await fetchCatalog();
    print("\n--- Available Store Catalog ---");
    for (int i = 0; i < catalog.length; i++) {
      print("${i + 1}. ${catalog[i].getDescription()}");
    }
  } catch (e) {
    print("Error loading catalog: $e");
    return;
  }

  // Simulating user adding items to cart and using mixin features
  List<ElectronicProduct> cart = [];
  try {
    print("\nAdding items to cart...");
    cart.add(catalog[0]); // Add Earbuds
    cart.add(catalog[1]); // Add Keyboard
    
    // Applying the mixin method
    double discountedPrice = catalog[0].applyDiscount(catalog[0].price, 10.0);
    print("Promo Applied! 10% off on ${catalog[0].name}: PHP ${discountedPrice.toStringAsFixed(2)}");
    
  } catch (e) {
    print("Error managing cart: $e");
  }

  // Triggering asynchronous checkout simulation
  await processCheckout(cart);
  
  print("\n=== Simulation Complete ===");
}