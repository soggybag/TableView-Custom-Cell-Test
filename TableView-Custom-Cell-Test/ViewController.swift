//
//  ViewController.swift
//  TableView-Custom-Cell-Test
//
//  Created by mitchell hudson on 11/22/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

/*

This example implements a custom tableview cell. The cell uses custom labels, and an image.
The cell also contains a button and a switch. These use a delegate protcol to communicate 
with the main ViewController.

*/

import UIKit

// CatCellDelegate
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CatCellDelegate {

    // An array of Cats
    var array = [Cat]()
    
    // A reference to the tableview
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Delcare the cell type as a CatTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("CatCell") as! CatTableViewCell
        
        let cat = array[indexPath.row]
        
        // CatTableViewCells define these features. You can find IBOutlets in CatTableViewCell.swift
        cell.catNameLabel.text = cat.name
        cell.catLikeSwitch.on = cat.liked
        cell.catAgeLabel.text = "\(cat.age)"
        cell.catImageView.image = UIImage(named: cat.imageName)
        
        // CatTableViewCell defines a protcol to facilitate communication between the button and switch
        cell.delegate = self
        
        return cell
    }
    
    
    // MARK: CatCellDelegate
    
    // These CatTableCell delegate methods These methods recieve a reference to the cell from 
    // the message button, and the like Switch.
    
    func didChangeLike(sender: CatTableViewCell, like: Bool) {
        let indexPath = self.tableView.indexPathForCell(sender)
        array[(indexPath?.row)!].liked = like
        print("You liked a cat!")
    }
    
    
    func messageFromCatCell(sender: CatTableViewCell) {
        let indexPath = self.tableView.indexPathForCell(sender)
        print("Message button tapped in row: \(indexPath!.row)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a few cats to display. 
        array.append(Cat(name: "Fluffy", age: 3, imageName: "cat-1"))
        array.append(Cat(name: "Mr. Scruffy", age: 2, imageName: "cat-2"))
        array.append(Cat(name: "Frango", age: 4, imageName: "cat-3"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

