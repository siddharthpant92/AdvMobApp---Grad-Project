//
//  ViewController.swift
//  pathos
//
//  Created by Siddharth on 3/29/17.
//  Copyright © 2017 pathos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        logoImageView.contentMode = .scaleAspectFit
        let logoImage = UIImage(named: "logo")
        logoImageView.image = logoImage
        navigationItem.titleView = logoImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

