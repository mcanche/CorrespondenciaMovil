//
//  Depto.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 25/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//
/**
* Created by ebllanes on 11/04/2015.
*/

class Depto
{
    /*Propiedades de la clase*/
    /*Propiedades del objeto*/
    var id: Int
    var depto: String
    var responsable: Persona? ;
    /*Funciones Getters y setters*/
    func setID(_id: Int)
    {
        self.id=_id;
    }
    func getID() -> Int
    {
        return self.id;
    }
    func setDepto(_depto: String)
    {
        self.depto=_depto;
    }
    func getDepto() -> String
    {
        return self.depto;
    }
    func setResponsable( _responsable: Persona)
    {
        self.responsable=_responsable;
    }
    func getResponsable() -> Persona
    {
        return self.responsable!;
    }
    /*Constructores y destructores*/
    init()
    {
        self.id = -1;
        self.depto = "";
        self.responsable = nil;
    }
    init(_id: Int, _depto: String)
    {
        self.id=_id;
        self.depto=_depto;
        self.responsable = nil;
    }
    /*Funciones/Métodos*/
}

