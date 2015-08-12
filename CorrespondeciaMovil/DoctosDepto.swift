//
//  DoctosDepto.swift
//  correspondencia
//
//  Created by Apple on 03/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
import CoreData

class DoctosDepto: UITableViewController
{
    
    var doctos: Array<AnyObject> = []
    /************Identificadores segue************/
    private var segueiddetrec: String = "verdetrec";
    private var segueiddetresp: String = "verdetresp";
    
    private var estatus: Int8 = 0;
    private var imagennom: String = "rojo.png";
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.iniciarTabPer()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let freq : NSFetchRequest = NSFetchRequest(entityName: "Documentos")
        let filtro1: NSPredicate = NSPredicate(format: "vigente = %@", true);
        let filtro2: NSPredicate = NSPredicate(format: "idestatus = %d", 2);//self.estatus);
        var filtros = NSCompoundPredicate.andPredicateWithSubpredicates([filtro1, filtro2])
        freq.predicate = filtros
        doctos = context.executeFetchRequest(freq, error: nil)!
        tableView.reloadData()
        //self.navigationController?.navigationBar.topItem!.title = "";
        //(self.parentViewController as! VistaDocumentos)
    }
    
    private func iniciarTabPer()
    {
        switch Int(self.tabBarItem.tag)
        {
        case 1:
            self.estatus = 1;
            self.imagennom = "rojo.png";
            break;
        case 3:
            self.estatus = 3;
            self.imagennom = "verde2.png";
            break
        default:
            break
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return doctos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellid : String = "docto"
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellid) as! UITableViewCell
        
        var docto: NSManagedObject = doctos[indexPath.row] as! NSManagedObject
        var objimagen : Imagen = Imagen()
        
        //Etiquetas
        var texto: UILabel = cell.viewWithTag(1) as! UILabel
        texto.text = ("Folio: "+docto.valueForKeyPath("folio")!.stringValue!+"/"+docto.valueForKeyPath("anio")!.stringValue!)
        texto = cell.viewWithTag(2) as! UILabel
        texto.text = ("Oficio: "+docto.valueForKeyPath("ofsol")!.stringValue!)
        texto = cell.viewWithTag(3) as! UILabel
        texto.text = ("Asunto: "+(docto.valueForKeyPath("asunto")! as! String))
        
        //Imagen
        /*
        let imagennva = objimagen.cambiarTam(UIImage(named: imagennom)!, tamsol: CGSizeMake(30,30))
        var imagencapa: CALayer! = cell.imageView?.layer
        imagencapa.cornerRadius = imagencapa.frame.size.width / 2
        imagencapa.masksToBounds = true
        cell.imageView?.image = imagennva*/
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        var elementosel : Documentos = doctos[self.tableView.indexPathForSelectedRow()!.row] as! Documentos
        
        // Get the new view controller using [segue destinationViewController].
        if(segue.identifier == self.segueiddetrec || segue.identifier == self.segueiddetresp)
        {
            let vistadet : VistaDetalle = segue.destinationViewController as! VistaDetalle
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
