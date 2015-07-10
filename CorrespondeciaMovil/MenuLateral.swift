//
//  MenuLateral.swift
//  MenuLateral
//
//  Created by Apple on 08/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit

@objc protocol MenuLateralDelegate
{
    func menuLateralDidSelectedButtonAtIndex(index: Int)
    optional func menuLateralAbrir()
    optional func menuLateralCerrar()
}


class MenuLateral: NSObject, MenuLateralControllerDelegate
{
    let ancholateral: CGFloat = 250.00
    let menulateraltableviewtopinset: CGFloat = 64.00
    let menulateralcontainerview: UIView = UIView()
    let menulateralcontroller:MenuLateralController = MenuLateralController()
    let vistaoriginal:UIView!
    var animacion: UIDynamicAnimator!
    var delegado:MenuLateralDelegate?
    var menulateralabierto:Bool = false
    
    override init()
    {
        vistaoriginal = UIView()
        super.init()
    }
    init(_vistaoriginal:UIView, _elementosmenu: [[String]])
    {
        vistaoriginal = _vistaoriginal
        super.init()
        menulateralcontroller.elementosmenu = _elementosmenu
        
        configurarMenuLateral()
        
        animacion=UIDynamicAnimator(referenceView: vistaoriginal)
  
        let mostrarGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "manejadorDeslizar:")
        mostrarGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        vistaoriginal.addGestureRecognizer(mostrarGestureRecognizer)
        let ocultarGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "manejadorDeslizar:")
        ocultarGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        vistaoriginal.addGestureRecognizer(ocultarGestureRecognizer)
        
    }
    
    func configurarMenuLateral()
    {
        menulateralcontainerview.frame = CGRectMake(-ancholateral-1, vistaoriginal.frame.origin.y, ancholateral, vistaoriginal.frame.size.height)
        menulateralcontainerview.backgroundColor = UIColor.clearColor()
        menulateralcontainerview.clipsToBounds = false
        vistaoriginal.addSubview(menulateralcontainerview)
        let blurview: UIVisualEffectView = UIVisualEffectView( effect: UIBlurEffect(style: UIBlurEffectStyle.Light ) )
        blurview.frame = menulateralcontainerview.bounds
        menulateralcontainerview.addSubview(blurview)
        
        menulateralcontroller.delegado = self
        menulateralcontroller.tableView.frame = menulateralcontainerview.bounds
        menulateralcontroller.tableView.clipsToBounds = false
        menulateralcontroller.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        menulateralcontroller.tableView.backgroundColor = UIColor.clearColor()
        menulateralcontroller.tableView.scrollsToTop = false
        menulateralcontroller.tableView.contentInset = UIEdgeInsetsMake(menulateraltableviewtopinset, 0, 0, 0)
        
        menulateralcontroller.tableView.reloadData()
        
        menulateralcontainerview.addSubview(menulateralcontroller.tableView)
        
    }
    
    func manejadorDeslizar(_recognizer: UISwipeGestureRecognizer)
    {
        mostrarMenuLateral(_recognizer.direction == UISwipeGestureRecognizerDirection.Right)
    }
    
    func mostrarMenuLateral(_mostrar: Bool)
    {
        animacion.removeAllBehaviors()
        menulateralabierto = _mostrar
        if (menulateralabierto)
        {
            delegado?.menuLateralAbrir?()
        }
        else
        {
            delegado?.menuLateralCerrar?()
        }
        
        let gravedadx: CGFloat = menulateralabierto ? 0.50 : -0.50
        let magnitud: CGFloat = menulateralabierto ? 20.00 : -20.00
        let limitex: CGFloat = menulateralabierto ? ancholateral : -ancholateral - 1
        
        let gravitybehaviuor : UIGravityBehavior = UIGravityBehavior( items: [menulateralcontainerview])
        gravitybehaviuor.gravityDirection = CGVectorMake(gravedadx, 0)
        animacion.addBehavior(gravitybehaviuor)
        
        let collisionbehaviuor : UICollisionBehavior = UICollisionBehavior( items: [menulateralcontainerview])
        collisionbehaviuor.addBoundaryWithIdentifier("menuLateralLimite", fromPoint:  CGPointMake(limitex, 20), toPoint:  CGPointMake(limitex, vistaoriginal.frame.size.height))
        animacion.addBehavior(collisionbehaviuor)
        
        let pushbehaviuor : UIPushBehavior = UIPushBehavior( items: [menulateralcontainerview], mode: UIPushBehaviorMode.Instantaneous)
        pushbehaviuor.magnitude = magnitud
        animacion.addBehavior(pushbehaviuor)
        
        let menulateralbehavior : UIDynamicItemBehavior = UIDynamicItemBehavior( items: [menulateralcontainerview])
        menulateralbehavior.elasticity = 0.30
        animacion.addBehavior(menulateralbehavior)
        
        
    }
    
    func menuLateralControllerDidSelectedRow(_indexPath: NSIndexPath)
    {
        delegado?.menuLateralDidSelectedButtonAtIndex(_indexPath.row)
    }
   
}
