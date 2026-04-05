import 'package:flutter/material.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/staff/domain/staff_model.dart';

class StaffFormDialog extends StatefulWidget {
  final Staff? staff;
  final Future<void> Function(Object request) onSave;

  const StaffFormDialog(
      {super.key, this.staff, required this.onSave});

  @override
  State<StaffFormDialog> createState() => _StaffFormDialogState();
}

class _StaffFormDialogState extends State<StaffFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _licenseNumber;
  late final TextEditingController _note;
  String? _title;
  String? _specialization;
  DateTime? _hireDate;
  bool _saving = false;

  bool get isEditing => widget.staff != null;

  static const _titles = [
    'Uzm. Dr.',
    'Dr.',
    'Prof. Dr.',
    'Doc. Dr.',
    'Hemsire',
    'Teknisyen',
    'Asistan',
  ];

  static const _specializations = [
    'Dermatoloji',
    'Estetik Cerrahi',
    'Plastik Cerrahi',
    'Medikal Estetik',
    'Lazer Tedavisi',
    'Dis Hekimligi',
    'Beslenme',
    'Fizyoterapi',
  ];

  @override
  void initState() {
    super.initState();
    final s = widget.staff;
    _firstName = TextEditingController(text: s?.firstName);
    _lastName = TextEditingController(text: s?.lastName);
    _phone = TextEditingController(text: s?.phone);
    _email = TextEditingController(text: s?.email);
    _licenseNumber = TextEditingController(text: s?.licenseNumber);
    _note = TextEditingController(text: s?.note);
    _title = s?.title;
    _specialization = s?.specialization;
    _hireDate = fromApiDate(s?.hireDate);
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _email.dispose();
    _licenseNumber.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickHireDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _hireDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() => _hireDate = pickedDate);
    }
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdateStaffRequest(
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          title: _title,
          specialization: _specialization,
          phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
          email: _email.text.trim().isEmpty ? null : _email.text.trim(),
          licenseNumber: _licenseNumber.text.trim().isEmpty
              ? null
              : _licenseNumber.text.trim(),
          hireDate: toApiDate(_hireDate),
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      } else {
        await widget.onSave(CreateStaffRequest(
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          title: _title,
          specialization: _specialization,
          phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
          email: _email.text.trim().isEmpty ? null : _email.text.trim(),
          licenseNumber: _licenseNumber.text.trim().isEmpty
              ? null
              : _licenseNumber.text.trim(),
          hireDate: toApiDate(_hireDate),
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                isEditing ? 'Personel guncellendi' : 'Personel olusturuldu'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e is ApiException ? e.message : 'Islem basarisiz'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Personel Duzenle' : 'Yeni Personel',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _firstName,
                  decoration: const InputDecoration(labelText: 'Ad'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _lastName,
                  decoration: const InputDecoration(labelText: 'Soyad'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _title,
                  decoration: const InputDecoration(labelText: 'Unvan'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Secin')),
                    ..._titles.map(
                        (t) => DropdownMenuItem(value: t, child: Text(t))),
                  ],
                  onChanged: (v) => setState(() => _title = v),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _specialization,
                  decoration: const InputDecoration(labelText: 'Uzmanlik'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Secin')),
                    ..._specializations.map(
                        (s) => DropdownMenuItem(value: s, child: Text(s))),
                  ],
                  onChanged: (v) => setState(() => _specialization = v),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phone,
                  decoration: const InputDecoration(labelText: 'Telefon'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: 'E-posta'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _licenseNumber,
                  decoration: const InputDecoration(labelText: 'Lisans No'),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _pickHireDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ise Giris Tarihi',
                        hintText: _hireDate != null
                            ? formatDate(toApiDate(_hireDate))
                            : 'Secin',
                        suffixIcon: const Icon(Icons.calendar_today, size: 18),
                      ),
                      controller: TextEditingController(
                        text: _hireDate != null
                            ? formatDate(toApiDate(_hireDate))
                            : '',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _note,
                  decoration: const InputDecoration(labelText: 'Not'),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : _handleSave,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                      : Text(isEditing ? 'Guncelle' : 'Olustur'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
