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
   
    @NSManaged var folio: Int64
    @NSManaged var ofsol: Int64
    @NSManaged var asunto: String
    @NSManaged var idestatus: Int
    @NSManaged var estatus: String
    @NSManaged var anio: Int16
    @NSManaged var solicitud: NSDate
    @NSManaged var recepcion: NSDate
    @NSManaged var idnivel: Int
    @NSManaged var nivel: String
    @NSManaged var iddepto: Int
    @NSManaged var depto: String
    @NSManaged var vigente: Bool
    
    
}
