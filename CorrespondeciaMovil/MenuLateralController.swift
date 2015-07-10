//
//  MenuLateralController.swift
//  MenuLateral
//
//  Created by Apple on 08/07/15.
//  Copyright (c) 2015 mcanche. All rights reserved.
//

import UIKit

protocol MenuLateralControllerDelegate
{
    func menuLateralControllerDidSelectedRow(indexPath: NSIndexPath)
}

class MenuLateralController: UITableViewController
{
    var delegado : MenuLateralControllerDelegate?
    //var elementosmenu : Array<String> = [String][String]()
    var elementosmenu: [[String]] = [[]]
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return elementosmenu.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell)
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            // Configure the cell...
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel!.textColor = UIColor.darkTextColor()
            
            let selectedView : UIView = UIView(frame: CGRect(x:0, y:0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            
            cell!.selectedBackgroundView = selectedView
            
        }
        
        cell!.textLabel!.text = elementosmenu[indexPath.row][0]
        cell!.imageView!.image = UIImage(named: elementosmenu[indexPath.row][1])

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 45.00
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        delegado?.menuLateralControllerDidSelectedRow(indexPath)
    }
    
}
