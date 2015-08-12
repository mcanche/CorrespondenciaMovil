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
                        _vista.ocultarEspera()
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
        
    }
    func responderCorrespondencia( _docto: Documento ) -> Bool
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
    /*
    public boolean responderCorrespondencia(Documento _docto)
    {
        boolean resultado = false;
        List params = new ArrayList();
        JSONObject json;
        params.add(new BasicNameValuePair("cId", String.valueOf(_docto.getFolio())));
        params.add(new BasicNameValuePair("respuesta", String.valueOf(_docto.getRespuesta())));
        params.add(new BasicNameValuePair("fecresp", String.valueOf(_docto.getFechaRespuesta())));
        params.add(new BasicNameValuePair("idval", String.valueOf(self.usuario.getPersona().getID())));
        try
            {
                json = self.makeHttpRequest(Recursos.leerValorRecurso(self.context,URL_DOCTORESPONDER), TYPE_REQUEST, params);
                self.mensaje = json.getString(self.tokenmensaje);
                self.mensaje = self.mensaje==null ? "" : self.mensaje;
                resultado = json.getInt(self.tokenexito) == Enumerados.Estado.EXITO.getValor();
                if(resultado)
                {
                    String tablanom = "validadorpend";
                    TablaSQLite tabla = new TablaSQLite(self.context, tablanom);
                    FiltroSQL filtro = new FiltroSQL("folio", Enumerados.OperadoresLogicos.IGUAL, String.valueOf(_docto.getFolio()));
                    Hashtable<String,FiltroSQL> filtros=new Hashtable<String,FiltroSQL>();
                    filtros.put("folio",filtro);
                    tabla.borrarBD(filtros);
                }
        }
        catch (JSONException e)
        {
            e.printStackTrace();
        }
        params = null;json=null;
        return resultado;
    }
    */
}