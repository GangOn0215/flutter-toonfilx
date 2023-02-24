import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amonut;
  final IconData icon;
  final bool isInverted; // 반전
  final Offset offset;

  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amonut,
    required this.icon,
    required this.isInverted,
    this.offset = const Offset(0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        clipBehavior: Clip.hardEdge, // overflow를 어떻게 할지
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            amonut,
                            style: const TextStyle(
                              color: Color(0xFFE75480),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            code,
                            style: TextStyle(
                              color: isInverted
                                  ? _blackColor
                                  : Colors.white.withOpacity(
                                      0.3,
                                    ),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                    offset: const Offset(-5, 8),
                    child: Icon(
                      icon,
                      color: isInverted ? _blackColor : Colors.white,
                      size: 80,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
