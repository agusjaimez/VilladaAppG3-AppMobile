class EnvF {
  final int alumno;
  final String descripcion;
  final String tipoform;
  final String dias;
  final String fecha;
  final String hora;

  EnvF({
    this.alumno,
    this.descripcion,
    this.tipoform,
    this.dias,
    this.fecha,
    this.hora
  });

  factory EnvF.fromJson(Map<String, dynamic> json) {
    return EnvF(
        alumno: json['alumno'],
        descripcion: json['descripcion'],
        tipoform: json['tipo_form'],
        dias: json['dias'],
        fecha: json['fecha'],
        hora: json['hora']);
  }
  dynamic toJson() => {
        'alumno': alumno,
        'descripcion': descripcion,
        'tipo_form': tipoform,
        'dias': dias,
        'fecha': DateTime.parse(fecha),
        'hora' : hora
      };
}