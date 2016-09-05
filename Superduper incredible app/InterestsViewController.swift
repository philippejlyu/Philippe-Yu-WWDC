//
//  InterestsViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-03-22.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stuffView: UIView!
    
    //Apple TV
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var imageView = UIImageView()
    var label = UILabel()
    var appleTVTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stuffView.transform = CGAffineTransformMakeTranslation(0, -300)
        textView.transform = CGAffineTransformMakeTranslation(0, 500)
        
        image.layer.cornerRadius = 38
        image.clipsToBounds = true
        backButton.alpha = 0
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupScreen()
        registerForScreenNotifications()
        //Make it so it doesn't auto scroll to the bottom
        textView.contentOffset = CGPointMake(0, 0)
        
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView.transform = CGAffineTransformMakeTranslation(0, 0)
            
        })
        
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.5, animations: {
                self.backButton.alpha = 1
            })
            
        })
        
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let notification = NSNotificationCenter.defaultCenter()
        notification.removeObserver(UIScreenDidConnectNotification)
        notification.removeObserver(UIScreenDidDisconnectNotification)
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back() {
        if UIScreen.screens().count > 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.imageView.transform = CGAffineTransformMakeTranslation(500, 0)
                self.label.transform = CGAffineTransformMakeTranslation(500, 0)
                self.appleTVTextView.transform = CGAffineTransformMakeTranslation(-500, 0)
                
            })
        }
        
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, -300)
            self.textView.transform = CGAffineTransformMakeTranslation(0, 500)
            self.backButton.alpha = 0
        })
        
        let delay = 0.55 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.dismissViewControllerAnimated(false, completion: nil)

            
        })
        
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    
    //MARK: - Apple TV code
    
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
        //Setup the variables
        //customise the view
        secondScreenView?.backgroundColor = UIColor.whiteColor()
        
        let background = UIImage(named: "Sky 2")
        let backgroundIV = UIImageView(image: background)
        backgroundIV.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(backgroundIV)
        let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        visualEffect.alpha = 1
        visualEffect.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(visualEffect)
        
        let image = UIImage(named: "Heart")
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 45, y: (secondScreenView?.bounds.height)!/2.3 - 45, width: 90, height: 90)
        imageView.transform = CGAffineTransformMakeTranslation(400, 0)
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        secondScreenView?.addSubview(imageView)
        
        
        label.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 100, y: (secondScreenView?.bounds.height)!/1.9 - 25, width: 200, height: 50)
        label.font = label.font.fontWithSize(30)
        label.textAlignment = .Center
        label.text = "Interests"
        
        label.transform = CGAffineTransformMakeTranslation(400, 0)
        secondScreenView?.addSubview(label)
        
        appleTVTextView.text = "    My main interest is programming as I find it very fun and engaging. It will also help me find a job in the future and start a great career. \n \n   My favourite subject at school is math. I could do equations for hours on end. It helps me since math is an important part of programming. I think that's why I find programming so fun. \n \n    Music is something that is part of my daily life as I practice the violin every day. I am now in grade 10 violin and have played for 11 years. During the summer, I play my violin on Granville Island to earn money. This allows me to buy computers and other equipment I need to make apps."
        appleTVTextView.backgroundColor = UIColor.clearColor()
        let height = (secondScreenView?.bounds.width)!/1.5
        if secondScreenView?.bounds.height == 1080 {
        appleTVTextView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/8, width: 300, height: (secondScreenView?.bounds.width)!/1.5)
            appleTVTextView.font = appleTVTextView.font?.fontWithSize(23)
        } else {
            appleTVTextView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/15, width: 300, height: (secondScreenView?.bounds.width)!/1.5)
            appleTVTextView.font = appleTVTextView.font?.fontWithSize(21)
        }
        
        appleTVTextView.editable = false
        appleTVTextView.selectable = false
        appleTVTextView.transform = CGAffineTransformMakeTranslation(-500, 0)
        secondScreenView?.addSubview(appleTVTextView)
        
        
        
        //interestsTextView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/2.5 - 75, width: 300, height: (secondScreenView?.bounds.width)!/1.5)
        //interestsTextView.textAlignment = .Center
        
        
        UIView.animateWithDuration(0.5, animations: {
            self.imageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label.transform = CGAffineTransformMakeTranslation(0, 0)
            self.appleTVTextView.transform = CGAffineTransformMakeTranslation(0, 0)
        })
        
    }
    
    
    
    func disconnected() {
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
    }
    
    func registerForScreenNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(InterestsViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(InterestsViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
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
