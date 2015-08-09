//
//  VistaDocumentos.swift
//  CorrespondenciaMobil
//
//  Created by Apple on 03/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit

class VistaDocumentos: UITabBarController, MenuLateralDelegate
{
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    private var menulat: MenuLateral = MenuLateral()
    private var espera: UIAlertView = UIAlertView()
    
    var usuario: Usuario?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        /*Configurar e inicializar el menú lateral*/
        let elementosmenu: [[String]] = [["Actualizar","MenuAct"],["Resumen semanal","MenuRep"],["Cerrar sesión","MenuSalir"]]
        menulat = MenuLateral (_vistaoriginal: self.view, _elementosmenu: elementosmenu)
        menulat.delegado = self
        /*Fin de configuración del menú lateral*/
        //self.toolbarItems[1].enabled=false;
        
        /*Habilitamos/ deshabilitamos la sección de pendientes*/
        (self.tabBar.items![1] as! UITabBarItem).enabled = self.usuario!.getPerfil().getID().esValidador();

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func menuLateralDidSelectedButtonAtIndex(_index: Int)
    {
        switch(_index)
        {
            case 0:
                break;
            case 1:
                break;
            case 2:
                let vc : AnyObject! = storyboard?.instantiateViewControllerWithIdentifier("Login")
                vc.navigationItem.hidesBackButton = true
                showViewController(vc as! UIViewController, sender: vc)
                break;
            default:
                break;
        }
    }
    
    @IBAction func manejarMenuLateral(sender: UIBarButtonItem)
    {
        menulat.mostrarMenuLateral(!menulat.menulateralabierto)
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
