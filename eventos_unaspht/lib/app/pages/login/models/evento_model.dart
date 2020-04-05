

class EventoModel {
  String id;
  String titulo;
  String local;
  String dataInicio;
  String dataFim;
  String horaInicio;
  String horaFim;
  String obs;

  EventoModel(
    this.id,
    this.titulo,
    this.local,
    this.dataInicio,
    this.dataFim,
    this.horaInicio,
    this.horaFim,
    this.obs
  );

  EventoModel.map(dynamic obj) {
    this.id = obj["id"];
    this.titulo = obj["titulo"];
    this.local = obj["local"];
    this.dataInicio = obj["data Inicio"];
    this.dataFim = obj["data Fim"];
    this.horaInicio = obj["hora Inicio"];
    this.horaFim = obj["hora Fim"];  
    this.obs = obj["observações"];
  }

 
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['titulo'] = titulo;
    map['local'] = local;
    map['data Inicio'] = dataInicio;
    map['data Fim'] = dataFim;
    map['hora Inicio'] = horaInicio;
    map['hora fim'] = horaFim;
    map['Observações'] = obs;

    return map;
  }

  EventoModel.fromMap(Map<String, dynamic> map, String id) {
    this.id = '';
    this.titulo = map['titulo'];
    this.local = map['local'];
    this.dataInicio = map['data inicio'];
    this.dataFim = map['data fim'];
    this.horaInicio = map['hora inicio'];
    this.horaFim = map['hora fim'];
    this.obs = map['observações'];
  }

}