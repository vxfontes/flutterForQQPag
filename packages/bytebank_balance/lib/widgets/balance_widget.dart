part of '../bytebank_balance.dart';

class BytebankBalance extends StatefulWidget {
  final Color color;

  const BytebankBalance({super.key, required this.color});

  @override
  State<BytebankBalance> createState() => _BytebankBalanceState();
}

class _BytebankBalanceState extends State<BytebankBalance> {
  bool isShowBalance = false;
  double userBalance = 0;

  onVisibleBalanceClick() {
    setState(() {
      isShowBalance = !isShowBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Saldo",
              style: TextStyle(
                fontSize: 20,
                color: widget.color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 24),
            IconButton(
              onPressed: () {
                onVisibleBalanceClick();
              },
              icon: Icon(
                  (isShowBalance) ? Icons.visibility_off : Icons.visibility,
                  color: widget.color),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: widget.color, thickness: 2),
        ),
        Text(
          "Conta Corrente",
          style: TextStyle(
            color: widget.color,
            fontSize: 16,
          ),
        ),
        Text(
          (isShowBalance)
              ? "R\$ ${userBalance.toStringAsFixed(2)}"
              : "R\$ ●●●●",
          style: TextStyle(
            color: widget.color,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
