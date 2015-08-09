//
//  espera.swift
//  CorrespondenciaMovil
//
//  Created by Apple on 09/08/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

/*
http://stackoverflow.com/questions/30002644/adjust-uiactivityindicatorview-position-in-alertview-swift
*/

import UIKit

class Espera
{
    class func mostrarEspera( inout _espera: UIAlertView, _mensaje: String)
    {
        var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
        var viewBack:UIView = UIView(frame: CGRectMake(83,0,100,50))
        loadingIndicator.center = viewBack.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating()
        
        viewBack.addSubview(loadingIndicator)
        //viewBack.center = _espera.view.center
        
        _espera = UIAlertView(title: nil, message: _mensaje, delegate: nil, cancelButtonTitle: nil)
        _espera.setValue(viewBack, forKey: "accessoryView")
        _espera.show()
        loadingIndicator.startAnimating()
    }
    class func ocultarEspera( inout _espera: UIAlertView)
    {
        _espera.dismissWithClickedButtonIndex(0, animated: false)
    }
}
