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
    private var usuario: Usuario?;
    private var vistapadre: DoctosDeptoPend?
    
    @IBOutlet weak var fecharesp: UIDatePicker!
    @IBOutlet weak var respuesta: UITextView!
    @IBOutlet weak var titulo: UILabel!
    
    func setDocto( _docto: Documento )
    {
        self.docto = _docto;
    }
    
    func setUsuario( _usuario: Usuario )
    {
        self.usuario = _usuario;
    }
    
    func setVistaPadre( _vistapadre: DoctosDeptoPend )
    {
        self.vistapadre = _vistapadre;
    }
    
    func borrarElementoSel()
    {
        self.vistapadre?.borrarElementoSel();
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

    @IBAction func responderDocumento(sender: AnyObject)
    {
        if ( !respuesta.text.isEmpty )
        {
            self.docto?.setFechaRespuesta(Date.formatearFecha(fecharesp.date))
            self.docto?.setRespuesta(respuesta.text)
            var doctos=DoctosRemoto(_usuario: self.usuario!);
            doctos.responderCorrespondencia(self, _docto: (self.docto)!)
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
    
    @IBAction func regresar()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
