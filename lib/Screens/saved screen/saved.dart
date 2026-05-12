import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffed2c67),
                    ),
                  ),
                  const Text(
                    "Saved",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Color(0xffed2c67),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _movieCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ FIXED: Now inside State class
  Widget _movieCard(int index) {
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            setState(() {
              selectedIndex = selectedIndex == index ? -1 : index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff272727),
              borderRadius: BorderRadius.circular(14),

              /// 🔥 Selected Border
              border: Border.all(
                color: isSelected
                    ? const Color(0xffed2c67)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.92),
                  child: Image.asset(
                    "assets/images/films.png",
                    height: 77,
                    width: 88,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                /// Text Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Avengers",
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xffed2c67)
                              : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 4),

                      /// RichText
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Category: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: "Films",
                              style: const TextStyle(
                                color: Color(0xffed2c67),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Row(
                        children: [
                          Icon(Icons.star, color: Color(0xfff1c644), size: 12),
                          Icon(Icons.star, color: Color(0xfff1c644), size: 12),
                          Icon(Icons.star, color: Color(0xfff1c644), size: 12),
                          Icon(Icons.star, color: Color(0xffd4d4d4), size: 12),
                          Icon(Icons.star, color: Color(0xffd4d4d4), size: 12),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Right Side
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "1h 58m",
                      style: TextStyle(color: Color(0xffed2c67), fontSize: 12),
                    ),
                    const SizedBox(height: 8),

                    Icon(
                      Icons.favorite,
                      color: isSelected ? const Color(0xffed2c67) : Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
