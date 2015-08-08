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
    
    class func formatearFecha(_fecha: NSDate?) -> String
    {
        var cadfecha: String = "";
        var nommeses: NombresMeses = NombresMeses();
        
        if _fecha != nil
        {
            let df: NSDateFormatter = NSDateFormatter();
            
            var flags : NSCalendarUnit = NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear;
            let date = NSDate();
            let components = NSCalendar.currentCalendar().components(flags, fromDate: _fecha!);
            
            let anio = components.year;
            let mes = components.month;
            let dia = components.day;
            var caddia = dia < 10 ? "0\(dia)" : "\(dia)";
            
            cadfecha = "\(caddia)-\(nommeses.meses[mes])-\(dia)";
        }
        
        return cadfecha;
    }

}

class NombresMeses
{
    var meses: [String] =
    [
        "Ene","Feb","Mar",
        "Abr","May","Jun",
        "Jul","Ago","Sep",
        "Oct","Nov","Dic"
    ]
    
    init()
    {
        
    }
}