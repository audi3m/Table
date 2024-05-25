//
//  ShoppingTableViewCell.swift
//  Table
//
//  Created by J Oh on 5/24/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        
        set {
            var frame = newValue
            frame.origin.x += 20
            frame.size.width -= 2 * 20
            
            super.frame = frame
        }
    }
    
}
