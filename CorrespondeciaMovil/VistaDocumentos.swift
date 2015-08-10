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
    private var doctos: DoctosRemoto?;
    
    private var itemseltag: Int = 0;
    private var itemseltitle: String = "";
    
    var usuario: Usuario?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        /*Configurar e inicializar el menú lateral*/
        let elementosmenu: [[String]] = [["Actualizar","MenuAct"],["Resumen semanal","MenuRep"],["Cerrar sesión","MenuSalir"]]
        menulat = MenuLateral (_vistaoriginal: self.view, _elementosmenu: elementosmenu)
        menulat.delegado = self
        /*Fin de configuración del menú lateral*/
        /*Habilitamos/ deshabilitamos la sección de pendientes*/
        (self.tabBar.items![1] as! UITabBarItem).enabled = self.usuario!.getPerfil().getID().esValidador();
        if( self.usuario!.getPerfil().getID().esValidador() )
        {
            self.selectedIndex=1
        }
        self.leerCorrespondencia()
    }
    func leerCorrespondencia()
    {
        Espera.mostrarEspera(&self.espera,_mensaje: "Leyendo información, espere un momento...")
        /*Leemos documentos remotos*/
        doctos=DoctosRemoto(_usuario: self.usuario!);
        doctos?.leerCorrespondencia(self);
    }
    func ocultarEspera()
    {
        self.selectedViewController?.viewDidAppear(true)
        Espera.ocultarEspera(&self.espera);
    }
    
    func getItemSelTag() -> Int
    {
        return self.itemseltag;
    }
    
    func getItemSelTitle() -> String
    {
        return self.itemseltitle;
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
                self.leerCorrespondencia()
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

    override func tabBar(_tabBar: UITabBar, didSelectItem _item: UITabBarItem!)
    {
        self.itemseltag = Int(_item.tag);
        self.itemseltitle = _item.title!
        
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    */

}
