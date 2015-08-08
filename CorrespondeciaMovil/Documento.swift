//
//  Documento.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 26/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//
/**
* Created by ebllanes on 28/03/2015.
*/

import Foundation

class Documento
{
    /*
    /*Propiedades de clase*/
    private static final String ETIQUETARES_FOLIO = "etiqueta_folio";
    private static final String ETIQUETARES_ANIO = "etiqueta_anio";
    private static final String ETIQUETARES_OFICIO = "etiqueta_oficio";
    private static final String ETIQUETARES_IDESTATUS = "etiqueta_idestatus";
    private static final String ETIQUETARES_ESTATUS = "etiqueta_estatus";
    private static final String ETIQUETARES_ASUNTO = "etiqueta_asunto";
    private static final String ETIQUETARES_SOLICITUD = "etiqueta_solicitud";
    private static final String ETIQUETARES_SOLICITUDABR = "etiqueta_solicitudabr";
    private static final String ETIQUETARES_RECEPCION = "etiqueta_recepcion";
    private static final String ETIQUETARES_RECEPCIONABR = "etiqueta_recepcionabr";
    private static final String ETIQUETARES_IDNIVEL = "etiqueta_idnivel";
    private static final String ETIQUETARES_NIVEL = "etiqueta_nivel";
    private static final String ETIQUETARES_IDDEPTO = "etiqueta_iddepto";
    private static final String ETIQUETARES_DEPTO = "etiqueta_depto";
    */
    /*Propiedades de objeto*/
    /*Propiedades de controls*/
    var tipo: TipoFila;
    var fondo: Bool = false;
    /*Propiedades del objeto*/
    var folio: Int ;
    var of_sol: Int ;
    var asunto: String ;
    var idestatus: Estatus ;
    var estatus: String;
    var anio: Int;
    var solicitud: NSDate;
    var recepcion: NSDate;
    var idnivel: Int;
    var nivel: String;
    var iddepto: Int;
    var depto: String ;
    var respuesta: String;
    var fecharespuesta: String;
    /*Funciones getters and setters*/
    func setTipo( _tipo: TipoFila )
    {
      self.tipo=_tipo;
    }
    func getTipo() -> TipoFila
    {
        return self.tipo;
    }
    func setFolio( _folio: Int)
    {
        self.folio=_folio;
    }
    func getFolio() -> Int
    {
        return self.folio;
    }
    func setOf_sol( _of_sol: Int)
    {
        self.of_sol=_of_sol;
    }
    func getOf_sol() -> Int
    {
        return self.of_sol;
    }
    func setAnio( _anio: Int)
    {
        self.anio=_anio;
    }
    func getAnio() -> Int
    {
        return self.anio;
    }
    func setAsunto( _asunto: String)
    {
        self.asunto=_asunto;
    }
    func getAsunto() -> String
    {
        return self.asunto;
    }
    func setEstatus( _estatus: String)
    {
        self.estatus=_estatus;
    }
    func getEstatus() -> String
    {
        return self.estatus;
    }
    func setIdestatus( _idestatus: Int8)
    {
        self.idestatus=Estatus(_tipo: _idestatus);
    }
    func getIdestatus() -> Estatus
    {
        return self.idestatus;
    }
    func setSolicitud( _solicitud: NSDate)
    {
        self.solicitud=_solicitud;
    }
    func getSolicitud() -> NSDate
    {
        return self.solicitud;
    }
    func setRecepcion( _recepcion: NSDate)
    {
        self.recepcion=_recepcion;
    }
    func getRecepcion() -> NSDate
    {
        return self.recepcion;
    }
    func setIdnivel( _idnivel: Int)
    {
        self.idnivel=_idnivel;
    }
    func getIdnivel() -> Int
    {
        return self.idnivel;
    }
    func setNivel( _nivel: String)
    {
        self.nivel=_nivel;
    }
    func getNivel() -> String
    {
        return self.nivel;
    }
    func setIDdepto( _iddepto: Int)
    {
        self.iddepto=_iddepto;
    }
    func getIDdepto() -> Int
    {
        return self.iddepto;
    }
    func setDepto( _depto: String)
    {
        self.depto=_depto;
    }
    func getDepto() -> String
    {
        return self.depto;
    }
    func setFondo( _fondo: Bool)
    {
        self.fondo=_fondo;
    }
    func getFondo() -> Bool
    {
        return self.fondo;
    }
    func getRespuesta() -> String
    {
        return self.respuesta;
    }
    func setRespuesta( _respuesta: String)
    {
        self.respuesta=_respuesta;
    }
    func getFechaRespuesta() -> String
    {
        return self.fecharespuesta;
    }
    func setFechaRespuesta( _fecharespuesta: String)
    {
        self.fecharespuesta=_fecharespuesta;
    }
    /*Contructores/destructores*/
    /*
    Constructor por defecto
    */
    init()
    {
        tipo = TipoFila(_tipo: 1);
        fondo = false;
        /*Propiedades del objeto*/
        folio = 0 ;
        of_sol = 0 ;
        asunto = "";
        idestatus = Estatus(_tipo: 1) ;
        estatus = "";
        anio = 0
        solicitud = Date.from(year: 1978, month: 01, day: 01);
        recepcion = Date.from(year: 1978, month: 01, day: 01);
        idnivel = 0;
        nivel = "";
        iddepto = 0;
        depto = "";
        respuesta = "";
        fecharespuesta = "";
    }
    init(
        _folio: Int, _anio: Int, _of_sol: Int,
        _idestatus: Int8, _estatus: String, _asunto: String,
        _solicitud: NSDate, _recepcion: NSDate,
        _idnivel: Int, _nivel: String,
        _iddepto: Int, _depto: String,
        _tipo: TipoFila
    )
    {
    self.folio=_folio;
    self.anio=_anio;
    self.of_sol=_of_sol;
    self.idestatus=Estatus(_tipo: _idestatus);
    self.estatus=_estatus;
    self.asunto=_asunto;
    self.solicitud=_solicitud;
    self.recepcion=_recepcion;
    self.idnivel=_idnivel;
    self.nivel=_nivel;
    self.iddepto=_iddepto;
    self.depto=_depto;
    self.tipo=_tipo;
    /*Propiedades adicionales*/
    self.fondo = false;
    self.respuesta = "";
    self.fecharespuesta = "";
    }
    /*
    Funciones del objeto
    */
    func getFolioCompleto() -> String
    {
        return "\(self.folio)/\(self.anio)";
    }
    func getSolicitudFechaFormateada() -> String
    {
        return self.formatearFecha(self.solicitud);
    }
    func getRecepcionFechaFormateada() -> String
    {
        return self.formatearFecha(self.recepcion);
    }
    func formatearFecha(_fecha: NSDate?) -> String
    {
        var cadfecha: String = "";
        var nommeses: NombresMeses = NombresMeses();
        
        if _fecha != nil
        {
            let df: NSDateFormatter = NSDateFormatter();
            
            var flags : NSCalendarUnit = NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear;
            let date = NSDate();
            let components = NSCalendar.currentCalendar().components(flags, fromDate: _fecha!);
            
            let anio = components.year;
            let mes = components.month;
            let dia = components.day;
            var caddia = dia < 10 ? "0\(dia)" : "\(dia)";
            
            cadfecha = "\(caddia)-\(nommeses.meses[mes])-\(dia)";
        }
        
        return cadfecha;
    }

}

class NombresMeses
{
    var meses: [String] =
    [
        "Ene","Feb","Mar",
        "Abr","May","Jun",
        "Jul","Ago","Sep",
        "Oct","Nov","Dic"
    ]
    
    init()
    {
        
    }
}
