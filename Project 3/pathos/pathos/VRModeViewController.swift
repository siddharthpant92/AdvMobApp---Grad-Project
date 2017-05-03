//
//  VRModeViewController.swift
//  pathos
//
//  Created by Siddharth on 4/30/17.
//  Copyright © 2017 pathos. All rights reserved.
//

import UIKit

class VRModeViewController: UIViewController, GVRWidgetViewDelegate, GVRVideoViewDelegate
{

    @IBOutlet var vrView: GVRVideoView!
    
    let videoURL = "https://s3-us-west-1.amazonaws.com/mybeautifulhome/Flat-Equirectangular_360.mp4"
    
    var isFinished = false //Set to true when video has finished playing
    var isError = false //Set to true if video fails to load
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        vrView.load(from: URL(string: videoURL))
        vrView.enableCardboardButton = true
        vrView.enableInfoButton = false
        
        vrView.delegate = self
        
        vrView.displayMode = GVRWidgetDisplayMode.fullscreenVR
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Widget View
//    func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!)
//    {
//    }
    
    func widgetView(_ widgetView: GVRWidgetView!, didFailToLoadContent content: Any!, withErrorMessage errorMessage: String!)
    {
        isError = true
        vrView.displayMode = GVRWidgetDisplayMode.embedded
    }
    
    func widgetView(_ widgetView: GVRWidgetView!, didChange displayMode: GVRWidgetDisplayMode)
    {
        if(displayMode == GVRWidgetDisplayMode.embedded)
        {
            vrView.pause()
            
            if(isFinished == true)
            {
                self.performSegue(withIdentifier: "VRToAbout", sender: self)
            }
            else if(isError == true)
            {
                let alert = UIAlertController(title: "Oops", message: "Something went wrong with loading your video. Please go back and try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            vrView.play()
        }
    }
    
//    func widgetViewDidTap(_ widgetView: GVRWidgetView!)
//    {
//    }
    
    
    
    //MARK:- VideoView View
    func videoView(_ videoView: GVRVideoView!, didUpdatePosition position: TimeInterval)
    {
        if position >= videoView.duration()
        {
            isFinished = true
            vrView.displayMode = GVRWidgetDisplayMode.embedded
        }
    }

}
