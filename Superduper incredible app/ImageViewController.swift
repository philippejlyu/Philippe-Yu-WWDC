//
//  ImageViewController.swift
//  Philippe Yu WWDC
//
//  Created by Philippe Yu on 2016-04-23.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation




class ImageViewController: UIViewController {

    @IBOutlet weak var playPausebutton: UIImageView!
    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var detailsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var detailsView: UIView!
    var showingDetails = true
    
    var imageFile: String!
    var pageIndex: Int!
    
    var player: AVPlayer!
    
    var videoPaused = false
    
    var time = CMTime()
     //var playerLayer: AVPlayerLayer?
    //var videoURL: NSURL?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        imageView.image = UIImage(named: self.imageFile)
        // Do any additional setup after loading the view.
        detailsTextView.contentOffset = CGPointMake(0, 0)
        setDetailsText()
        playVideoIfSupposed()
        playPausebutton.hidden = true

        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if imageFile == "Video" && UIScreen.screens().count == 1 {
            player.play()
            //playVideoIfSupposed()
        } else {
        
        }
        NSNotificationCenter.defaultCenter().postNotificationName(imageFile, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ImageViewController.playVideoIfSupposed), name: UIScreenDidConnectNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ImageViewController.playVideoIfSupposed), name: UIScreenDidDisconnectNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ImageViewController.connectPauseVideo), name: UIScreenDidConnectNotification, object: nil)
        
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        correctUI("viewWillAppear")
        //imageView.image = UIImage(named: self.imageFile)
        //detailsTextView.contentOffset = CGPointMake(0, 0)
        //setDetailsText()
      //  playVideoIfSupposed()
      //  playPausebutton.hidden = true
        if imageFile == "Video" && UIScreen.screens().count < 1 {
            player.play()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //self.view.layer.insertSublayer(playerLayer!, below: detailsView.layer)

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        if imageFile == "Video" {
            if UIScreen.screens().count == 1 {
            player.pause()
            }
        }
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidDisconnectNotification)
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidConnectNotification)
    }
    
    deinit {
        imageView = nil
        player = nil
    }
    
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
        switch UIDevice.currentDevice().orientation {
        case .Portrait:
            correctUI("didRotate")
            print("did rotate")
        case .LandscapeLeft:
            correctUI("didRotate")
            print("did rotate")

        case .LandscapeRight:
            correctUI("didRotate")
            print("did rotate")

        default:
            correctUI("didRotate")
            print("did rotate")

        }
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
            return UIInterfaceOrientationMask.Portrait
            return UIInterfaceOrientationMask.LandscapeRight
            return UIInterfaceOrientationMask.LandscapeLeft
        
           }
    
    
    func connectPauseVideo() {
        if imageFile == "Video" && videoPaused == false {
            player.pause()
            player = nil
        }
    }
   
    
    func setDetailsText() {
        //"Heart", "Homework Timer Screenshot", "Face", "Back Arrow", "Sky 2"
        
        
        
        switch imageFile {
            case "First time using a computer":
                detailsTextView.text = "This is the first time I ever used a computer in my whole life. I didn't know how to use it as demonstrated by the way I was holding the mouse."
                detailsTextView.textColor = UIColor.whiteColor()
                gestureRecognizer.enabled = false
            
            case "Me and my Brother proud of our iPods":
                detailsTextView.text = "In this photo, my brother and I are showing off our new iPods that we purchased with our own money."
                detailsTextView.textColor = UIColor.whiteColor()
                gestureRecognizer.enabled = false
            
            case "Face":
                detailsTextView.text = "I'm Philippe Yu. I am 15 years old, and this is what I look like."
                detailsTextView.textColor = UIColor.whiteColor()
                gestureRecognizer.enabled = false
            
            case "Using a Computer":
                detailsTextView.text = "This is another time when my brother and I were using the same computer. This photo was probably taken a few years later. This time, I actually knew what I was doing"
                detailsTextView.textColor = UIColor.whiteColor()
            gestureRecognizer.enabled = false
            
            case "Video":
                detailsTextView.text = "This is me playing the violin. The song I am playing is called Reel de la Pointe au Pic, a French-Canadian fiddling tune"
                detailsTextView.textColor = UIColor.whiteColor()
                gestureRecognizer.enabled = true
        
        default:
            detailsTextView.text = ""
            
        }
        
    }
    
    @IBAction func pauseVideo() {
        //player.pause()
        if UIScreen.screens().count == 1 {
        if videoPaused {
            player.play()
            videoPaused = false
            playPausebutton.image = UIImage(named: "Play Button")
            playPausebutton.transform = CGAffineTransformMakeScale(0.25, 0.25)
            playPausebutton.alpha = 1
            playPausebutton.hidden = false
            
           
            UIView.animateWithDuration(0.5, animations: {
                self.playPausebutton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.playPausebutton.alpha = 0
                
            })
            
            
        } else {
        player.pause()
            videoPaused = true
            playPausebutton.image = UIImage(named: "Pause button")
            playPausebutton.transform = CGAffineTransformMakeScale(0.25, 0.25)
            playPausebutton.alpha = 1
            playPausebutton.hidden = false
            
            UIView.animateWithDuration(0.5, animations: {
                self.playPausebutton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.playPausebutton.alpha = 0
                
            })
            
        }
        } else {
            
            if videoPaused {
                NSNotificationCenter.defaultCenter().postNotificationName("play", object: self)
                videoPaused = false
                playPausebutton.image = UIImage(named: "Play Button")
                playPausebutton.transform = CGAffineTransformMakeScale(0.25, 0.25)
                playPausebutton.alpha = 1
                playPausebutton.hidden = false
                
                
                UIView.animateWithDuration(0.5, animations: {
                    self.playPausebutton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                    self.playPausebutton.alpha = 0
                    
                })
            } else {
                NSNotificationCenter.defaultCenter().postNotificationName("pause", object: self)
                videoPaused = true
                playPausebutton.image = UIImage(named: "Pause button")
                playPausebutton.transform = CGAffineTransformMakeScale(0.25, 0.25)
                playPausebutton.alpha = 1
                playPausebutton.hidden = false
                
                UIView.animateWithDuration(0.5, animations: {
                    self.playPausebutton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                    self.playPausebutton.alpha = 0
                    
                })
            }
        }
    }

    
   
    
    func playVideoIfSupposed() {
        if UIScreen.screens().count > 1 {
            if imageFile == "Video" {
                imageView.image = UIImage(named: "Air Play indicator")
                
            }
        } else {
            
        
        if imageFile == "Video" {
            videoPaused = false
            
            var playerLayer: AVPlayerLayer?
            let videoURL: NSURL = NSBundle.mainBundle().URLForResource("WWDC video", withExtension: "mov")!
            player = AVPlayer(URL: videoURL)
            playerLayer = AVPlayerLayer(player: player)
            //playerLayer!.frame = self.view!.bounds
            playerLayer?.backgroundColor = UIColor.blackColor().CGColor
            //playerLayer?.frame = CGRect(x: 0, y: 225, width: 414, height: 250)
            playerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            
            //self.view!.layer.addSublayer(playerLayer!)
            player.play()
            self.view.layer.insertSublayer(playerLayer!, below: detailsView.layer)
            
        }
        }
    }
    
    
    func correctUI(caller: String) {
        
        //Set the height constraint for the details view
        if UIDevice.currentDevice().orientation == .Portrait || UIDevice.currentDevice().orientation == .PortraitUpsideDown {
            detailsHeightConstraint.constant = 128
        } else if UIDevice.currentDevice().orientation == .LandscapeLeft || UIDevice.currentDevice().orientation == .LandscapeRight {
            detailsHeightConstraint.constant = 64
        }
        //If it is done when the view is active, it will animate
        if caller == "didRotate" {
            UIView.animateWithDuration(0.2, delay: 0, options: [.CurveEaseOut], animations: {
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
        
        if imageFile == "Video" && UIScreen.screens().count == 1 {
            
            var playerLayer: AVPlayerLayer?
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.backgroundColor = UIColor.blackColor().CGColor
            playerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            //view.layer.addSublayer(playerLayer!)
            //player.allowsExternalPlayback = true
            //player.usesExternalPlaybackWhileExternalScreenIsActive = true
            self.view.layer.insertSublayer(playerLayer!, below: detailsView.layer)
        }
        
    }
    
    
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 

}


