//
//  VistaContestar.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 10/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit

class VistaContestar: UIViewController
{

    private var docto: Documento?;
    
    @IBOutlet weak var fecharesp: UIDatePicker!
    @IBOutlet weak var respuesta: UITextView!
    @IBOutlet weak var titulo: UILabel!
    
    func setDocto( _docto: Documento )
    {
        self.docto = _docto;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.titulo.text = "Responder al documento " + (self.docto?.getFolioCompleto())!
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    @IBAction func responderDocumento(sender: AnyObject)
    {
        if ( !respuesta.text.isEmpty )
        {
            self.docto?.setFechaRespuesta(Date.formatearFecha(fecharesp.date))
            self.docto?.setRespuesta(respuesta.text)
        }
        else
        {
            self.mostrarAlerta(self.titulo.text!,_mensaje: "Por favor proporcione la respuesta a la solicitud.")
        }
        
    }
    func mostrarAlerta(_titulo: String, _mensaje: String)
    {
        let alert = UIAlertView()
        alert.title = _titulo
        alert.message = _mensaje
        alert.addButtonWithTitle("Aceptar")
        alert.show()
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
