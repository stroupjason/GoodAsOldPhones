//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Jason Stroup on 11/16/17.
//  Copyright © 2017 Jason Stroup. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
//hold ctrl then click text or image in view storyboard and drag here to create outlet generated below
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    //add product name property to view controller to store value when it gets passed over.
    //this is an optional string
    var product: Product? //passed into the productNamelable.text below
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            if let p = product {
                productNameLabel.text = p.name //text for the label
                if let i = p.productImage {
                    productImageView.image = UIImage(named: i)
            }
        }
    }
    //wire up button to trigger a button to print a message to console after every click event
    //connection is not an outlet make sure to select "action"
    //
    @IBAction func addToCartPressed(_ sender: AnyObject) -> Void {
        print("Button tapped")
    }
}
