import 'package:flutter/material.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/patients/domain/patient_model.dart';

class PatientFormDialog extends StatefulWidget {
  final Patient? patient;
  final Future<void> Function(Object request) onSave;

  const PatientFormDialog({super.key, this.patient, required this.onSave});

  @override
  State<PatientFormDialog> createState() => _PatientFormDialogState();
}

class _PatientFormDialogState extends State<PatientFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _identityNumber;
  late final TextEditingController _address;
  late final TextEditingController _allergies;
  late final TextEditingController _chronicDiseases;
  late final TextEditingController _note;
  DateTime? _birthDate;
  String? _gender;
  String? _bloodType;
  bool _saving = false;

  bool get isEditing => widget.patient != null;

  static const _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    '0+',
    '0-'
  ];


  @override
  void initState() {
    super.initState();
    final p = widget.patient;
    _firstName = TextEditingController(text: p?.firstName);
    _lastName = TextEditingController(text: p?.lastName);
    _phone = TextEditingController(text: p?.phone);
    _email = TextEditingController(text: p?.email);
    _identityNumber = TextEditingController(text: p?.identityNumber);
    _address = TextEditingController(text: p?.address);
    _allergies = TextEditingController(text: p?.allergies);
    _chronicDiseases = TextEditingController(text: p?.chronicDiseases);
    _note = TextEditingController(text: p?.note);
    _birthDate = fromApiDate(p?.birthDate);
    _gender = p?.gender;
    _bloodType = p?.bloodType;
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _email.dispose();
    _identityNumber.dispose();
    _address.dispose();
    _allergies.dispose();
    _chronicDiseases.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _birthDate = picked);
    }
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdatePatientRequest(
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          birthDate: toApiDate(_birthDate),
          gender: _gender,
          phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
          email: _email.text.trim().isEmpty ? null : _email.text.trim(),
          address: _address.text.trim().isEmpty ? null : _address.text.trim(),
          identityNumber: _identityNumber.text.trim().isEmpty
              ? null
              : _identityNumber.text.trim(),
          bloodType: _bloodType,
          allergies:
              _allergies.text.trim().isEmpty ? null : _allergies.text.trim(),
          chronicDiseases: _chronicDiseases.text.trim().isEmpty
              ? null
              : _chronicDiseases.text.trim(),
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      } else {
        await widget.onSave(CreatePatientRequest(
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          birthDate: toApiDate(_birthDate),
          gender: _gender,
          phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
          email: _email.text.trim().isEmpty ? null : _email.text.trim(),
          address: _address.text.trim().isEmpty ? null : _address.text.trim(),
          identityNumber: _identityNumber.text.trim().isEmpty
              ? null
              : _identityNumber.text.trim(),
          bloodType: _bloodType,
          allergies:
              _allergies.text.trim().isEmpty ? null : _allergies.text.trim(),
          chronicDiseases: _chronicDiseases.text.trim().isEmpty
              ? null
              : _chronicDiseases.text.trim(),
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(isEditing ? 'Hasta guncellendi' : 'Hasta olusturuldu'),
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
                      isEditing ? 'Hasta Duzenle' : 'Yeni Hasta',
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
                GestureDetector(
                  onTap: _pickBirthDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Dogum Tarihi',
                        hintText: _birthDate != null
                            ? formatDate(toApiDate(_birthDate))
                            : 'Secin',
                        suffixIcon: const Icon(Icons.calendar_today, size: 18),
                      ),
                      controller: TextEditingController(
                        text: _birthDate != null
                            ? formatDate(toApiDate(_birthDate))
                            : '',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: const InputDecoration(labelText: 'Cinsiyet'),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Secin')),
                    DropdownMenuItem(value: 'MALE', child: Text('Erkek')),
                    DropdownMenuItem(value: 'FEMALE', child: Text('Kadin')),
                    DropdownMenuItem(value: 'OTHER', child: Text('Diger')),
                  ],
                  onChanged: (v) => setState(() => _gender = v),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _identityNumber,
                  decoration: const InputDecoration(labelText: 'TC Kimlik No'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _bloodType,
                  decoration: const InputDecoration(labelText: 'Kan Grubu'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Secin')),
                    ..._bloodTypes.map((bt) =>
                        DropdownMenuItem(value: bt, child: Text(bt))),
                  ],
                  onChanged: (v) => setState(() => _bloodType = v),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _address,
                  decoration: const InputDecoration(labelText: 'Adres'),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _allergies,
                  decoration: const InputDecoration(labelText: 'Alerjiler'),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _chronicDiseases,
                  decoration:
                      const InputDecoration(labelText: 'Kronik Hastaliklar'),
                  maxLines: 2,
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
