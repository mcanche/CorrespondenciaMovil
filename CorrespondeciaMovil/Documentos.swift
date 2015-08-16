//
//  Documentos.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 10/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit
import CoreData

@objc(Documentos)

class Documentos: NSManagedObject
{
    
    @NSManaged var folio: NSNumber
    @NSManaged var folsol: NSNumber
    @NSManaged var ofsol: NSNumber
    @NSManaged var asunto: String
    @NSManaged var idestatus: NSNumber
    @NSManaged var estatus: String
    @NSManaged var anio: NSNumber
    @NSManaged var solicitud: NSDate
    @NSManaged var recepcion: NSDate
    @NSManaged var idnivel: NSNumber
    @NSManaged var nivel: String
    @NSManaged var iddepto: NSNumber
    @NSManaged var depto: String
    @NSManaged var vigente: NSNumber

}
