//
//  ReporteSemanal.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 14/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import Foundation
import CoreData

@objc(ReporteSemanal)

class ReporteSemanal: NSManagedObject
{
    @NSManaged var orden: NSNumber
    @NSManaged var nivel: String
    @NSManaged var recep: String
    @NSManaged var recib: String
    @NSManaged var conte: String
    @NSManaged var total: String

}
