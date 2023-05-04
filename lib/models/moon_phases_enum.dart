enum MoonPhasesEnum {
  newMoon('New Moon'),
  waxingCrescent('Waxing Crescent'),
  firstQuarter('First Quarter'),
  waxingGibbous('Waxing Gibbous'),
  fullMoon('Full Moon'),
  waningGibbous('Waning Gibbous'),
  lastQuarter('Last Quarter'),
  waningCrescent('Waning Crescent');

  final String value;

  static const Map<MoonPhasesEnum, String> moonPhaseImageMap = {
    MoonPhasesEnum.newMoon: 'new_moon',
    MoonPhasesEnum.waxingCrescent: 'waxing_crescent',
    MoonPhasesEnum.firstQuarter: 'first_quarter',
    MoonPhasesEnum.waxingGibbous: 'waxing_gibbous',
    MoonPhasesEnum.fullMoon: 'full_moon',
    MoonPhasesEnum.waningGibbous: 'waning_gibbous',
    MoonPhasesEnum.lastQuarter: 'last_quarter',
    MoonPhasesEnum.waningCrescent: 'waning_crescent',
  };

  const MoonPhasesEnum(this.value);
}
