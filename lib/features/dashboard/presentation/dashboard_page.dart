import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/auth/presentation/auth_provider.dart';
import 'package:clinic_mobile/features/appointments/data/appointment_repository.dart';
import 'package:clinic_mobile/features/appointments/domain/appointment_model.dart';
import 'package:intl/intl.dart';

const _timelineStart = 8;
const _timelineEnd = 20;
const _totalHours = _timelineEnd - _timelineStart;

const _statusColors = <String, Color>{
  'SCHEDULED': Color(0xFF7A9EC4),
  'COMPLETED': Color(0xFF6AA884),
  'CANCELLED': Color(0xFFC46A78),
  'NO_SHOW': Color(0xFFC49A6A),
};

const _statusLabels = <String, String>{
  'SCHEDULED': 'Planlandi',
  'COMPLETED': 'Tamamlandi',
  'CANCELLED': 'Iptal',
  'NO_SHOW': 'Gelmedi',
};

/// Parse "yyyyMMddHHmmss" manually without intl locale issues
DateTime? _parseAppointmentDate(String? value) {
  if (value == null || value.length < 14) return null;
  try {
    final y = int.parse(value.substring(0, 4));
    final m = int.parse(value.substring(4, 6));
    final d = int.parse(value.substring(6, 8));
    final h = int.parse(value.substring(8, 10));
    final min = int.parse(value.substring(10, 12));
    final s = int.parse(value.substring(12, 14));
    return DateTime(y, m, d, h, min, s);
  } catch (_) {
    return null;
  }
}

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  DateTime _selectedDate = DateTime.now();
  List<Appointment> _dailyAppointments = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchDailyAppointments());
  }

  Future<void> _fetchDailyAppointments() async {
    if (!mounted) return;
    setState(() => _loading = true);
    try {
      final dio = ref.read(dioProvider);
      final repo = AppointmentRepository(dio: dio);
      final dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate);
      final list = await repo.getDailyAppointments(dateStr);
      if (mounted) setState(() => _dailyAppointments = list);
    } catch (_) {}
    if (mounted) setState(() => _loading = false);
  }

  void _goToPrevDay() {
    setState(() => _selectedDate = _selectedDate.subtract(const Duration(days: 1)));
    _fetchDailyAppointments();
  }

  void _goToNextDay() {
    setState(() => _selectedDate = _selectedDate.add(const Duration(days: 1)));
    _fetchDailyAppointments();
  }

  void _goToToday() {
    setState(() => _selectedDate = DateTime.now());
    _fetchDailyAppointments();
  }

  bool get _isToday {
    final now = DateTime.now();
    return _selectedDate.year == now.year &&
        _selectedDate.month == now.month &&
        _selectedDate.day == now.day;
  }

  Map<String, List<Appointment>> _groupByStaff() {
    final map = <String, List<Appointment>>{};
    for (final a in _dailyAppointments) {
      final key = a.staffFullName ?? 'Atanmamis';
      map.putIfAbsent(key, () => []);
      map[key]!.add(a);
    }
    // Sort: named staff first, "Atanmamis" last
    final sorted = Map.fromEntries(
      map.entries.toList()
        ..sort((a, b) => a.key == 'Atanmamis'
            ? 1
            : b.key == 'Atanmamis'
                ? -1
                : a.key.compareTo(b.key)),
    );
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final username = ref.watch(authProvider.select((s) => s.valueOrNull?.username));
    final staffGroups = _groupByStaff();

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hos geldiniz, ${username ?? ''}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Klinik yonetim paneline genel bakis',
            style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),
          _buildStatsGrid(),
          const SizedBox(height: 24),
          _buildTimelineCard(staffGroups),
        ],
      ),
    );
  }

  Widget _buildTimelineCard(Map<String, List<Appointment>> staffGroups) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient top bar
          Container(
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC4789A), Color(0xFF9C6AC4)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with date navigation
                _buildTimelineHeader(),
                const SizedBox(height: 4),
                // Legend
                _buildLegend(),
                const SizedBox(height: 16),
                // Content
                if (_loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    ),
                  )
                else if (staffGroups.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        'Randevu bulunmuyor',
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                    ),
                  )
                else
                  _buildTimeline(staffGroups),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineHeader() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFF5EAFE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.calendar_today, color: Color(0xFF9C6AC4), size: 16),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isToday ? 'Bugunku Randevular' : 'Randevular',
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.textPrimary),
              ),
              Text(
                '${DateFormat('dd.MM.yyyy').format(_selectedDate)} — ${_dailyAppointments.length} randevu',
                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        // Date navigation
        _buildNavButton(Icons.chevron_left, _goToPrevDay),
        if (!_isToday) ...[
          const SizedBox(width: 4),
          GestureDetector(
            onTap: _goToToday,
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF5F8),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFF5D8E5)),
              ),
              child: const Center(
                child: Text(
                  'Bugun',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
              ),
            ),
          ),
        ],
        const SizedBox(width: 4),
        _buildNavButton(Icons.chevron_right, _goToNextDay),
      ],
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFFDF5F8),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFF5D8E5)),
        ),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 12,
      children: _statusLabels.entries.map((e) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _statusColors[e.key],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 4),
            Text(e.value, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTimeline(Map<String, List<Appointment>> staffGroups) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 700,
        child: Column(
          children: [
            // Hour headers
            Row(
              children: [
                const SizedBox(width: 100),
                Expanded(
                  child: Row(
                    children: List.generate(_totalHours + 1, (i) {
                      final h = _timelineStart + i;
                      return Expanded(
                        flex: h < _timelineEnd ? 1 : 0,
                        child: Text(
                          '${h.toString().padLeft(2, '0')}:00',
                          style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Staff rows
            ...staffGroups.entries.map((entry) => _buildStaffRow(entry.key, entry.value)),
          ],
        ),
      ),
    );
  }

  Widget _buildStaffRow(String staffName, List<Appointment> appointments) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFF5E0EA), width: 1)),
      ),
      height: 48,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                staffName,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final totalWidth = constraints.maxWidth;
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF5F8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      // Grid lines
                      ...List.generate(_totalHours + 1, (i) {
                        final h = _timelineStart + i;
                        final left = ((h - _timelineStart) / _totalHours) * totalWidth;
                        return Positioned(
                          left: left,
                          top: 0,
                          bottom: 0,
                          child: Container(width: 1, color: const Color(0xFFF0D0E0)),
                        );
                      }),
                      // Appointment bars
                      ...appointments.map((appt) => _buildBar(appt, totalWidth)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(Appointment appt, double totalWidth) {
    final dt = _parseAppointmentDate(appt.appointmentDate);
    if (dt == null) return const SizedBox.shrink();

    final hour = dt.hour + dt.minute / 60.0;
    final duration = appt.durationMinutes ?? 30;
    final leftPct = (hour - _timelineStart) / _totalHours;
    final widthPct = (duration / 60.0) / _totalHours;

    final left = (leftPct.clamp(0.0, 1.0)) * totalWidth;
    final width = (widthPct.clamp(0.01, 1.0 - leftPct.clamp(0.0, 1.0))) * totalWidth;
    final color = _statusColors[appt.status] ?? AppColors.textSecondary;
    final timeStr = '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    return Positioned(
      left: left,
      top: 4,
      bottom: 4,
      width: width,
      child: GestureDetector(
        onTap: () => _showAppointmentDetail(appt, timeStr),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.centerLeft,
          child: Text(
            '$timeStr ${appt.patientFullName}',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  void _showAppointmentDetail(Appointment appt, String timeStr) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _statusColors[appt.status],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _statusLabels[appt.status] ?? appt.status,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              appt.patientFullName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            _detailRow(Icons.access_time, '$timeStr — ${appt.durationMinutes ?? 30} dk'),
            if (appt.staffFullName != null)
              _detailRow(Icons.person_outline, appt.staffFullName!),
            if (appt.type != null && appt.type!.isNotEmpty)
              _detailRow(Icons.medical_services_outlined, appt.type!),
            if (appt.note != null && appt.note!.isNotEmpty)
              _detailRow(Icons.notes, appt.note!),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    const cards = [
      _StatCard(
        title: 'Hastalar',
        description: 'Kayitli hasta sayisi',
        icon: Icons.people_outline,
        accentColor: Color(0xFFC4789A),
        iconBackground: Color(0xFFFDE8F0),
      ),
      _StatCard(
        title: 'Randevular',
        description: 'Aktif randevu sayisi',
        icon: Icons.calendar_today_outlined,
        accentColor: Color(0xFF9C6AC4),
        iconBackground: Color(0xFFF5EAFE),
      ),
      _StatCard(
        title: 'Tedaviler',
        description: 'Uygulanan tedavi sayisi',
        icon: Icons.medical_services_outlined,
        accentColor: Color(0xFFC46AB4),
        iconBackground: Color(0xFFFDE8F8),
      ),
      _StatCard(
        title: 'Kullanicilar',
        description: 'Sistem kullanici sayisi',
        icon: Icons.person_outline,
        accentColor: Color(0xFF6A8AC4),
        iconBackground: Color(0xFFE8F0FD),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: cards.length,
      itemBuilder: (_, i) => cards[i],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final Color iconBackground;

  const _StatCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            color: accentColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: accentColor, size: 22),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
