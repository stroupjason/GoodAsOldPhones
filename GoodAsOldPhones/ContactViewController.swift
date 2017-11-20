//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Jason Stroup on 11/16/17.
//  Copyright © 2017 Jason Stroup. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//connect the scroll view to the main view (scroll view is a subview of the main view)
        view.addSubview(scrollView) //adds to hiearchy
        
// Do any additional setup after loading the view.
    }
//adding a function that runs after the viewDidLoad function to help with the content that's "cut-off"
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //set contect scroll size
        scrollView.contentSize = CGSize(width: 375, height: 1000)
        //last number should be large enough to hold all or your content desired on your page (example is for an iphone 6 hieght of 667 but the iphone X has a height of 800px, so no need.
        
    }
}
