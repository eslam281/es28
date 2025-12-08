import 'package:flutter/material.dart';

class ElathakerEditPage extends StatelessWidget {
  final int? index;
  final controller;
  const ElathakerEditPage({super.key, this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController countController = TextEditingController();

    if (index != null) {
      textController.text = controller.athkar[index!][0];
      countController.text = controller.athkar[index!][1].toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          index == null ? "إضافة ذكر" : "تعديل الذكر",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            _buildInputCard(
              context,
              controller: textController,
              label: "الذكر",
              icon: Icons.edit_note,
              keyboard: TextInputType.text,
            ),

            const SizedBox(height: 20),

            _buildInputCard(
              context,
              controller: countController,
              label: "العدد المطلوب",
              icon: Icons.numbers,
              keyboard: TextInputType.number,
            ),

            const Spacer(),

            _buildMainButton(
              context,
              text: index == null ? "إضافة" : "تعديل",
              icon: index == null ? Icons.add_task : Icons.check_circle,
              onTap: () {
                if (index == null) {
                  controller.add(
                    textController.text,
                    int.parse(countController.text),
                  );
                } else {
                  controller.edit(
                    index!,
                    textController.text,
                    int.parse(countController.text),
                  );
                }
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard(
      BuildContext context, {
        required TextEditingController controller,
        required String label,
        required IconData icon,
        required TextInputType keyboard,
      }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          controller: controller,
          keyboardType: keyboard,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
            ),
            prefixIcon: Icon(icon, color: Colors.green),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildMainButton(
      BuildContext context, {
        required String text,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

