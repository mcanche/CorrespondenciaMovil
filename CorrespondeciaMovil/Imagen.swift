//
//  Imagen.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 18/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit

class Imagen: NSObject
{
    func cambiarTam(_imagen: UIImage, tamsol _tam: CGSize) -> UIImage
    {
        var escala = CGFloat(max(_tam.width/_imagen.size.width,_tam.height/_imagen.size.height))
        var ancho: CGFloat = _imagen.size.width * escala
        var alto: CGFloat = _imagen.size.height * escala
        
        var rr: CGRect = CGRectMake(0, 0, ancho, alto)
        
        UIGraphicsBeginImageContextWithOptions(_tam, false, 0)
        
        _imagen.drawInRect(rr)
        let imagennva = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

        return imagennva
    }
   
}
