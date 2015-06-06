//
//  PhotoViewController.swift
//  codepath-google
//
//  Created by Patrick on 6/5/15.
//  Copyright (c) 2015 dailydoog. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var photoMainView: UIView!
    
    let mainBgColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoMainView.backgroundColor = self.mainBgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
