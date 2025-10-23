import 'package:flutter/material.dart';

class InputDataPage extends StatefulWidget {
  const InputDataPage({super.key});

  @override
  State<InputDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<InputDataPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _deviceController = TextEditingController();
  final TextEditingController _energyController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  DateTime? _selectedDate;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      // Here you would normally send the data to a backend or database
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data submitted successfully! ✅'),
          backgroundColor: Colors.green,
        ),
      );

      // Clear the form
      _deviceController.clear();
      _energyController.clear();
      _notesController.clear();
      setState(() => _selectedDate = null);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields ⚠️'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Input New Energy Data ⚡",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // DATE PICKER
                    GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          controller: TextEditingController(
                            text:
                                _selectedDate == null
                                    ? ''
                                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          ),
                          validator:
                              (_) =>
                                  _selectedDate == null
                                      ? 'Please select a date'
                                      : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Device ID
                    TextFormField(
                      controller: _deviceController,
                      decoration: InputDecoration(
                        labelText: 'Device ID',
                        prefixIcon: const Icon(Icons.devices_other),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a device ID'
                                  : null,
                    ),
                    const SizedBox(height: 16),

                    // Name
                    TextFormField(
                      controller: _deviceController,
                      decoration: InputDecoration(
                        labelText: 'Source Name',
                        prefixIcon: const Icon(Icons.devices_other),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a Device Name'
                                  : null,
                    ),
                    const SizedBox(height: 16),

                    // ENERGY USED
                    TextFormField(
                      controller: _energyController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Energy Used (Voltage)',
                        prefixIcon: const Icon(Icons.bolt_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter energy used'
                                  : null,
                    ),
                    const SizedBox(height: 16),

                    // NOTES
                    TextFormField(
                      controller: _notesController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Notes (optional)',
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(Icons.note_alt_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // SUBMIT BUTTON
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(180, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text(
                          "Submit Data",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
