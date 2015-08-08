//
//  Nivel.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 07/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//
/**
* Created by ebllanes on 11/04/2015.
*/

class Nivel
{
    /*Propiedades de la clase*/
    /*Propiedades del objeto*/
    private var id: Int;
    private var nivel: String;
    private var responsable: Persona?;
    /*Funciones Getters y setters*/
    func setID(_id: Int)
    {
        self.id=_id;
    }
    func getID() -> Int
    {
        return self.id;
    }
    func setNivel( _nivel: String )
    {
        self.nivel=_nivel;
    }
    func getNivel() -> String
    {
        return self.nivel;
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
        self.id=0;
        self.nivel="";
        self.responsable=nil;
    }
    init(_id: Int, _nivel: String)
    {
        self.id=_id;
        self.nivel=_nivel;
        self.responsable=nil;
    }
}
