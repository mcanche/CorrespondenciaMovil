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
    class func actualizarDoctoFolio( _docto: Documento )
    {
        let appdel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appdel.managedObjectContext!
        
        /*Se invalidan los registros locales*/
        let freqbu : NSBatchUpdateRequest = NSBatchUpdateRequest(entityName: "Documentos")
        freqbu.propertiesToUpdate =
            [
                "idestatus" : _docto.getIdestatus().getID()
            ]
        freqbu.resultType = .UpdatedObjectsCountResultType;
        var res: NSBatchUpdateResult = context.executeRequest(freqbu, error: nil) as! NSBatchUpdateResult
    }
}
