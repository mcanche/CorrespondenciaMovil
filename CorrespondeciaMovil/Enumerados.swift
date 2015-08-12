//
//  Enumerados.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 25/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

enum Perfiles
{
    /*Valores del enum*/
    case NOPERMITIDO( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case ADMINISTRADOR( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case SECRETARIADIRECCION( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case SECRETARIADEPARTAMENTO( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case VALIDADOR( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case MANTENIMIENTO( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case TESTER( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    case JEFEDEPTO( _id: Int8, _valido: Bool, _validador: Bool , _jefe: Bool)
    /*Constructores*/
    init()
    {
        self = .NOPERMITIDO(_id: 0, _valido: false, _validador: false, _jefe: false)
    }
    init(_perfilid: Int)
    {
        switch(_perfilid)
        {
        case 1:
            self =  .ADMINISTRADOR(_id: 1, _valido: false, _validador: false, _jefe: false)
            break
        case 2:
            self = .SECRETARIADIRECCION(_id: 2, _valido: false, _validador: false, _jefe: false)
            break
        case 3:
            self = .SECRETARIADEPARTAMENTO(_id: 3, _valido: false, _validador: false, _jefe: false)
            break
        case 4:
            self =  .VALIDADOR(_id: 4, _valido: true, _validador: true, _jefe: false)
            break
        case 5:
            self = .MANTENIMIENTO(_id: 5, _valido: false, _validador: false, _jefe: false)
            break
        case 6:
            self = .TESTER(_id: 6, _valido: false, _validador: false, _jefe: false)
            break
        case 7:
            self = .JEFEDEPTO(_id: 7, _valido: true, _validador: false, _jefe: true)
            break
        default:
            self =  .NOPERMITIDO(_id: 0, _valido: false, _validador: false, _jefe: false)
            break
        }
    }
    func getValido() -> Bool
    {
        var resultado: Bool = false
        switch self
        {
        case .ADMINISTRADOR(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .SECRETARIADIRECCION(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .SECRETARIADEPARTAMENTO(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .VALIDADOR(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .MANTENIMIENTO(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .TESTER(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .JEFEDEPTO(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        case .NOPERMITIDO(let _id, let _valido, let _validador, let _jefe):
            resultado = _valido;
            break;
        }
        return resultado;
    }
    func esValidador() -> Bool
    {
        var resultado: Bool = false
        switch self
        {
        case .ADMINISTRADOR(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .SECRETARIADIRECCION(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .SECRETARIADEPARTAMENTO(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .VALIDADOR(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .MANTENIMIENTO(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .TESTER(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .JEFEDEPTO(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        case .NOPERMITIDO(let _id, let _valido, let _validador, let _jefe):
            resultado = _validador;
            break;
        }
        return resultado;
    }
    func getID() -> Int
    {
        var resultado: Int = 0
        switch self
        {
        case .ADMINISTRADOR(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .SECRETARIADIRECCION(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .SECRETARIADEPARTAMENTO(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .VALIDADOR(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .MANTENIMIENTO(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .TESTER(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .JEFEDEPTO(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        case .NOPERMITIDO(let _id, let _valido, let _validador, let _jefe):
            resultado = Int(_id);
            break;
        }
        return resultado;
    }
}

enum TituloPersonal : Int8
{
    /*Valores del enum*/
    case NE = 0 //No especificado
    case SRA = 1 //"Sra.","Señora"
    case SR = 2 //"Sr.","Señor"
    case DNA = 3 //"Dña.","Doña"
    case D = 4  //"D.","Don"
    case SRITO = 5  //"Srito.","Señorito"
    case SRITA = 6 //"Srita.","Señorita"
    
    init()
    {
        self = .NE
    }
    
}

enum TipoFila : Int8
{
    /*Valores del enum*/
    case ENCABEZADO = 0
    case VALIDADOR = 1
    case JEFE = 2
    case VALIDADORFONDO = 3
    case JEFEFONDO = 4
    /*Constructores*/
    init()
    {
        self = .ENCABEZADO
    }
    init(_tipo: Int8)
    {
        switch(_tipo)
        {
        case 0:
            self = .ENCABEZADO
            break
        case 1:
            self = .VALIDADOR
            break
        case 2:
            self = .JEFE
            break
        case 3:
            self = .VALIDADORFONDO
            break
        case 4:
            self = .JEFEFONDO
            break
        default:
            self = .ENCABEZADO
            break
            
        }
    }
}

public enum Estado : Int8
{
    /*Valores del enum*/
    case EXITO = 1
    case ERROR = 0
}

public enum Estatus
{
    case RECEPCIONADO(_id: Int8, _icon: String, _leyenda: String, _color: Int64)
    case ENTREGADODEPTO(_id: Int8, _icon: String, _leyenda: String, _color: Int64)
    case CONTESTADO(_id: Int8, _icon: String, _leyenda: String, _color: Int64)
    
    /*Constructores*/
    init()
    {
        self = .RECEPCIONADO(_id: 1, _icon: "recepcion", _leyenda: "Documentos recepcionados", _color: 0xFFF08080)
    }
    
    init(_tipo: Int8)
    {
        switch(_tipo)
        {
        case 1:
            self =  .RECEPCIONADO(_id: 1, _icon: "recepcion", _leyenda: "Documentos recepcionados", _color: 0xFFF08080)
            break
        case 2:
            self = .ENTREGADODEPTO(_id: 2, _icon: "entregado", _leyenda: "Documentos entregados al departamento", _color: 0xFF87CEEB)
            break
        case 3:
            self = .CONTESTADO(_id: 3, _icon: "contestado", _leyenda: "Documentos contestados", _color: 0xFF98FB98)
            break
        default:
            self =  .RECEPCIONADO(_id: 1, _icon: "recepcion", _leyenda: "Documentos recepcionados", _color: 0xFFF08080)
            break
        }
    }
    func getID() -> Int
    {
        var resultado: Int = 0
        switch self
        {
        case .RECEPCIONADO(let _id, let _icon, let _leyenda, let _color):
            resultado = Int(_id);
            break;
        case .ENTREGADODEPTO(let _id, let _icon, let _leyenda, let _color):
            resultado = Int(_id);
            break;
        case .CONTESTADO(let _id, let _icon, let _leyenda, let _color):
            resultado = Int(_id);
            break;
        default:
            resultado = 0
            break;
        }
        return resultado;
    }
}