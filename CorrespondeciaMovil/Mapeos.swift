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
public class Mapeos
{
    //private final static String prefijo_funciongetter="prefijo_funcionget";
    //private final static String prefijo_funcionsetter="prefijo_funcionset";
    
    /*
    public static ArrayList<Documento> MapearDoctos(Context _context, Cursor _cursor, boolean _pendientes)
    {
    ArrayList<Documento> documentos = new ArrayList<Documento>();
    Documento item = null;
    /*Variable de control*/
    Byte varidestatus=-1;
    /*
    Variables para guardar los valores del documento leido de la bd
    con estas se inicializará el objeto Documento
    */
    Integer folio;
    Integer anio;
    Integer of_sol;
    Byte idestatus;
    String estatus;
    String asunto;
    GregorianCalendar solicitud;
    GregorianCalendar recepcion;
    Integer idnivel;
    String nivel;
    Integer iddepto;
    String depto;
    Enumerados.TipoFila tipo;
    int contadorxest=0;
    if ( _cursor != null )
    {
    while(_cursor.moveToNext())
    {
    folio=_cursor.getInt(_cursor.getColumnIndex("folio"));
    anio=_cursor.getInt(_cursor.getColumnIndex("anio"));
    of_sol=_cursor.getInt(_cursor.getColumnIndex("of_sol"));
    idestatus=(byte)_cursor.getInt(_cursor.getColumnIndex("idestatus"));
    estatus=_cursor.getString(_cursor.getColumnIndex("estatus"));
    asunto=_cursor.getString(_cursor.getColumnIndex("asunto"));                ;
    solicitud = new GregorianCalendar();
    solicitud.setTimeInMillis(_cursor.getLong(_cursor.getColumnIndex("solicitud")));
    recepcion = new GregorianCalendar();
    recepcion.setTimeInMillis(_cursor.getLong(_cursor.getColumnIndex("recepcion")));
    idnivel=_cursor.getInt(_cursor.getColumnIndex("idnivel"));
    nivel=_cursor.getString(_cursor.getColumnIndex("nivel"));
    iddepto=_cursor.getInt(_cursor.getColumnIndex("iddepto"));
    depto=_cursor.getString(_cursor.getColumnIndex("depto"));
    tipo= _pendientes ? Enumerados.TipoFila.VALIDADOR : Enumerados.TipoFila.JEFE ;
    /*
    Validar si se requiere un encabezado
    */
    if( !_pendientes && varidestatus!=idestatus )
    {
    varidestatus=idestatus;
    item = new Documento(_context,0,anio,0,idestatus,estatus,
    Enumerados.Estatus.leerIDEstatus(idestatus).getLeyenda(),
    new GregorianCalendar(),new GregorianCalendar(),0,"",0,"",
    Enumerados.TipoFila.ENCABEZADO
    );
    documentos.add(item);
    contadorxest=-1;
    }
    item = new Documento(_context,folio,anio,of_sol,idestatus,estatus,asunto,
    solicitud,recepcion,idnivel,nivel,iddepto,depto,tipo
    );
    contadorxest++;
    item.setFondo( contadorxest% 2 > 0);
    if(_pendientes)
    {
    tipo = item.getFondo() ? Enumerados.TipoFila.VALIDADORFONDO : Enumerados.TipoFila.VALIDADOR;
    }
    else
    {
    tipo = item.getFondo() ? Enumerados.TipoFila.JEFEFONDO : Enumerados.TipoFila.JEFE ;
    }
    item.setTipo(tipo);
    documentos.add(item);
    }
    }
    return documentos;
    }
    */
    class func MapearPersona( _datos: ) -> Persona
    {
        Persona persona = Persona();
        
        do
        {
            JSONObject dato = (JSONObject) _datos.get(0);
            persona.setID(dato.getInt("idpersona"));
            persona.setTitulo(Enumerados.TituloPersonal.NE);
            persona.setApellidoPaterno(dato.getString("app"));
            persona.setApellidoMaterno(dato.getString("apm"));
            persona.setPrimerNombre(dato.getString("nom"));
            persona.setSegundoNombre("");
            persona.setIniciales(dato.getString("inicial"));
        }
        catch
        {
            
        }
        
        return persona;
    }
    /*
    public static Perfil MapearPerfil(Context _context, JSONArray _datos)
    {
    Perfil perfil = new Perfil(_context);
    try
    {
    JSONObject dato = (JSONObject) _datos.get(0);
    perfil.setID(dato.getInt("idperfil"));
    perfil.setPerfil("");
    }
    catch (JSONException e)
    {
    e.printStackTrace();
    }
    return perfil;
    }
    public static Nivel MapearNivel(Context _context, JSONArray _datos)
    {
    Nivel nivel = new Nivel(_context);
    try
    {
    JSONObject dato = (JSONObject) _datos.get(0);
    nivel.setID(dato.getInt("idnivel"));
    nivel.setNivel("");
    }
    catch (JSONException e)
    {
    e.printStackTrace();
    }
    return nivel;
    }
    public static Depto MapearDepto(Context _context, JSONArray _datos)
    {
    Depto depto = new Depto(_context);
    try
    {
    JSONObject dato = (JSONObject) _datos.get(0);
    depto.setID(dato.getInt("iddepto"));
    depto.setDepto("");
    }
    catch (JSONException e)
    {
    e.printStackTrace();
    }
    return depto;
    }
    public static void MapearDoctosRem(Context _context, TablaSQLite _datosloc, JSONArray _datosrem)
    {
    //Se invalidan los registros locales
    _datosloc.actualizarDocumentosVigentes(false,null);
    //leemos los datos que se descargaron del servidor y los grabamos localmente
    try
    {
    for (int i=0;i<_datosrem.length();i++)
    {
    JSONObject dato = (JSONObject) _datosrem.get(i);
    Properties valores = new Properties();
    Integer id = dato.getInt("id");
    
    //valores.setProperty("???",String.valueOf(dato.getInt("folsol")));
    valores.setProperty("of_sol",String.valueOf(dato.getInt("ofisol")));
    String asunto=dato.getString("asunto");
    asunto = asunto==null || asunto=="null" ? "" : asunto ;
    valores.setProperty("asunto",asunto);
    valores.setProperty("idestatus",String.valueOf(dato.getInt("idst")));
    valores.setProperty("estatus",dato.getString("estatus"));
    valores.setProperty("anio",String.valueOf(dato.getLong("anio")));
    valores.setProperty("solicitud",Long.toString(Date.valueOf(dato.getString("fec_sol")).getTime()));
    valores.setProperty("recepcion",Long.toString(Date.valueOf(dato.getString("fec_rec")).getTime()));
    valores.setProperty("idnivel",String.valueOf(dato.getInt("idnivel")));
    valores.setProperty("nivel",dato.getString("nivel"));
    valores.setProperty("iddepto",String.valueOf(dato.getInt("iddepto")));
    valores.setProperty("depto",dato.getString("depto"));
    valores.setProperty("vigente","1");
    
    FiltroSQL filtro = new FiltroSQL("folio", Enumerados.OperadoresLogicos.IGUAL, String.valueOf(id));
    Hashtable<String,FiltroSQL> filtros=new Hashtable<String,FiltroSQL>();
    filtros.put("folio",filtro);
    
    if(_datosloc.buscarDocumento(filtros).getCount()==0)
    {
    valores.setProperty("folio",String.valueOf(id));
    _datosloc.insertarBD(valores);
    }
    else
    {
    _datosloc.actualizarBD(valores,filtros);
    }
    }
    }
    catch (JSONException e)
    {
    e.printStackTrace();
    }
    //Se borran los registros locales que no descargaron del servidor
    _datosloc.borrarDocumentosVigentes(false);
    }
    public static ArrayList<ResumenLinea> crearListaResumen(JSONArray _datos)
    {
    ArrayList<ResumenLinea> lista = new ArrayList<ResumenLinea>();
    JSONObject obj = null;
    ResumenLinea linea = null;
    try
    {
    if(_datos != null)
    {
    for(int i = 0; i < _datos.length() ; i++)
    {
    obj = (JSONObject) _datos.get(i);
    linea = new ResumenLinea(obj.getString("nivel"),obj.getInt("recep"),obj.getInt("recib"),obj.getInt("conte"),obj.getInt("total"));
    lista.add(linea);
    }
    }
    }
    catch (JSONException e)
    {
    e.printStackTrace();
    }
    return lista;
    }
*/
}
