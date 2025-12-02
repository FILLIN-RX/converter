import 'package:flutter/material.dart';

/// CurrencyConverter is a StatefulWidget because the UI depends on changing
/// runtime data (the converted result). A StatefulWidget delegates its mutable
/// state to a separate State object (_CurrencyMaterial).
class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyMaterial();
}

/// State class for CurrencyConverter. This holds all mutable state and the
/// logic required to update the UI when that state changes.
class _CurrencyMaterial extends State<CurrencyConverter> {
  // Numeric result of the conversion. Starts at 0 and is updated when the
  // user taps the Convert button.
  double result = 0;

  // Controller attached to the TextField so we can read the current input
  // value programmatically. This allows parsing the entered text into a
  // number when performing the conversion.
  final TextEditingController textEditingController = TextEditingController();

  // convert() is called when the user presses the Convert button. It parses
  // the current text input as a double and multiplies it by the exchange
  // rate (650 in this example). The setState call tells Flutter to rebuild
  // the widget tree so the displayed result updates.
  void convert() {
    setState(() {
      // Note: In production code you should handle parse errors (e.g. empty
      // input or invalid number formats) with try/catch or validation.
      result = double.parse(textEditingController.text) * 650;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define a reusable border style for the TextField focused/enabled states.
    // This keeps the visual appearance consistent and easy to change in one
    // place.
    const border = OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );

    // The Scaffold forms the basic visual layout structure: app bar on top,
    // body content in the main area, and a background color.
    return Scaffold(
      // Overall background color behind the app content.
      backgroundColor: Colors.blue,

      // Top app bar (header). Uses a contrasting color and a simple title.
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text(
          "Currency converter",
          style: TextStyle(color: Colors.white),
        ),
      ),

      // Main content centered in the body area.
      body: Center(
        // ColoredBox provides a solid background color for the content
        // container. This is where the result, input, and button live.
        child: ColoredBox(
          color: Colors.redAccent,
          child: Column(
            // Center the children vertically within the ColoredBox.
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the converted amount. The numeric value `result` is
              // interpolated into the string. Styling makes it prominent.
              Text(
                'EUR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}', // Convert number to string via interpolation
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Input area: a padded TextField where the user types an amount.
              // The controller provides access to the current text value.
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  // onSubmitted fires when the user presses the keyboard's
                  // action button (e.g. Done/Enter). Here it simply prints the
                  // value to the console; conversion is triggered via the
                  // Convert button instead.
                  onSubmitted: (value) {
                    print(value); // Useful for debugging during development
                  },
                  // Input text color inside the field
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    // Placeholder hint to indicate expected input
                    hintText: 'Please enter the amount',
                    hintStyle: TextStyle(color: Colors.black),
                    // Icon shown at the end of the input field
                    suffixIcon: Icon(Icons.monetization_on_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    // Use the pre-defined border for focused/enabled states
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  // Use a numeric keyboard to make it easier to enter numbers.
                  keyboardType: TextInputType.number,
                ),
              ),

              // Convert button: when pressed it runs the convert() method which
              // updates the state (and the displayed result).
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: convert,
                  // Button style controls elevation, colors, size, and shape.
                  style: ButtonStyle(
                    // NOTE: Depending on your Flutter SDK you might use
                    // MaterialStatePropertyAll instead of WidgetStatePropertyAll.
                    // This file preserves the same API used originally.
                    elevation: WidgetStatePropertyAll(15),
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                    fixedSize: WidgetStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text("Convert"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// End of currency converter page.
// Notes & recommendations:
// - Add input validation to handle empty or invalid numbers.
// - Consider making the exchange rate configurable (e.g., via settings or an API).
// - If you expect large numbers, format the displayed result for readability.
