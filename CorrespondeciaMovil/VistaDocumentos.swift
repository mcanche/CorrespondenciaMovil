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
    /************Identificadores segue************/
    private var segueiddet: String = "doctocontestar";
    
    private var menulat: MenuLateral = MenuLateral()
    private var espera: UIAlertView = UIAlertView()
    private var doctos: DoctosRemoto?;
    private var esvalidador: Bool = false;
    
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
        self.esvalidador = self.usuario!.getPerfil().getID().esValidador()
        self.iniciarValidador( self.esvalidador )
        self.leerCorrespondencia()
    }
    func iniciarValidador( _esvalidador: Bool)
    {
        /*Habilitamos/ deshabilitamos la sección de pendientes*/
        (self.tabBar.items![1] as! UITabBarItem).enabled = _esvalidador;
        self.navigationItem.rightBarButtonItem?.enabled = _esvalidador;
        if( _esvalidador )
        {
            self.selectedIndex=1
        }
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
        self.navigationItem.rightBarButtonItem?.enabled = self.esvalidador && self.itemseltag == 2
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using [segue destinationViewController].
        if(segue.identifier == self.segueiddet)
        {
            let vistadet : VistaContestar = segue.destinationViewController as! VistaContestar
            let vistadocs: DoctosDeptoPend = self.selectedViewController as! DoctosDeptoPend
            let indiceesel: Int? = vistadocs.tableView.indexPathForSelectedRow()!.row
            if ( indiceesel != nil)
            {
                var elementosel : Documentos = vistadocs.doctos[indiceesel!] as! Documentos
                var docto: Documento = Documento();
                //Llenamos el objeto de intercambio
                docto.setFolio(elementosel.folio.integerValue)
                docto.setOf_sol(elementosel.ofsol.integerValue)
                docto.setAsunto(elementosel.asunto)
                docto.setIdestatus(elementosel.idestatus.charValue)
                docto.setEstatus(elementosel.estatus)
                docto.setAnio(elementosel.anio.integerValue)
                docto.setSolicitud(elementosel.solicitud)
                docto.setRecepcion(elementosel.recepcion)
                docto.setIdnivel(elementosel.idnivel.integerValue)
                docto.setNivel(elementosel.nivel)
                docto.setIDdepto(elementosel.iddepto.integerValue)
                docto.setDepto(elementosel.depto)
                vistadet.setDocto(docto);
            }

        }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool
    {
        
        if(identifier == self.segueiddet)
        {
            let vistadocs: DoctosDeptoPend = self.selectedViewController as! DoctosDeptoPend
            //let indiceesel: Int? = vistadocs.tableView.indexPathForSelectedRow()!.row
            if ( vistadocs.tableView.indexPathForSelectedRow() == nil)
            {
                let alert = UIAlertView()
                alert.title = "Ningún documento seleccionado."
                alert.message = "Por favor, seleccione un elemento de la lista."
                alert.addButtonWithTitle("Aceptar")
                alert.show()
                return false
            }
        }
        
        return true
    }

}
