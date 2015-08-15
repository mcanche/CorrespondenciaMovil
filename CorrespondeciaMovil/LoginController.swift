//
//  LoginController.swift
//  CorrespondenciaMobil
//
//  Created by Apple on 03/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
import Alamofire

/*
doctos get_all_oficiosarespuesta.php
doctosresp update_oficiorespuesta.php
resumen get_reporte_semana.php
*/

class LoginController: UIViewController
{
    @IBOutlet weak var objusuario: UITextField!
    @IBOutlet weak var objpass: UITextField!
    @IBOutlet weak var biniciarsesion: UIButton!
    
    /************Identificadores segue************/
    private var doctossegueid: String = "verDoctos";
    
    private let urllogin = "\(urlservidor)/login.php"
    private let jsonexito = "success"
    private let jsonusuario = "username"
    private let jsonpwd = "password"
    private var usuario: Usuario = Usuario();
    
    private var espera: UIAlertView = UIAlertView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    //Funciones touch
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }
    //UITextFieldDelegate
    func textFieldShouldReturn(_textField: UITextField) -> Bool
    {
        _textField.resignFirstResponder()
        return true
    }
    /*Funciones personalizadas del sistema*/
    func mensajeError(_mensaje: String?)
    {
        //Código cortesía de:
        //http://www.ioscreator.com/tutorials/display-an-alert-view-in-ios8-with-swift
        var mensaje: String = ""
        if(_mensaje == nil)
        {
            mensaje = "Imposible realizar la conexión. Verifique su usuario y/o contraseña e intente de nuevo."
        }
        else
        {
            mensaje = _mensaje!
        }
        let controladoralerta = UIAlertController(title: "Correspondencia Movil: Inicio de sesión", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        controladoralerta.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))

        self.presentViewController(controladoralerta, animated: true, completion: nil)
    }
    
    func iniciarSesion()
    {

        let parametros =
        [
            jsonusuario : objusuario.text,
            jsonpwd : objpass.text
        ]
        Alamofire.request(.POST, urllogin,parameters: parametros).validate().responseJSON()
        {
            (_, _response, _JSON, _error) in
            if ( _error == nil )
            {
                let info =  _JSON as! NSDictionary
                var exito: Int = (info[self.jsonexito] as? Int)!
                if( exito == Int(Estado.EXITO.rawValue) )
                {
                    self.leerDatosUsuario();
                }
                else
                {
                    Espera.ocultarEspera(&self.espera);
                    self.mensajeError(nil)
                    self.biniciarsesion.enabled = true;
                }
            }
            else
            {
                Espera.ocultarEspera(&self.espera);
                self.mensajeError(nil)
            }
        }
    }
    //Funciones de controles UI
    @IBAction func ingresar(sender: UIButton)
    {
        //self.biniciarsesion.userInteractionEnabled = false;
        self.biniciarsesion.enabled = false;
        Espera.mostrarEspera(&self.espera,_mensaje: "Validando sus datos...")
        self.iniciarSesion()
        
    }
    func leerDatosUsuario()
    {
        self.usuario.setUsuario(objusuario.text);
        self.usuario.setContrasena(objpass.text);
        self.usuario.leerDatosUsuario(self);

    }
    //Si es un perfil valido iniciamos el serge
    func validarPerfilUsuario()
    {
        Espera.ocultarEspera(&self.espera);
        if ( self.usuario.getPerfil().getID().getValido() )
        {
            self.performSegueWithIdentifier(self.doctossegueid, sender: nil)
        }
        else
        {
            self.mensajeError(self.usuario.getMensaje());
        }
        self.biniciarsesion.enabled = true;
    }
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using [segue destinationViewController].
        if(segue.identifier == self.doctossegueid)
        {
            let vistadocs : VistaDocumentos = segue.destinationViewController as! VistaDocumentos
            vistadocs.usuario = self.usuario;
        }
    }

}
