//
//  DAO.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 11/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import CoreData
import Foundation
import UIKit

class DAO
{
    class func actualizarDoctoFolio( _docto: Documento, _vigente: Bool = false )
    {
        let appdel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appdel.managedObjectContext!
        
        /*Actualiza el estatus*/
        let freqbu : NSBatchUpdateRequest = NSBatchUpdateRequest(entityName: "Documentos")
        let folio: NSNumber = _docto.getFolio()
        freqbu.predicate = NSPredicate(format: "folio = %@", folio)
        freqbu.propertiesToUpdate =
            [
                "idestatus" : _docto.getIdestatus().getID(),
                "estatus" : _docto.getIdestatus().getEstatus(),
                "vigente" : _vigente
            ]
        freqbu.resultType = .UpdatedObjectsCountResultType;
        var res: NSBatchUpdateResult = context.executeRequest(freqbu, error: nil) as! NSBatchUpdateResult
        //println(res.result)
    }
}
