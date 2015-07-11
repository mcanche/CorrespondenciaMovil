//
//  Date.swift
//  CorrespondenciaMovil
//
//  Created by Efren Alejandro Barroso Llanes on 10/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import Foundation
//Tomado de http://stackoverflow.com/questions/24089999/how-do-you-create-a-swift-date-object

/*
Explicación de fechas en IOS:
http://www.globalnerdy.com/2015/01/26/how-to-work-with-dates-and-times-in-swift-part-one/
*/

class Date
{
    
    class func from(#year:Int, month:Int, day:Int) -> NSDate
    {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        var userCalendar = NSCalendar.currentCalendar()
        var date = userCalendar.dateFromComponents(c)
        return date!
    }
    
    class func parse(_dateStr:String, _format:String="yyyy-MM-dd") -> NSDate
    {
        var dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = _format
        return dateFmt.dateFromString(_dateStr)!
    }
}