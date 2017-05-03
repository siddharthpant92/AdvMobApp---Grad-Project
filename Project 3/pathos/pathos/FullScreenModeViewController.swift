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
    
    var isFinished = false //Set to true when video finishes playing
    var isError = false //Set to true when video fails to load
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        videoVRView.load(from: URL(string: videoURL))
        
        videoVRView.enableFullscreenButton = true
        videoVRView.enableInfoButton = false
        
        videoVRView.delegate = self
        videoVRView.displayMode = GVRWidgetDisplayMode.fullscreen
    }

    
    override func didReceiveMemoryWarning() {
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
        videoVRView.displayMode = GVRWidgetDisplayMode.embedded
    }

    func widgetView(_ widgetView: GVRWidgetView!, didChange displayMode: GVRWidgetDisplayMode)
    {
        if(displayMode == GVRWidgetDisplayMode.embedded)
        {
            videoVRView.pause()
            if(isFinished == true)
            {
                self.performSegue(withIdentifier: "FullscreenToAbout", sender: self)
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
            videoVRView.play()
        }
    }

//    func widgetViewDidTap(_ widgetView: GVRWidgetView!)
//    {
//    }
    
    
    
    
    
    //MARK:- Video View
    func videoView(_ videoView: GVRVideoView!, didUpdatePosition position: TimeInterval)
    {
        if position >= videoView.duration()
        {
            isFinished = true
            videoVRView.displayMode = GVRWidgetDisplayMode.embedded
        }
    }
}











