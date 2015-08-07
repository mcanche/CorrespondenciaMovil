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
    /*
    /*
    /*Propiedades que guardan las etiquetas*/
    private String folioetiq="";
    private String of_soletiq="";
    private String asuntoetiq="";
    private String idestatusetiq="";
    private String estatusetiq="";
    private String anioetiq="";
    private String solicitudetiq="";
    private String solicitudetiqabr="";
    private String recepcionetiq="";
    private String recepcionetiqabr="";
    private String idniveletiq="";
    private String niveletiq="";
    private String iddeptoetiq="";
    private String deptoetiq="";
    /*Funciones getters and setters*/
    public void setTipo(Enumerados.TipoFila _tipo)
    {
    this.tipo=_tipo;
    }
    public Enumerados.TipoFila getTipo()
    {
    return this.tipo;
    }
    public void setFolio(Integer _folio)
    {
    this.folio=_folio;
    }
    public Integer getFolio()
    {
    return this.folio;
    }
    public void setOf_sol(Integer _of_sol)
    {
    this.of_sol=_of_sol;
    }
    public Integer getOf_sol()
    {
    return this.of_sol;
    }
    public void setAnio(Integer _anio)
    {
    this.anio=_anio;
    }
    public Integer getAnio()
    {
    return this.anio;
    }
    public void setAsunto(String _asunto)
    {
    this.asunto=_asunto;
    }
    public String getAsunto()
    {
    return this.asunto;
    }
    public void setEstatus(String _estatus)
    {
    this.estatus=_estatus;
    }
    public String getEstatus()
    {
    return this.estatus;
    }
    public void setIdestatus(Byte _idestatus)
    {
    this.idestatus=Enumerados.Estatus.leerIDEstatus(_idestatus);
    }
    public Enumerados.Estatus getIdestatus()
    {
    return this.idestatus;
    }
    public void setSolicitud(GregorianCalendar _solicitud)
    {
    this.solicitud=_solicitud;
    }
    public GregorianCalendar getSolicitud()
    {
    return this.solicitud;
    }
    public void setRecepcion(GregorianCalendar _recepcion)
    {
    this.recepcion=_recepcion;
    }
    public GregorianCalendar getRecepcion()
    {
    return this.recepcion;
    }
    public void setIdnivel(Integer _idnivel)
    {
    this.idnivel=_idnivel;
    }
    public Integer getIdnivel()
    {
    return this.idnivel;
    }
    public void setNivel(String _nivel)
    {
    this.nivel=_nivel;
    }
    public String getNivel()
    {
    return this.nivel;
    }
    public void setIDdepto(Integer _iddepto)
    {
    this.iddepto=_iddepto;
    }
    public Integer getIDdepto()
    {
    return this.iddepto;
    }
    public void setDepto(String _depto)
    {
    this.depto=_depto;
    }
    public String getDepto()
    {
    return this.depto;
    }
    public void setFondo(boolean _fondo)
    {
    this.fondo=_fondo;
    }
    public boolean getFondo()
    {
    return this.fondo;
    }
    public String getRespuesta()
    {
    return this.respuesta;
    }
    public void setRespuesta(String _respuesta)
    {
    this.respuesta=_respuesta;
    }
    public String getFechaRespuesta()
    {
    return this.fecharespuesta;
    }
    public void setFechaRespuesta(String _fecharespuesta)
    {
    this.fecharespuesta=_fecharespuesta;
    }
    /*Getters de etiquetas*/
    public String getEtiquetaFolio()
    {
    return this.folioetiq;
    }
    public String getEtiquetaOficio()
    {
    return this.of_soletiq;
    }
    public String getEtiquetaAsunto()
    {
    return this.asuntoetiq;
    }
    public String getEtiquetaIdestatus()
    {
    return this.idestatusetiq;
    }
    public String getEtiquetaEstatus()
    {
    return this.estatusetiq;
    }
    public String getEtiquetaAnio()
    {
    return this.anioetiq;
    }
    public String getEtiquetaSolicitud()
    {
    return this.solicitudetiq;
    }
    public String getEtiquetaSolicitudabr()
    {
    return this.solicitudetiqabr;
    }
    public String getEtiquetaRecepcion()
    {
    return this.recepcionetiq;
    }
    public  String getEtiquetaRecepcionabr()
    {
    return this.recepcionetiqabr;
    }
    public String getEtiquetaIdnivel()
    {
    return this.idniveletiq;
    }
    public String getEtiquetaNivel()
    {
    return this.niveletiq;
    }
    public String getEtiquetaIdDepto()
    {
    return this.iddeptoetiq;
    }
    public String getEtiquetaDepto()
    {
    return this.deptoetiq;
    }
    /*Contructores/destructores*/
    /*
    Constructor por defecto
    */
    public Documento()
    {
    inicializarEtiquetas();
    }
    public Documento(
    Integer _folio, Integer _anio, Integer _of_sol,
    Byte _idestatus, String _estatus, String _asunto,
    GregorianCalendar _solicitud, GregorianCalendar _recepcion,
    Integer _idnivel, String _nivel,
    Integer _iddepto, String _depto,
    Enumerados.TipoFila _tipo
    )
    {
    this.folio=_folio;
    this.anio=_anio;
    this.of_sol=_of_sol;
    this.idestatus=Enumerados.Estatus.leerIDEstatus(_idestatus);
    this.estatus=_estatus;
    this.asunto=_asunto;
    this.solicitud=_solicitud;
    this.recepcion=_recepcion;
    this.idnivel=_idnivel;
    this.nivel=_nivel;
    this.iddepto=_iddepto;
    this.depto=_depto;
    this.tipo=_tipo;
    this.inicializarEtiquetas();
    }
    /*
    Funciones del objeto
    */
    public String getFolioCompleto()
    {
    return String.valueOf(this.folio)+"/"+String.valueOf(this.anio);
    }
    public String getSolicitudFechaFormateada()
    {
    return this.formatearFecha(this.solicitud);
    }
    public String getRecepcionFechaFormateada()
    {
    return this.formatearFecha(this.recepcion);
    }
    private void inicializarEtiquetas()
    {
    //Recursos.leerRecursoGrafico(this.context, ETIQUETA_FONDONORMAL);
    this.folioetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_FOLIO);
    this.of_soletiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_OFICIO);
    this.asuntoetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_ASUNTO);
    this.idestatusetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_IDESTATUS);
    this.estatusetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_ESTATUS);;
    this.anioetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_ANIO);
    this.solicitudetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_SOLICITUD);
    this.solicitudetiqabr= Recursos.leerValorRecurso(this.context, ETIQUETARES_SOLICITUDABR);
    this.recepcionetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_RECEPCION);
    this.recepcionetiqabr= Recursos.leerValorRecurso(this.context, ETIQUETARES_RECEPCIONABR);
    this.idniveletiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_IDNIVEL);
    this.niveletiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_NIVEL);
    this.iddeptoetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_IDDEPTO);
    this.deptoetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_DEPTO);
    this.anioetiq= Recursos.leerValorRecurso(this.context, ETIQUETARES_ANIO);
    }
    private String formatearFecha(GregorianCalendar _fecha)
    {
    String cadfecha="";
    Integer dia=0;
    
    if( _fecha != null )
    {
    dia=_fecha.get(Calendar.DAY_OF_MONTH);
    cadfecha = dia<10 ? "0" + String.valueOf(dia) : String.valueOf(dia);
    cadfecha += NombresMeses.meses[_fecha.get(Calendar.MONTH)];
    cadfecha += "-"+String.valueOf(_fecha.get(Calendar.YEAR));
    }
    
    return cadfecha;
    }

    */
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

