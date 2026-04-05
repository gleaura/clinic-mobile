import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/appointments/domain/appointment_model.dart';
import 'package:clinic_mobile/features/staff/data/staff_repository.dart';
import 'package:clinic_mobile/features/staff/domain/staff_model.dart';

class AppointmentFormDialog extends StatefulWidget {
  final Appointment? appointment;
  final Future<void> Function(Object request) onSave;
  final Dio dio;

  const AppointmentFormDialog(
      {super.key, this.appointment, required this.onSave, required this.dio});

  @override
  State<AppointmentFormDialog> createState() => _AppointmentFormDialogState();
}

class _AppointmentFormDialogState extends State<AppointmentFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _patientId;
  late final TextEditingController _durationMinutes;
  late final TextEditingController _type;
  late final TextEditingController _note;
  DateTime? _appointmentDate;
  int? _selectedStaffId;
  List<Staff> _staffList = [];
  bool _saving = false;

  bool get isEditing => widget.appointment != null;

  @override
  void initState() {
    super.initState();
    final a = widget.appointment;
    _patientId = TextEditingController(text: a?.patientId.toString());
    _durationMinutes =
        TextEditingController(text: a?.durationMinutes?.toString());
    _type = TextEditingController(text: a?.type);
    _note = TextEditingController(text: a?.note);
    _appointmentDate = fromApiDateTime(a?.appointmentDate);
    _selectedStaffId = a?.staffId;
    _loadStaff();
  }

  Future<void> _loadStaff() async {
    try {
      final repo = StaffRepository(dio: widget.dio);
      final res = await repo.getStaffList(page: 0, size: 1000, status: 'ACTIVE');
      if (mounted) setState(() => _staffList = res.content);
    } catch (_) {}
  }

  @override
  void dispose() {
    _patientId.dispose();
    _durationMinutes.dispose();
    _type.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickAppointmentDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _appointmentDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null || !mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _appointmentDate != null
          ? TimeOfDay.fromDateTime(_appointmentDate!)
          : TimeOfDay.now(),
    );
    if (pickedTime == null) return;

    setState(() {
      _appointmentDate = DateTime(
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
    if (_appointmentDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Randevu tarihi secin'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final duration = _durationMinutes.text.trim().isNotEmpty
          ? int.tryParse(_durationMinutes.text.trim())
          : null;

      if (isEditing) {
        await widget.onSave(UpdateAppointmentRequest(
          appointmentDate: toApiDateTime(_appointmentDate)!,
          durationMinutes: duration,
          staffId: _selectedStaffId,
          type: _type.text.trim().isEmpty ? null : _type.text.trim(),
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      } else {
        await widget.onSave(CreateAppointmentRequest(
          patientId: int.parse(_patientId.text.trim()),
          appointmentDate: toApiDateTime(_appointmentDate)!,
          durationMinutes: duration,
          staffId: _selectedStaffId,
          type: _type.text.trim().isEmpty ? null : _type.text.trim(),
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                isEditing ? 'Randevu guncellendi' : 'Randevu olusturuldu'),
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
                      isEditing ? 'Randevu Duzenle' : 'Yeni Randevu',
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
                    controller: _patientId,
                    decoration:
                        const InputDecoration(labelText: 'Hasta ID'),
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
                GestureDetector(
                  onTap: _pickAppointmentDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Randevu Tarihi',
                        hintText: _appointmentDate != null
                            ? formatDateTime(toApiDateTime(_appointmentDate))
                            : 'Secin',
                        suffixIcon: const Icon(Icons.calendar_today, size: 18),
                      ),
                      controller: TextEditingController(
                        text: _appointmentDate != null
                            ? formatDateTime(toApiDateTime(_appointmentDate))
                            : '',
                      ),
                      validator: (_) =>
                          _appointmentDate == null ? 'Zorunlu alan' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _durationMinutes,
                  decoration:
                      const InputDecoration(labelText: 'Sure (dakika)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  value: _selectedStaffId,
                  decoration: const InputDecoration(labelText: 'Personel'),
                  items: _staffList.map((s) => DropdownMenuItem(
                    value: s.id,
                    child: Text('${s.firstName} ${s.lastName}${s.title != null ? ' (${s.title})' : ''}'),
                  )).toList(),
                  onChanged: (v) => setState(() => _selectedStaffId = v),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _type,
                  decoration: const InputDecoration(labelText: 'Tur'),
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
