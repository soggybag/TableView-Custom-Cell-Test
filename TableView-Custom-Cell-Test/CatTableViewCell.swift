//
//  CatTableViewCell.swift
//  TableView-Custom-Cell-Test
//
//  Created by mitchell hudson on 11/22/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

/*

This tableview cell is assigned as the Class for the cell: "CatCell" in storyboard.

*/

import UIKit

// This protocol allows communication between the message button, and switch in the cell.
protocol CatCellDelegate: class {
    func didChangeLike(sender: CatTableViewCell, like: Bool)
    func messageFromCatCell(sender: CatTableViewCell)
    func catSound(sender: CatTableViewCell, says: String)
}




class CatTableViewCell: UITableViewCell {
    
    // A CatCellDelegate.
    weak var delegate: CatCellDelegate?

    // IBOutlets for custom cell elements.
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catAgeLabel: UILabel!
    @IBOutlet weak var catLikeSwitch: UISwitch!
    @IBOutlet weak var catMessageButton: UIButton!
    
    // Custom Actions for the button and switch
    @IBAction func catMessageButtonTapped(sender: AnyObject) {
        if self.delegate != nil {
            self.delegate?.messageFromCatCell(self)
            self.delegate?.catSound(self, says: "meow \(catNameLabel.text)")
        }
    }
    
    @IBAction func catLikeSwitchChanged(sender: AnyObject) {
        if self.delegate != nil {
            self.delegate!.didChangeLike(self, like: catLikeSwitch.on)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
