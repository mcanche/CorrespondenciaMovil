//
//  Usuario.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 08/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//
/**
* Created by ebllanes on 10/04/2015.
*/
import Alamofire

class Usuario
{
    //URL
    private let urlusuario = "\(urlservidor)/get_usuario.php"
    // La respuesta del JSON es
    //var static final String TYPE_REQUEST = "POST";
    private let jsonexito = "success"
    private let jsonmensaje = "mensaje"
    private let jsonusuario = "usuario"
    private let jsonpwd = "contrase"
    /*Propiedades del objeto*/
    private var usuario: String;
    private var password: String;
    private var mensaje: String;
    private var persona: Persona?;
    private var perfil: Perfil?;
    private var nivel: Nivel?;
    private var depto: Depto?;
    
    /*Funciones Getters y setters*/
    func setUsuario( _usuario: String)
    {
        self.usuario = _usuario;
    }
    func getUsuario() -> String
    {
        return self.usuario;
    }
    func setContrasena( _password : String)
    {
        self.password=_password;
    }
    /*
    func getContrasena() ->String
    {
        return self.password;
    }*/
    func getMensaje() -> String
    {
        return self.mensaje;
    }
    func getPersona() -> Persona
    {
        return self.persona!;
    }
    func getPerfil() -> Perfil
    {
        return self.perfil!;
    }
    func getNivel() -> Nivel
    {
        return self.nivel!;
    }
    func getDepto() -> Depto
    {
        return self.depto!;
    }
    /*Constructores y destructores*/
    init()
    {
        self.usuario = ""
        self.password = ""
        self.mensaje = ""
    }
    init( _usuario: String, _password: String)
    {
        self.usuario = _usuario
        self.password = _password
        self.mensaje = ""
    }
    
    /*Funciones/Métodos*/
    func leerDatosUsuario() -> Bool
    {
        var resultado: Bool = false;
        let parametros =
        [
            jsonusuario : self.usuario,
            jsonpwd : self.password
        ]
        Alamofire.request(.POST, self.urlusuario,parameters: parametros).responseJSON()
            {
                (_, _, JSON, error) in
                if error == nil
                {
                    let info =  JSON as! NSDictionary
                    var exito: Int = (info[self.jsonexito] as? Int)!
                    //println(info)
                    if( exito == Int(Estado.EXITO.rawValue) )
                    {
                        println((info["usuarios"] as! NSArray).objectAtIndex(0)["apm"] as! String)
                        
                    }
                    else
                    {
                        //self.mensajeError()
                    }
                }
                else
                {
                    println(error)
                    //self.mensajeError()
                }
        }
        /*
        try
            {
                json = self.makeHttpRequest(Recursos.leerValorRecurso(self.context,URL_USUARIO), TYPE_REQUEST, params);
                resultado = json.getInt(self.tokenexito) == Enumerados.Estado.EXITO.getValor() ;
                if(resultado)
                {
                    JSONArray datos = json.getJSONArray("usuarios");
                    self.persona = Mapeos.MapearPersona(self.context,datos);
                    self.perfil = Mapeos.MapearPerfil(self.context,datos);
                    self.nivel = Mapeos.MapearNivel(self.context,datos);
                    self.depto = Mapeos.MapearDepto(self.context,datos);
                    Enumerados.Perfiles usuarioperfil = Enumerados.Perfiles.leerPerfil(self.perfil.getID().byteValue());
                    resultado = usuarioperfil.getValido();
                    self.mensaje = resultado ? self.mensaje : "Usuario con perfil no valido en el sistema." ;
                }
                json=null;
        }
        catch (JSONException e)
        {
            e.printStackTrace();
        }
        params = null;
        */
        return resultado;
        
    }
}
