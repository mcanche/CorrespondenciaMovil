//
//  Perfil.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 07/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

/**
* Created by ebllanes on 11/04/2015.
*/

public class Perfil
{
    /*Propiedades de la clase*/
    /*Propiedades del objeto*/
    private var id: Perfiles;
    private var perfil: String;
    /*Funciones Getters y setters*/
    func setID( _id: Perfiles )
    {
        self.id=_id;
    }
    func getID() -> Perfiles
    {
        return self.id;
    }
    func setPerfil( _perfil: String)
    {
        self.perfil=_perfil;
    }
    func getPerfil() -> String
    {
        return self.perfil;
    }
    /*Constructores y destructores*/
    init()
    {
        self.id = Perfiles();
        self.perfil="";
    }
    init( _perfilid: Perfiles, _perfil: String)
    {
        self.id=_perfilid;
        self.perfil=_perfil;
    }
    /*Funciones/metodos*/
}