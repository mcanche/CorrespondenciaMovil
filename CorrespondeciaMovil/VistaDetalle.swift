//
//  VistaDetalle.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 10/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit

class VistaDetalle: UIViewController
{
    private var docto: Documento?;
    
    @IBOutlet weak var folio: UILabel!
    @IBOutlet weak var oficio: UILabel!
    @IBOutlet weak var solicitud: UILabel!
    @IBOutlet weak var recepcion: UILabel!
    @IBOutlet weak var nivel: UILabel!
    @IBOutlet weak var depto: UILabel!
    @IBOutlet weak var estatus: UILabel!
    @IBOutlet weak var anio: UILabel!
    @IBOutlet weak var asunto: UILabel!
    
    func setDocto( _docto: Documento )
    {
        self.docto = _docto;
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.folio.text = self.docto?.getFolioCompleto()
        var valentero: Int = (self.docto?.getOf_sol())!;
        self.oficio.text = String(valentero)
        self.solicitud.text = Date.formatearFecha(self.docto?.getSolicitud())
        self.recepcion.text = Date.formatearFecha(self.docto?.getRecepcion())
        self.nivel.text = self.docto?.getNivel()
        self.depto.text = self.docto?.getDepto()
        self.estatus.text = self.docto?.getEstatus()
        valentero = (self.docto?.getAnio())!;
        self.anio.text = String(valentero)
        self.asunto.text = self.docto?.getAsunto()
        //self.navigationController?.navigationBar.topItem!.title = "Regresar";
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    @IBAction func regresar(sender: UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
