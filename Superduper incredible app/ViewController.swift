//
//  ViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-03-18.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//
//  This code is not guranteed to work.

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var timer = NSTimer()

    @IBOutlet weak var buttonView: UIVisualEffectView!
    @IBOutlet var greetingView: UIVisualEffectView!
    @IBOutlet weak var airplayWarning: UILabel!
    
    //External display properties
    var secondWindow: UIWindow?
    var secondScreenView: UIView?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.greetingView.layer.cornerRadius = 20.0
        self.greetingView.clipsToBounds = true
        
        self.buttonView.layer.cornerRadius = 20.0
        self.buttonView.clipsToBounds = true
        airplayWarning.alpha = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        greetingView.transform = CGAffineTransformMakeScale(0, 0)
        //greetingView.layer.cornerRadius = 20.0
        //greetingView.clipsToBounds = true
        
        buttonView.transform = CGAffineTransformMakeScale(0, 0)
        

        
        let delay = 0.75 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.25, animations: {
                //Make the stuff full size
                self.greetingView.transform = CGAffineTransformMakeScale(1, 1)
                self.buttonView.transform = CGAffineTransformMakeScale(1, 1)
            })
        })
        
        
        //This delay thing is to delay the animations. It would've been better to have done it in the UIView.animateWithDuration
        let delay1 = 1.0 * Double(NSEC_PER_SEC)
        let time1 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay1))
        dispatch_after(time1, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.25, animations: {
                self.greetingView.transform = CGAffineTransformMakeScale(1, 1)
                self.buttonView.transform = CGAffineTransformMakeScale(1, 1)
                self.airplayWarning.alpha = 1
                //self.performSegueWithIdentifier("gooo", sender: self)
                
            })
        })

        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //Remove all observers for NSNotification center
        let notification = NSNotificationCenter.defaultCenter()
        notification.removeObserver(UIScreenDidConnectNotification)
        notification.removeObserver(UIScreenDidDisconnectNotification)
        
        //Remove the apple TV stuff because this could cause a memory leak although unlikely.
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupScreen()
        registerForScreenNotifications()
        
        UIView.animateWithDuration(0.5, animations: {
            //Make the stuff full size
            self.greetingView.transform = CGAffineTransformMakeScale(1.25, 1.25)
            self.buttonView.transform = CGAffineTransformMakeScale(1.25, 1.25)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func close() {
                timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ViewController.finished), userInfo: nil, repeats: true)
        /*
        UIView.animateWithDuration(0.25, animations: {
            self.greetingView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            self.buttonView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            //self.performSegueWithIdentifier("gooo", sender: self)
        })
        
        let delay = 0.25 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.performSegueWithIdentifier("gooo", sender: self)
        })
          */
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    func finished() {
        
        counter += 1
        
        if counter == 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.buttonView.alpha = 0
                self.greetingView.alpha = 0
            })
            
        }
        if counter == 2 {
            //let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            //let vc  : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainScreen") as UIViewController
            //self.presentViewController(vc, animated: false, completion: nil)
            performSegueWithIdentifier("ShowMain", sender: self)
            
        }
        
    }
    
    //MARK: - Apple TV secondary display
    
    func setupScreen() {
        //Setup the screen
        //UIScreen shows if there are more than 1 screen connected via airplay or external display through VGA etc.
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
        //This is where we customize the view for the external display inslide this function.
        secondScreenView?.backgroundColor = UIColor.whiteColor()
        
        let image = UIImage(named: "Sky 2")
        let imageView = UIImageView(image: image)
        imageView.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(imageView)
        let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        visualEffect.alpha = 1
        visualEffect.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(visualEffect)
        
        
    }
    
    
    
    func disconnected() {
        //The things that happen when air play disconnects.
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
    }
    
    func registerForScreenNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        //UIScreenDidConnectNotification is for when the screen connects. It's a default Apple thing.
        notificationCenter.addObserver(self, selector: #selector(ViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
    }
   
}



