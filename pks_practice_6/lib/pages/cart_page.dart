import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/device.dart';

class CartPage extends StatefulWidget {
  final List<Device> cartItems;
  const CartPage({super.key, required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<Device, int> itemCounts = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.cartItems) {
      itemCounts[item] = (itemCounts[item] ?? 0) + 1;
    }
  }

  void _incrementItem(Device device) {
    setState(() {
      itemCounts[device] = (itemCounts[device] ?? 0) + 1;
    });
  }

  void _decrementItem(Device device) {
    setState(() {
      if (itemCounts[device]! > 1) {
        itemCounts[device] = itemCounts[device]! - 1;
      } else {
        itemCounts.remove(device);
      }
    });
  }

  void _removeItem(Device device) {
    setState(() {
      itemCounts.remove(device);
    });
  }

  int _calculateTotal() {
    int total = 0;
    itemCounts.forEach((device, count) {
      total += device.price * count;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: itemCounts.isEmpty
          ? const Center(child: Text('Корзина пуста'))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: itemCounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      Device device = itemCounts.keys.elementAt(index);
                      return Slidable(
                        key: Key(device.id.toString()),
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          extentRatio: 0.4, 
                          children: [
                            SlidableAction(
                              onPressed: (context) => _removeItem(device),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Удалить',
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Image.network(
                            device.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(device.title),
                          subtitle: Text('${device.price} руб.'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _decrementItem(device),
                              ),
                              Text(
                                '${itemCounts[device]}',
                                style: const TextStyle(fontSize: 17),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _incrementItem(device),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Общая сумма товаров:',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${_calculateTotal()} руб.',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, 
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Купить',
                          style: TextStyle(fontSize: 18, color: Color(0xFFF5DEB3)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
