//
//  VistaReporteSemanal.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 14/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
import CoreData

class VistaReporteSemanal: UITableViewController
{
    private var repsemregs: Array<AnyObject> = []
    
    private var espera: UIAlertView = UIAlertView()
    private var doctos: DoctosRemoto?;
    private var usuario: Usuario?;
    private var entidad: String = "ReporteSemanal";
    
    func setUsuario( _usuario: Usuario )
    {
        self.usuario = _usuario;
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.obtenerReporte()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func obtenerReporte()
    {
        Espera.mostrarEspera(&self.espera,_mensaje: "Leyendo información, espere un momento...")
        doctos=DoctosRemoto(_usuario: self.usuario!);
        doctos?.leerResumen(self);
    }
    func ocultarEspera()
    {
        Espera.ocultarEspera(&self.espera);
    }
    func leerReporte()
    {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let freq : NSFetchRequest = NSFetchRequest(entityName: self.entidad)
        
        let sortDescriptor = NSSortDescriptor(key: "orden", ascending: true)
        let sortDescriptors = [sortDescriptor]
        freq.sortDescriptors = sortDescriptors
        
        self.repsemregs = context.executeFetchRequest(freq, error: nil)!
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return repsemregs.count
    }

    @IBAction func Regresar(sender: UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellid : String = "linea"
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellid) as! UITableViewCell
        var linea: ReporteSemanal = repsemregs[indexPath.row] as! ReporteSemanal
        //Etiquetas
        var texto: UILabel = cell.viewWithTag(1) as! UILabel
        texto.text = linea.nivel
        texto = cell.viewWithTag(2) as! UILabel
        texto.text = linea.recep
        texto = cell.viewWithTag(3) as! UILabel
        texto.text = linea.recib
        texto = cell.viewWithTag(4) as! UILabel
        texto.text = linea.conte
        texto = cell.viewWithTag(5) as! UILabel
        texto.text = linea.total
        
        return cell
    }

}
