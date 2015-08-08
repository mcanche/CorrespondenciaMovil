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
    /*Propiedades de objeto*/
    /*Propiedades de controls*/
    private var tipo: TipoFila;
    private var fondo: Bool = false;
    /*Propiedades del objeto*/
    private var folio: Int ;
    private var of_sol: Int ;
    private var asunto: String ;
    private var idestatus: Estatus ;
    private var estatus: String;
    private var anio: Int;
    private var solicitud: NSDate;
    private var recepcion: NSDate;
    private var idnivel: Int;
    private var nivel: String;
    private var iddepto: Int;
    private var depto: String ;
    private var respuesta: String;
    private var fecharespuesta: String;
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
        return Date.formatearFecha(self.solicitud);
    }
    func getRecepcionFechaFormateada() -> String
    {
        return Date.formatearFecha(self.recepcion);
    }
}
