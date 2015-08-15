//
//  DoctosDepto.swift
//  correspondencia
//
//  Created by Apple on 03/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
import CoreData

class DoctosDeptoPend: UITableViewController
{
    var doctos: Array<AnyObject> = []
    /************Identificadores segue************/
    private var segueiddet: String = "verdetpend";
    private var indexPath: NSIndexPath?;
    
    private var usuario: Usuario?;
    func setUsuario( _usuario: Usuario )
    {
        self.usuario = _usuario;
    }
    
    @IBAction func verdet(sender: AnyObject)
    {
        /*
        http://stackoverflow.com/questions/28659845/swift-how-to-get-the-indexpath-row-when-a-button-in-a-cell-is-tapped
        */
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! UITableViewCell
        self.indexPath = self.tableView.indexPathForCell(cell)
        self.performSegueWithIdentifier(self.segueiddet, sender: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //datosPruebas()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let freq : NSFetchRequest = NSFetchRequest(entityName: "Documentos")
        /*Filtro simple*/
        //freq.predicate = NSPredicate(format: "vigente = %@", true)
        let filtro1: NSPredicate = NSPredicate(format: "vigente = %@", true);
        let filtro2: NSPredicate = NSPredicate(format: "idestatus = %d", 2);
        var filtros = NSCompoundPredicate.andPredicateWithSubpredicates([filtro1, filtro2])
        freq.predicate = filtros
        doctos = context.executeFetchRequest(freq, error: nil)!
        tableView.reloadData()
        //self.navigationController?.navigationBar.topItem!.title = "";
    }
    
    func actualizarVista()
    {
        self.viewDidAppear(true)
    }
    
    func datosPruebas()
    {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Documentos", inManagedObjectContext: context)
        var nvodocto = Documentos(entity: ent!, insertIntoManagedObjectContext: context)
        nvodocto.folio = 7
        nvodocto.ofsol = 8
        nvodocto.asunto = "Solicitud limitación de contrato"
        nvodocto.idestatus = 2
        nvodocto.estatus = "Entregado al depto"
        nvodocto.anio = 2015
        nvodocto.solicitud = Date.from(year: 2015, month: 03, day: 17)
        nvodocto.recepcion = Date.from(year: 2015, month: 04, day: 15)
        nvodocto.idnivel = 1
        nvodocto.nivel = "Educación inicial y preescolar"
        nvodocto.iddepto = 3
        nvodocto.depto = "Departamento de estudios y proyecto"
        nvodocto.vigente = true
        context.save(nil)
        
    }

    // MARK: - Table view data source

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
        texto.text = ("Folio: "+docto.valueForKeyPath("folsol")!.stringValue!+"/"+docto.valueForKeyPath("anio")!.stringValue!)
        texto = cell.viewWithTag(2) as! UILabel
        texto.text = ("Oficio: "+docto.valueForKeyPath("ofsol")!.stringValue!)
        texto = cell.viewWithTag(3) as! UILabel
        texto.text = ("Asunto: "+(docto.valueForKeyPath("asunto")! as! String))
        
        //Imagen
       /* let imagennom = "ambar.png"
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
    
    func borrarElementoSel()
    {
        if(self.indexPath != nil)
        {
            self.doctos.removeAtIndex(self.indexPath!.row)
            self.tableView.deleteRowsAtIndexPaths([self.indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            self.tableView.reloadData()
        }
        else
        {
            self.viewDidAppear(false)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        // Get the new view controller using [segue destinationViewController].
        if(segue.identifier == self.segueiddet )
        {
            var indexPath: NSIndexPath? = self.tableView.indexPathForSelectedRow()
            self.indexPath = indexPath == nil ? self.indexPath : indexPath
            var elementosel : Documentos = doctos[self.indexPath!.row] as! Documentos
            let vistadet : VistaDetalle = segue.destinationViewController as! VistaDetalle
            var docto: Documento = Documento();
            //Llenamos el objeto de intercambio
            docto.setFolio(elementosel.folio.integerValue)
            docto.setFolSol(elementosel.folsol.integerValue)
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