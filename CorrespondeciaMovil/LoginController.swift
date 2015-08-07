//
//  LoginController.swift
//  CorrespondenciaMobil
//
//  Created by Apple on 03/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController
{
    
    let urllogin = "http://correomx.raycastudio.com.mx/cas/login.php"
    let jsonexito = "sucess"
    let jsonusuario = "username"
    let jsonpwd = "password"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func iniciarSesion()
    {
        let parametros =
        [
            "username" : "wilbert.echeverria",
            "password" : "12345678"
        ]
        
        Alamofire.request(.POST, urllogin,parameters: parametros).responseJSON()
        {
            (_, _, JSON, error) in
            if error == nil
            {
                let info =  JSON as! NSDictionary
                println(info["message"] as? String)
            }
            else
            {
                println(error)
            }
        }
    }
    
    @IBAction func ingresar(sender: UIButton)
    {
        iniciarSesion()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
