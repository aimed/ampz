//
//  TrackListTableView.swift
//  Ampz
//
//  Created by Maximilian Täschner on 8/16/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

import Cocoa

class TrackListTableView: NSTableView {
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
    override func reloadData() {
        super.reloadData()
        
        // update the size of the table
        let scrollView = self.superview?.superview
        if (scrollView as? NSScrollView != nil) {
            let constraints = scrollView!.constraints.filter {
                let x = $0 as! NSLayoutConstraint;
                return x.firstAttribute == NSLayoutAttribute.Height
            }
            
            if constraints.count > 0 {
                let constraint = constraints[0] as! NSLayoutConstraint
                constraint.constant = self.frame.height
            }
        }
    }
}
