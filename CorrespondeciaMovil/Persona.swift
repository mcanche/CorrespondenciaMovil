//
//  Persona.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 25/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

class Persona
{
    /*Propiedades de la clase*/
    /*Propiedades del objeto*/
    var id: Int;
    var primernombre: String;
    var segundonombre: String;
    var apellidopaterno: String;
    var apellidomaterno: String;
    var iniciales: String;
    var titulopersonal: TituloPersonal;
    /*Funciones Getters y setters*/
    func setID(_id: Int)
    {
        self.id=_id;
    }
    func getID() -> Int
    {
        return self.id;
    }
    func setTitulo(_titulo: TituloPersonal)
    {
        self.titulopersonal=_titulo;
    }
    func getTitulo() -> TituloPersonal
    {
        return self.titulopersonal;
    }
    func setPrimerNombre(_nombre: String)
    {
        self.primernombre=_nombre;
    }
    func getPrimerNombre() -> String
    {
        return self.primernombre;
    }
    func setSegundoNombre( _nombre: String)
    {
        self.segundonombre=_nombre;
    }
    func getSegundoNombre() -> String
    {
        return self.segundonombre;
    }
    func setApellidoPaterno(_apellido: String)
    {
        self.apellidopaterno=_apellido;
    }
    func getApellidoPaterno() -> String
    {
        return self.apellidopaterno;
    }
    func setApellidoMaterno(_apellido: String)
    {
        self.apellidomaterno=_apellido;
    }
    func getApellidoMaterno() -> String
    {
        return self.apellidomaterno;
    }
    func setIniciales(_iniciales: String)
    {
        self.iniciales=_iniciales;
    }
    func getIniciales() -> String
    {
        return self.iniciales;
    }
/*Constructores y destructores*/
/*
Integer id;
 String primernombre;
 String segundonombre;
 String apellidopaterno;
 String apellidomaterno;
 String iniciales;
 Enumerados.TituloPersonal titulopersonal;
*/

    init(_id: Int,
        _primernombre: String, _segundonombre: String,
        _apellidopaterno: String, _apellidomaterno: String,
        _iniciales: String, _titulopersonal: TituloPersonal
        )
    {
        self.id=_id;
        self.primernombre=_primernombre;
        self.segundonombre=_segundonombre;
        self.apellidopaterno=_apellidopaterno;
        self.apellidomaterno=_apellidomaterno;
        self.iniciales=_iniciales;
        self.titulopersonal=_titulopersonal;
    }
/*Funciones/metodos*/
}

