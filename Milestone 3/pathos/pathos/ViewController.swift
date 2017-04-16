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
        
        //On adding the left bar button item. title image got pushed to left. So added a 
        //left bar button item in storyboard but tint is clear.
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        logoImageView.contentMode = .scaleAspectFit
        let logoImage = UIImage(named: "logo")
        logoImageView.image = logoImage
        navigationItem.titleView = logoImageView

        self.navigationController?.navigationBar.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func unwind(segue: UIStoryboardSegue)
    {        
    }
    
}

