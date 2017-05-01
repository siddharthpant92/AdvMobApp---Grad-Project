//
//  StreamPreviewViewController.swift
//  pathos
//
//  Created by Siddharth on 4/16/17.
//  Copyright © 2017 pathos. All rights reserved.
//

import UIKit

class FullScreenModeViewController: UIViewController, GVRWidgetViewDelegate, GVRVideoViewDelegate
{

    @IBOutlet weak var videoVRView: GVRVideoView!
    
    let videoURL = "https://s3-us-west-1.amazonaws.com/mybeautifulhome/Flat-Equirectangular_360.mp4"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Mode: fullscreen")
        videoVRView.load(from: URL(string: videoURL))
        
        videoVRView.enableFullscreenButton = true
        
        videoVRView.delegate = self
        videoVRView.displayMode = GVRWidgetDisplayMode.fullscreen
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    //MARK:- Widget View
    func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!)
    {
        if content is NSURL
        {
            print("didLoad")
        }
    }

    func widgetView(_ widgetView: GVRWidgetView!, didFailToLoadContent content: Any!, withErrorMessage errorMessage: String!)
    {
        print("didn't load: \(errorMessage)")
    }

    func widgetView(_ widgetView: GVRWidgetView!, didChange displayMode: GVRWidgetDisplayMode)
    {
        print("didChange")
        if(displayMode == GVRWidgetDisplayMode.embedded)
        {
            print("not full screen mode")
            videoVRView.pause()
        }
        else
        {
            print("full screen mode")
            videoVRView.play()
        }
    }

    func widgetViewDidTap(_ widgetView: GVRWidgetView!)
    {
        print("Tapped")
    }
    
    
    
    
    
    //MARK:- Video View
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











