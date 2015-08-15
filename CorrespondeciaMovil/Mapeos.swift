//
//  Mapeos.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 08/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

/**
* Created by ebllanes on 30/03/2015.
*/

import CoreData
import Foundation
import UIKit

public class Mapeos
{
    /*
    direccion
    */
    class func MapearPersona( _datos: NSArray) -> Persona
    {
        var persona: Persona = Persona();
        persona.setID((_datos.objectAtIndex(0)["idpersona"] as! String).toInt()!);
        persona.setTitulo(TituloPersonal.NE);
        persona.setApellidoPaterno(_datos.objectAtIndex(0)["app"] as! String);
        persona.setApellidoMaterno(_datos.objectAtIndex(0)["apm"] as! String);
        persona.setPrimerNombre(_datos.objectAtIndex(0)["nom"] as! String);
        persona.setSegundoNombre("");
        persona.setIniciales(_datos.objectAtIndex(0)["inicial"] as! String);
        return persona;
    }
    class func MapearPerfil( _datos: NSArray) -> Perfil
    {
        var perfil: Perfil = Perfil();
        perfil.setID(Perfiles(_perfilid: (_datos.objectAtIndex(0)["idperfil"] as! String).toInt()!));
        perfil.setPerfil("");
        return perfil;
    }
    class func  MapearNivel(_datos: NSArray) -> Nivel
    {
        var nivel: Nivel = Nivel();

        nivel.setID((_datos.objectAtIndex(0)["idnivel"] as! String).toInt()!);
        nivel.setNivel("");
 
        return nivel;
    }
    class func  MapearDepto(_datos: NSArray) -> Depto
    {
    
        var depto = Depto();
    
        depto.setID( (_datos.objectAtIndex(0)["iddepto"] as! String).toInt()! );
        depto.setDepto("");

        return depto;
    }
    class func MapearDoctosRem(_datos: NSArray)
    {
        var docto: Array<AnyObject> = []
        let appdel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appdel.managedObjectContext!
        
        /*Se invalidan los registros locales*/
        let freqbu : NSBatchUpdateRequest = NSBatchUpdateRequest(entityName: "Documentos")
        freqbu.propertiesToUpdate =
            [
                "vigente" : false
            ]
        freqbu.resultType = .UpdatedObjectsCountResultType;
        var res: NSBatchUpdateResult = context.executeRequest(freqbu, error: nil) as! NSBatchUpdateResult
        //println(res.result)
        /*
            despues de actualizar el la bd nos preparamos para recorrer la información y actualizar los datos
        */

        let ent = NSEntityDescription.entityForName("Documentos", inManagedObjectContext: context)
        let freq : NSFetchRequest = NSFetchRequest(entityName: "Documentos")
        /*Forma tradicional de recorrer el array*/
        /*
        for(var i: Int = 0;i < _datos.count ;i++ )
        {
            print(_datos.objectAtIndex(i))
        }
        */
        /*
            Una forma mas amigable
            Cortesía de:
            http://blog.kohjingyu.com/post/94154052640/loop-through-objects-in-an-nsarray
        */
        /*Recorremos la información leída del servidor*/
        for doctos : AnyObject in _datos
        {
            if let dato = doctos as? NSDictionary
            {
                //print(dato)
                let folio: NSNumber = (dato["id"] as! String).toInt()!
                freq.predicate = NSPredicate(format: "folio = %@", folio)
                docto = context.executeFetchRequest(freq, error: nil)!
                if (docto.count>0)
                {
                    for d in docto
                    {
                        (d as! Documentos).folsol = (dato["folsol"] as! String).toInt()!
                        (d as! Documentos).ofsol = (dato["ofisol"] as! String).toInt()!
                        (d as! Documentos).asunto = dato["asunto"] as! String
                        (d as! Documentos).idestatus = (dato["idst"] as! String).toInt()!
                        (d as! Documentos).estatus = dato["estatus"] as! String
                        (d as! Documentos).anio = (dato["anio"] as! String).toInt()!
                        (d as! Documentos).solicitud = Date.parse(dato["fec_sol"] as! String)
                        (d as! Documentos).recepcion = Date.parse(dato["fec_rec"] as! String)
                        (d as! Documentos).idnivel = (dato["idnivel"] as! String).toInt()!
                        (d as! Documentos).nivel = dato["nivel"] as! String
                        (d as! Documentos).iddepto = (dato["iddepto"] as! String).toInt()!
                        (d as! Documentos).depto = dato["depto"] as! String
                        (d as! Documentos).vigente = true
                    }
                }
                else
                {
                    var nvodocto = Documentos(entity: ent!, insertIntoManagedObjectContext: context)
                    nvodocto.folio = folio
                    nvodocto.folsol = (dato["folsol"] as! String).toInt()!
                    nvodocto.ofsol = (dato["ofisol"] as! String).toInt()!
                    nvodocto.asunto = dato["asunto"] as! String
                    nvodocto.idestatus = (dato["idst"] as! String).toInt()!
                    nvodocto.estatus = dato["estatus"] as! String
                    nvodocto.anio = (dato["anio"] as! String).toInt()!
                    nvodocto.solicitud = Date.parse(dato["fec_sol"] as! String)
                    nvodocto.recepcion = Date.parse(dato["fec_rec"] as! String)
                    nvodocto.idnivel = (dato["idnivel"] as! String).toInt()!
                    nvodocto.nivel = dato["nivel"] as! String
                    nvodocto.iddepto = (dato["iddepto"] as! String).toInt()!
                    nvodocto.depto = dato["depto"] as! String
                    nvodocto.vigente = true
                }
                context.save(nil)
            }
        }
        //Se borran los registros locales que no se descargaron del servidor
        freq.predicate = NSPredicate(format: "vigente = %@", false)
        var doctonv = context.executeFetchRequest(freq, error: nil)!
        for d in doctonv
        {
            context.deleteObject(d as! NSManagedObject)
        }
        
    }
    
    class func MapearResumen(_datos: NSArray)
    {
        //ReporteSemanal
        var repsemregs: Array<AnyObject> = [];
        var entidad: String = "ReporteSemanal";
        let appdel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appdel.managedObjectContext!
        let ent = NSEntityDescription.entityForName(entidad, inManagedObjectContext: context)
        let freq : NSFetchRequest = NSFetchRequest(entityName: entidad)
        /*Damos de baja los registros existentes*/
        var doctonv = context.executeFetchRequest(freq, error: nil)!
        for d in doctonv
        {
            context.deleteObject(d as! ReporteSemanal)
        }
        /*Encabezado*/
        var nvalinea = ReporteSemanal(entity: ent!, insertIntoManagedObjectContext: context)
        nvalinea.orden = 0
        nvalinea.nivel = "Nivel"
        nvalinea.recep = "Rec"
        nvalinea.recib = "Ent"
        nvalinea.conte = "Res"
        nvalinea.total = "Tot"
        context.save(nil)
        /*Recorremos la información leída del servidor*/
        var i: Int = 1;
        for lineas : AnyObject in _datos
        {
            if let linea = lineas as? NSDictionary
            {
                var nvalinea = ReporteSemanal(entity: ent!, insertIntoManagedObjectContext: context)
                nvalinea.orden = i
                nvalinea.nivel = linea["nivel"] as! String
                nvalinea.recep = linea["recep"] as! String
                nvalinea.recib = linea["recib"] as! String
                nvalinea.conte = linea["conte"] as! String
                nvalinea.total = linea["total"] as! String
                context.save(nil)
                i++;
             }
        }
    }
    
}
