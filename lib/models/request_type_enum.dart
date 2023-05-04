enum RequestTypeEnum {
  current('current.json'),
  forecast('forecast.json');

  final String value;

  const RequestTypeEnum(this.value);
}
