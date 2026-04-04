import 'package:flutter/material.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/treatments/domain/treatment_model.dart';

class TreatmentFormDialog extends StatefulWidget {
  final Treatment? treatment;
  final Future<void> Function(Object request) onSave;

  const TreatmentFormDialog(
      {super.key, this.treatment, required this.onSave});

  @override
  State<TreatmentFormDialog> createState() => _TreatmentFormDialogState();
}

class _TreatmentFormDialogState extends State<TreatmentFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _appointmentId;
  late final TextEditingController _name;
  late final TextEditingController _description;
  late final TextEditingController _cost;
  late final TextEditingController _note;
  DateTime? _treatmentDate;
  String? _currency;
  bool _saving = false;

  bool get isEditing => widget.treatment != null;

  static const _currencies = ['TRY', 'USD', 'EUR'];

  @override
  void initState() {
    super.initState();
    final t = widget.treatment;
    _appointmentId = TextEditingController(text: t?.appointmentId.toString());
    _name = TextEditingController(text: t?.name);
    _description = TextEditingController(text: t?.description);
    _cost = TextEditingController(text: t?.cost?.toString());
    _note = TextEditingController(text: t?.note);
    _treatmentDate = fromApiDateTime(t?.treatmentDate);
    _currency = t?.currency;
  }

  @override
  void dispose() {
    _appointmentId.dispose();
    _name.dispose();
    _description.dispose();
    _cost.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickTreatmentDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _treatmentDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null || !mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _treatmentDate != null
          ? TimeOfDay.fromDateTime(_treatmentDate!)
          : TimeOfDay.now(),
    );
    if (pickedTime == null) return;

    setState(() {
      _treatmentDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    if (_treatmentDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tedavi tarihi secin'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final costValue = _cost.text.trim().isNotEmpty
          ? double.tryParse(_cost.text.trim())
          : null;

      if (isEditing) {
        await widget.onSave(UpdateTreatmentRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty
              ? null
              : _description.text.trim(),
          treatmentDate: toApiDateTime(_treatmentDate)!,
          cost: costValue,
          currency: _currency,
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      } else {
        await widget.onSave(CreateTreatmentRequest(
          appointmentId: int.parse(_appointmentId.text.trim()),
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty
              ? null
              : _description.text.trim(),
          treatmentDate: toApiDateTime(_treatmentDate)!,
          cost: costValue,
          currency: _currency,
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                isEditing ? 'Tedavi guncellendi' : 'Tedavi olusturuldu'),
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
                      isEditing ? 'Tedavi Duzenle' : 'Yeni Tedavi',
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
                if (!isEditing) ...[
                  TextFormField(
                    controller: _appointmentId,
                    decoration:
                        const InputDecoration(labelText: 'Randevu ID'),
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Zorunlu alan';
                      if (int.tryParse(v.trim()) == null) {
                        return 'Gecerli bir sayi girin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                ],
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'Tedavi Adi'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _pickTreatmentDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tedavi Tarihi',
                        hintText: _treatmentDate != null
                            ? formatDateTime(toApiDateTime(_treatmentDate))
                            : 'Secin',
                        suffixIcon: const Icon(Icons.calendar_today, size: 18),
                      ),
                      controller: TextEditingController(
                        text: _treatmentDate != null
                            ? formatDateTime(toApiDateTime(_treatmentDate))
                            : '',
                      ),
                      validator: (_) =>
                          _treatmentDate == null ? 'Zorunlu alan' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Aciklama'),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _cost,
                  decoration: const InputDecoration(labelText: 'Ucret'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _currency,
                  decoration: const InputDecoration(labelText: 'Para Birimi'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Secin')),
                    ..._currencies.map(
                        (c) => DropdownMenuItem(value: c, child: Text(c))),
                  ],
                  onChanged: (v) => setState(() => _currency = v),
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
