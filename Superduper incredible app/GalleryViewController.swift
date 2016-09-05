//
//  GalleryViewController.swift
//  Philippe Yu WWDC
//
//  Created by Philippe Yu on 2016-04-21.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class GalleryViewController: UIViewController, UIPageViewControllerDataSource {

    @IBOutlet weak var backButton: UIButton!
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var viewControllers: NSArray?

    
    //Apple TV
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var firstComputerImageView = UIImageView()
    var iPodImageView = UIImageView()
    var faceImageView = UIImageView()
    var usingComputerImageView = UIImageView()
    var label = UILabel()
    var label2 = UILabel()
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer?
    var playedVideo = false
    var time = CMTime()
    var activeVC = "firsttimeComputer"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        backButton.layer.cornerRadius = 10
        backButton.clipsToBounds = true
        
        self.pageTitles = NSArray(objects: "First time using a computer", "Me and my Brother proud of our iPods", "Face", "Using a Computer", "Video")
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as ImageViewController
        viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height)
        
        self.addChildViewController(self.pageViewController)
        //self.view.addSubview(self.pageViewController.view)
        self.view.insertSubview(self.pageViewController.view, belowSubview: backButton)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageControl.backgroundColor = UIColor.blackColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
    }
    
    override func viewDidAppear(animated: Bool) {
        setupScreen()
        registerForScreenNotifications()
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1, animations: {
            self.view.backgroundColor = UIColor.blackColor()
        })
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        pageViewController.removeFromParentViewController()
        pageViewController = nil
        view.removeFromSuperview()
        let notification = NSNotificationCenter.defaultCenter()
        notification.removeObserver(UIScreenDidConnectNotification)
        notification.removeObserver(UIScreenDidDisconnectNotification)
        notification.removeObserver(self, name: "First time using a computer", object: nil)
        notification.removeObserver(self, name: "Me and my Brother proud of our iPods", object: nil)
        notification.removeObserver(self, name: "Face", object: nil)
        notification.removeObserver(self, name: "Using a Computer", object: nil)
        notification.removeObserver(self, name: "Video", object: nil)
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
        
    }
    
    /*
    override func viewWillUnload() {
        pageViewController.dismissViewControllerAnimated(false, completion: nil)
    }
    */
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> ImageViewController {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return ImageViewController()
        }
        
        let vc: ImageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ImageViewController") as! ImageViewController
        
        vc.imageFile = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
        
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ImageViewController
        var index = vc.pageIndex as Int
        
        
        if (index == 0 || index == NSNotFound) {
            return nil
            
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ImageViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index += 1
        
        if (index == self.pageTitles.count) {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    @IBAction func close() {
        //let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        //let vc  : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainScreen") as UIViewController
        if playedVideo == true {
            player.pause()
        }
        if UIScreen.screens().count > 1 {
        UIView.animateWithDuration(0.5, animations: {
            self.firstComputerImageView.transform = CGAffineTransformMakeTranslation(0, 10000)
            self.iPodImageView.transform = CGAffineTransformMakeTranslation(0, 10000)
            self.faceImageView.transform = CGAffineTransformMakeTranslation(0, 10000)
            self.usingComputerImageView.transform = CGAffineTransformMakeTranslation(0, 10000)
            self.playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(0, 10000))
        })

        
        let delay = 0.55 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Fade)
            self.dismissViewControllerAnimated(false, completion: nil)

        })
        } else {
            UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Fade)
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        
        
        //self.presentViewController(vc, animated: false, completion: nil)
    }
    
    
    //MARK: - Apple TV stuff
    
    func setupScreen() {
        if UIScreen.screens().count > 1 {
            //Find the second screen
            let secondScreen = UIScreen.screens()[1]
            
            //set up a window for the screen using the screen pixel dimensions
            secondWindow = UIWindow(frame: secondScreen.bounds)
            
            //tell the window which screen to use
            secondWindow?.screen = secondScreen
            
            //set the dimensions for the view for the external screen so it fills the screen
            secondScreenView = UIView(frame: secondWindow!.frame)
            
            
            //add the view to the second screens window
            secondWindow?.addSubview(secondScreenView!)
            
            //unhide the window
            secondWindow?.hidden = false
            customizeView()
        }
    }
    
    
    
    
    
    func customizeView() {
        //customise the view
        secondScreenView?.backgroundColor = UIColor.blackColor()
        
        let image = UIImage(named: "First time using a computer")
        let image2 = UIImage(named: "Me and my Brother proud of our iPods")
        let image3 = UIImage(named: "Face")
        let image4 = UIImage(named: "Using a Computer")
        
        
        
        firstComputerImageView = UIImageView(image: image)
        firstComputerImageView.frame = (secondScreenView?.bounds)!
        firstComputerImageView.transform = CGAffineTransformMakeTranslation(2000, 0)
        firstComputerImageView.contentMode = .ScaleAspectFit
        secondScreenView?.addSubview(firstComputerImageView)
        
        iPodImageView = UIImageView(image: image2)
        iPodImageView.frame = (secondScreenView?.bounds)!
        iPodImageView.transform = CGAffineTransformMakeTranslation(4000, 0)
        iPodImageView.contentMode = .ScaleAspectFit
        secondScreenView?.addSubview(iPodImageView)
        
        faceImageView = UIImageView(image: image3)
        faceImageView.frame = (secondScreenView?.bounds)!
        faceImageView.transform = CGAffineTransformMakeTranslation(6000, 0)
        faceImageView.contentMode = .ScaleAspectFit
        secondScreenView?.addSubview(faceImageView)
        
        usingComputerImageView = UIImageView(image: image4)
        usingComputerImageView.frame = (secondScreenView?.bounds)!
        usingComputerImageView.contentMode = .ScaleAspectFit
        usingComputerImageView.transform = CGAffineTransformMakeTranslation(8000, 0)
        secondScreenView?.addSubview(usingComputerImageView)
        
        
        let videoURL: NSURL = NSBundle.mainBundle().URLForResource("WWDC video", withExtension: "mov")!
        player = AVPlayer(URL: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.backgroundColor = UIColor.blackColor().CGColor
        playerLayer?.frame = (secondScreenView?.bounds)!
        playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(10000, 0))
        secondScreenView?.layer.addSublayer(playerLayer!)
        player.allowsExternalPlayback = true
        
        
        /*
         UIView.animateWithDuration(0.5, animations: {
         self.label.transform = CGAffineTransformMakeTranslation(0, 0)
         self.textView.transform = CGAffineTransformMakeTranslation(0, 0)
         self.imageView.transform = CGAffineTransformMakeTranslation(0, 0)
         })
         */
        if activeVC == "firsttimeComputer" {
            firsttimeComputer()
        } else if activeVC == "ipod" {
            ipod()
        } else if activeVC == "face" {
            face()
        } else if activeVC == "usingComputer" {
            usingComputer()
        } else if activeVC == "video" {
            video()
        }
        
    }
    
    func firsttimeComputer() {
        if playedVideo {
            player.pause()
        }
        activeVC = "firsttimeComputer"
        UIView.animateWithDuration(0.5, animations: {
            self.firstComputerImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.iPodImageView.transform = CGAffineTransformMakeTranslation(2000, 0)
            self.faceImageView.transform = CGAffineTransformMakeTranslation(4000, 0)
            self.usingComputerImageView.transform = CGAffineTransformMakeTranslation(6000, 0)
            self.playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(8000, 0))
        })
        
    }
    
    func ipod() {
        if playedVideo {
            player.pause()
        }
        activeVC = "ipod"
        UIView.animateWithDuration(0.5, animations: {
            self.firstComputerImageView.transform = CGAffineTransformMakeTranslation(-2000, 0)
            self.iPodImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.faceImageView.transform = CGAffineTransformMakeTranslation(2000, 0)
            self.usingComputerImageView.transform = CGAffineTransformMakeTranslation(4000, 0)
            self.playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(6000, 0))
        })
    }
    
    func face() {
        if playedVideo {
            player.pause()
        }
        activeVC = "face"
        UIView.animateWithDuration(0.5, animations: {
            self.firstComputerImageView.transform = CGAffineTransformMakeTranslation(-4000, 0)
            self.iPodImageView.transform = CGAffineTransformMakeTranslation(-2000, 0)
            self.faceImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.usingComputerImageView.transform = CGAffineTransformMakeTranslation(2000, 0)
            self.playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(4000, 0))
        })
    }
    
    func usingComputer() {
        if playedVideo {
            player.pause()
        }
        activeVC = "usingComputer"
        UIView.animateWithDuration(0.5, animations: {
            self.firstComputerImageView.transform = CGAffineTransformMakeTranslation(-6000, 0)
            self.iPodImageView.transform = CGAffineTransformMakeTranslation(-4000, 0)
            self.faceImageView.transform = CGAffineTransformMakeTranslation(-2000, 0)
            self.usingComputerImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(2000, 0))
        })
    }
    
    func video() {
        if UIScreen.screens().count > 1{
        player.play()
        playedVideo = true
        }
        activeVC = "video"
        UIView.animateWithDuration(0.5, animations: {
            self.firstComputerImageView.transform = CGAffineTransformMakeTranslation(-8000, 0)
            self.iPodImageView.transform = CGAffineTransformMakeTranslation(-6000, 0)
            self.faceImageView.transform = CGAffineTransformMakeTranslation(-4000, 0)
            self.usingComputerImageView.transform = CGAffineTransformMakeTranslation(-2000, 0)
            self.playerLayer?.setAffineTransform(CGAffineTransformMakeTranslation(0, 0))
        })
        
        
    }
    
    
    
    func disconnected() {
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
        if playedVideo {
            player.pause()
            
            
            
        }
    }
    
    func registerForScreenNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.firsttimeComputer), name: "First time using a computer", object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.ipod), name: "Me and my Brother proud of our iPods", object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.face), name: "Face", object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.usingComputer), name: "Using a Computer", object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.video), name: "Video", object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.play), name: "play", object: nil)
        notificationCenter.addObserver(self, selector: #selector(GalleryViewController.pause), name: "pause", object: nil)
        
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
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
