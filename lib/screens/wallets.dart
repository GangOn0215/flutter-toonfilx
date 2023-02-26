import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';
import 'package:flutter/material.dart';

class Wallets extends StatelessWidget {
  const Wallets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hey, Selena',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Welcome, back',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$5 179 482',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  text: 'Transfer',
                  fontColor: Colors.black,
                  backgroundColor: Color(0xFFE75480),
                ),
                Button(
                  text: 'Request',
                  fontColor: Color(0xFFE75480),
                  backgroundColor: Color(0xFF1F2123),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Wallets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CurrencyCard(
              name: 'Euro',
              code: 'EUR',
              amonut: '6 483',
              icon: Icons.euro_rounded,
              isInverted: false,
            ),
            const CurrencyCard(
              name: 'Bitcoin',
              code: 'BTC',
              amonut: '9 783',
              icon: Icons.currency_bitcoin_rounded,
              isInverted: true,
              offset: Offset(0, -40),
            ),
            const CurrencyCard(
              name: 'Dallar',
              code: 'USD',
              amonut: '428',
              icon: Icons.attach_money_outlined,
              isInverted: false,
              offset: Offset(0, -80),
            ),
          ],
        ),
      ),
    );
  }
}
