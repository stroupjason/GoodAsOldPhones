//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Jason Stroup on 11/16/17.
//  Copyright © 2017 Jason Stroup. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    //setting the array values in the viewDidLoad, so we can have the cell titles dynamically display the correct names in the tables(cells)
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //insert product name
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        //for each product object, set their name, product image, and cell image
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
       
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        
        //set the array to have 4 values hardcoded:
//        productNames = ["1907 Wall Set", "1921 Dial Phone", "1937 Desk Set", "1984 Motorola Portable"]
        //custom classes refactored:
        products = [product1, product2, product3, product4]
        
    }
    
    //this is a view controller that has access to table-specific functions
    override func tableView(_ tableView: UITableView, //sets the number of rows
                   numberOfRowsInSection section: Int) -> Int //arrow means return (in this case an integer, below which is 5
        
    {
    //returns 5 rows // now in the table view in the numberOfRowsINSection function , update code to unwrap products array instead of productNames before that were hard-coded
        if let p =  products {
            return p.count
        }
        return 0 // if productNames array doesn't exist, we still need to reutrn zero rows
    }
        //this function runs one time for each row (5times in this case)
   override func tableView(_ tableView: UITableView,
                           cellForRowAt indexPath: IndexPath) -> UITableViewCell //creates one cell for each row, and will retun the TableView based on the function below:
    {
        //create the cells:
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) //this matches the identifier we added in the storyboard
        //check to see if textLabel exists
        
        let product = products?[indexPath.row] // set the product name, with an IndexPath that's built in to go through our array (like map and assign)
        
        //one of two ways to use conditional to check for optional value (if conditional statement)
        //second way, "optional chaining"
        if let p = product {
            cell.textLabel?.text =  p.name //placeholder for text:"Hello Friend"
            
            //add image view property that matches a view in our image catalog:
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            //adding the question mark after optional property means "first check if this exists"
        }
    }
       
        
    return cell
}
    //add prepare() function - why? this will run everytime a cell is triggered and where we are passing the product name dynamically
    //send the name dynamically to the ProductViewController
    //refactor above prepare() using guard statement 12 vs 19 lines:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    if segue.identifier == "ShowProduct" {
        let productVC = segue.destination as? ProductViewController
    
        guard let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for:cell) else {
                return //stops running the function
        }
        productVC?.product = products?[indexPath.row]
    
        }
    }
}



//override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//    if segue.identifier == "ShowProduct" {
//        let productVC = segue.destination as? ProductViewController
//
//        let cell = sender as? UITableViewCell
//        //unwrap the cell with optional binding
//        if let c = cell {
//            let indexPath = tableView.indexPath(for:c) //return an index path if you give it a cell, this is also optional so we have to unwrap this as well:
//            if let ip = indexPath {
//                let product = products?[ip.row]
//                //set the product view's controller property to the productName from the array that we just "tapped"
//                productVC?.product = product
//            }
//        }
//    }
//} //this is a lot of messy code, lots of code block nesting...

