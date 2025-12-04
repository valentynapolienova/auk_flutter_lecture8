import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    required this.textEditingController,
    required this.loadWeatherCallback,
    super.key,
  });

  final TextEditingController textEditingController;
  final VoidCallback loadWeatherCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: TextField(
            controller: textEditingController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter city name',
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Colors.white, width: 1.5),
              ),
            ),
            cursorColor: Colors.white,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => loadWeatherCallback(),
          ),
        ),
        ElevatedButton(
          onPressed: loadWeatherCallback,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: Colors.white.withValues(alpha: 0.25),
            elevation: 4,
            shadowColor: Colors.black.withValues(alpha: 0.3),
          ),
          child: const Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
