//
//  DoctosRemoto.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 09/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//
/**
* Created by ebllanes on 18/04/2015.
*/

import Alamofire

public class DoctosRemoto
{
    // La respuesta del JSON es
    private let jsonexito = "success"
    private let jsonmensaje = "message"
    /*Propiedades del objeto*/
    private let urldoctos = "\(urlservidor)/get_all_oficiosarespuesta.php"
    private let urldoctosrespuesta = "\(urlservidor)/update_oficiorespuesta.php"
    private let urlreportesemanal = "\(urlservidor)/get_reporte_semana.php"
    
    private var usuario: Usuario?;
    private var mensaje: String?;
    /*Funciones Getters y setters*/
    func getMensaje() -> String
    {
        return self.mensaje!;
    }
    /*Constructores y destructores*/
    private init()
    {
        
    }
    init( _usuario: Usuario)
    {
        self.usuario=_usuario;
    }
    /*Funciones/Métodos*/
    func leerCorrespondencia( _vista: VistaDocumentos)
    {
        let parametros =
        [
            "cId" : self.usuario!.getNivel().getID(),
            "dId" : self.usuario!.getDepto().getID(),
            "jId" : self.usuario!.getPerfil().getID().getID()
        ]

        Alamofire.request(.POST, self.urldoctos,parameters: parametros).responseJSON()
            {
                (_, _response, _JSON, _error) in
                if ( _error == nil )
                {
                    let info =  _JSON as! NSDictionary
                    var exito: Int = (info[self.jsonexito] as? Int)!
                    if( info[self.jsonmensaje] != nil && !(info[self.jsonmensaje] is NSNull) )
                    {
                        self.mensaje = (info[self.jsonmensaje] as? String)!
                    }
                    if( exito == Int(Estado.EXITO.rawValue) )
                    {
                        Mapeos.MapearDoctosRem(info["oficiores"] as! NSArray)
                    }
                    else
                    {
                        println(self.mensaje)
                    }
                    _vista.ocultarEspera()
                }
                else
                {
                    println(_error)
                    _vista.ocultarEspera()
                }
        }
        
    }
    func responderCorrespondencia( _vista: VistaContestar, _docto: Documento ) -> Bool
    {
        var resultado: Bool = false;
        let parametros =
        [
            "cId" : _docto.getFolio(),
            "respuesta" : _docto.getRespuesta(),
            "fecresp" : _docto.getFechaRespuesta(),
            "idval" : self.usuario!.getPersona().getID()
        ]
        
        Alamofire.request(.POST, self.urldoctosrespuesta,parameters: parametros as? [String : AnyObject]).responseJSON()
            {
                (_, _response, _JSON, _error) in
                if ( _error == nil )
                {
                    let info =  _JSON as! NSDictionary
                    var exito: Int = (info[self.jsonexito] as? Int)!
                    if( info[self.jsonmensaje] != nil && !(info[self.jsonmensaje] is NSNull) )
                    {
                        self.mensaje = (info[self.jsonmensaje] as? String)!
                    }
                    if( exito == Int(Estado.EXITO.rawValue) )
                    {
                        _docto.setIdestatus(3)
                        DAO.actualizarDoctoFolio(_docto,_vigente: false)
                        _vista.borrarElementoSel()
                        _vista.regresar()
                    }
                    else
                    {
                        println(self.mensaje)
                    }
                }
                else
                {
                    println(_error)
                }
        }
        return resultado;
    }
    func leerResumen( _vista: VistaReporteSemanal )
    {
        var parametronid: String = self.usuario!.getPerfil().getID().esValidador() ? "4" : "0"
        
        let parametros =
        [
            "nId" : self.usuario!.getNivel().getID()
        ]
        
        Alamofire.request(.POST, self.urlreportesemanal,parameters: parametros).responseJSON()
            {
                (_, _response, _JSON, _error) in
                if ( _error == nil )
                {
                    let info =  _JSON as! NSDictionary
                    var exito: Int = (info[self.jsonexito] as? Int)!
                    if( info[self.jsonmensaje] != nil && !(info[self.jsonmensaje] is NSNull) )
                    {
                        self.mensaje = (info[self.jsonmensaje] as? String)!
                    }
                    if( exito == Int(Estado.EXITO.rawValue) )
                    {
                        Mapeos.MapearResumen(info["tablares"] as! NSArray)
                        _vista.leerReporte()
                    }
                    else
                    {
                        println(self.mensaje)
                    }
                    _vista.ocultarEspera()
                }
                else
                {
                    println(_error)
                    _vista.ocultarEspera()
                }
        }

    }
    
}