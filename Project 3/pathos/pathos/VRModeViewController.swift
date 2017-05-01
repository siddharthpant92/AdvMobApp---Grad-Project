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
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        vrView.load(from: URL(string: videoURL))
        vrView.enableCardboardButton = true
        
        vrView.delegate = self
        
        vrView.displayMode = GVRWidgetDisplayMode.fullscreenVR
        
        print("Mode: VR")
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK:- Widget View
    func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!)
    {
        if content is NSURL
        {
            print("didLoadContent")
        }
    }
    
    func widgetView(_ widgetView: GVRWidgetView!, didFailToLoadContent content: Any!, withErrorMessage errorMessage: String!)
    {
        print("didn't load: \(errorMessage)")
    }
    
    func widgetView(_ widgetView: GVRWidgetView!, didChange displayMode: GVRWidgetDisplayMode)
    {
        print("did change")
        if(displayMode == GVRWidgetDisplayMode.embedded)
        {
            print("not full screen mode")
            vrView.pause()
        }
        else
        {
            print("full screen mode")
            vrView.play()
        }

    }
    
    func widgetViewDidTap(_ widgetView: GVRWidgetView!)
    {
        print("tapped")
    }
    
    
    
    
    //MARK:- VideoView View
    func videoView(_ videoView: GVRVideoView!, didUpdatePosition position: TimeInterval)
    {
        if position >= videoView.duration()
        {
            //GO TO INFORMATION PAGE
            //            videoView.seek(to: 0)
            //            videoView.play()
        }
    }

}
