import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  bool isSearching = false;

  Future<void> searchCity() async {
    final city = controller.text.trim();

    if (city.isEmpty) return;

    setState(() {
      isSearching = true;
    });

    try {
      await context.read<WeatherProvider>().getWeather(city);

      if (!mounted) return;

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("City not found")));
    } finally {
      if (mounted) {
        setState(() {
          isSearching = false;
        });
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090B16),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text("Search City", style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            /// 🔍 INPUT
            TextField(
              controller: controller,

              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                hintText: "Enter city name",
                hintStyle: const TextStyle(color: Colors.white54),

                filled: true,
                fillColor: Colors.white.withOpacity(0.06),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide.none,
                ),
              ),

              onSubmitted: (_) => searchCity(),
            ),

            const SizedBox(height: 30),

            /// 🔥 BUTTON / LOADER
            isSearching
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: searchCity,

                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),

                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),

                      child: const Text(
                        "Search",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
