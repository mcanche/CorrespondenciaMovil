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
    
    let urllogin = "\(urlservidor)/login.php"
    let jsonexito = "success"
    let jsonusuario = "username"
    let jsonpwd = "password"
    
    var usuario: Usuario = Usuario();
    
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
    func mensajeError()
    {
        //Código cortesía de:
        //http://www.ioscreator.com/tutorials/display-an-alert-view-in-ios8-with-swift
        let controladoralerta = UIAlertController(title: "Correspondencia Movil: Inicio de sesión", message:
            "Imposible realizar la conexión. Verifique su usuario y/o contraseña e intente de nuevo.", preferredStyle: UIAlertControllerStyle.Alert)
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
        Alamofire.request(.POST, urllogin,parameters: parametros).responseJSON()
        {
            (_, _, JSON, error) in
            if error == nil
            {
                let info =  JSON as! NSDictionary
                var exito: Int = (info[self.jsonexito] as? Int)!
                if( exito == Int(Estado.EXITO.rawValue) )
                {
                    self.leerDatosUsuario();
                    self.performSegueWithIdentifier("verDoctos", sender: nil)
                }
                else
                {
                    self.mensajeError()
                }
            }
            else
            {
                self.mensajeError()
            }
        }
    }
    //Funciones de controles UI
    @IBAction func ingresar(sender: UIButton)
    {
        iniciarSesion()
        
    }
    func leerDatosUsuario()
    {
        self.usuario.setUsuario(objusuario.text);
        self.usuario.setContrasena(objpass.text);
        self.usuario.leerDatosUsuario();
    }
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
    }

}
