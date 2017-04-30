//
//  StreamPreviewViewController.swift
//  pathos
//
//  Created by Siddharth on 4/16/17.
//  Copyright © 2017 pathos. All rights reserved.
//

import UIKit

class StreamPreviewViewController: UIViewController
{

    @IBOutlet weak var videoVRView: GVRVideoView!
    
    enum Media {
        static let videoURL = "https://s3-us-west-1.amazonaws.com/mybeautifulhome/Flat-Equirectangular_360.mp4"
    }
    
    var currentView: UIView?
    var currentDisplayMode = GVRWidgetDisplayMode.embedded
    var isPaused = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoVRView.load(from: URL(string: Media.videoURL))
        videoVRView.enableCardboardButton = true
        videoVRView.enableFullscreenButton = true
        videoVRView.isHidden = true
        videoVRView.delegate = self
    }
    
    func refreshVideoPlayStatus() {
        // 1. if full screen/vr, play video + not paused
        if currentView == videoVRView && currentDisplayMode != GVRWidgetDisplayMode.embedded {
            videoVRView?.play()
            isPaused = false
        }
            // 2. else, pause
        else {
            videoVRView?.pause()
            isPaused = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension StreamPreviewViewController: GVRWidgetViewDelegate
{
    func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!) {
        if content is NSURL {
            videoVRView.isHidden = false
            refreshVideoPlayStatus()
        }
    }
    
    func widgetView(_ widgetView: GVRWidgetView!, didFailToLoadContent content: Any!,
                    withErrorMessage errorMessage: String!)  {
        print(errorMessage)
    }
    
    func widgetView(_ widgetView: GVRWidgetView!, didChange displayMode: GVRWidgetDisplayMode) {
        currentView = widgetView
        currentDisplayMode = displayMode
        refreshVideoPlayStatus()
        
    }
    
    func widgetViewDidTap(_ widgetView: GVRWidgetView!) {
        guard currentDisplayMode != GVRWidgetDisplayMode.embedded else {return}
        // 2. if in imageVRView, remove image and append on the end of the image array and load next image immediately
        if isPaused {
            videoVRView?.play()
            print(currentView!)
            print(currentDisplayMode)
        } else {
            videoVRView?.pause()
            print(currentView!)
            print(currentDisplayMode)
        } // updates pause to reflect new play state
        isPaused = !isPaused
    }
}

extension StreamPreviewViewController: GVRVideoViewDelegate
{
    func videoView(_ videoView: GVRVideoView!, didUpdatePosition position: TimeInterval) {
        if position >= videoView.duration() {
            videoView.seek(to: 0)
            videoView.play()
        }
    }
}















