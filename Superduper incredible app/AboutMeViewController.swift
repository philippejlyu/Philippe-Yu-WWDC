//
//  AboutMeViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-03-22.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {


    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stuffView: UIView!
    
    //Apple TV Stuff
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var imageView = UIImageView()
    var label = UILabel()
    var appleTVTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stuffView.transform = CGAffineTransformMakeTranslation(0, -400)
        textView.transform = CGAffineTransformMakeTranslation(0, 500)
        
        image.layer.cornerRadius = 38
        image.clipsToBounds = true

        backButton.alpha = 0
       
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupScreen()
        registerForScreenNotifications()
        //Prevents autoscroll
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
        
         NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidConnectNotification)
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidDisconnectNotification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        if UIScreen.screens().count > 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.label.transform = CGAffineTransformMakeTranslation(400, 0)
                self.imageView.transform = CGAffineTransformMakeTranslation(400, 0)
                self.appleTVTextView.transform = CGAffineTransformMakeTranslation(-500, 0)
            })
        }
        
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, -400)
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
        
        let image = UIImage(named: "Face")
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 45, y: (secondScreenView?.bounds.height)!/2.2 - 45, width: 90, height: 90)
        imageView.transform = CGAffineTransformMakeTranslation(400, 0)
        imageView.layer.cornerRadius = 44
        imageView.clipsToBounds = true
        secondScreenView?.addSubview(imageView)
        
        
        label.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 100, y: (secondScreenView?.bounds.height)!/1.8 - 25, width: 200, height: 50)
        label.font = label.font.fontWithSize(30)
        label.textAlignment = .Center
        label.text = "About Me"
        label.transform = CGAffineTransformMakeTranslation(400, 0)
        secondScreenView?.addSubview(label)
        
        appleTVTextView.text = "Hello, I am Philippe Yu, a 15 year old iOS developer from Vancouver, Canada. Ever since I was young, I liked to use computers, in fact, the first time I used a computer was when I was two years old. Now whenever I have spare time I am always making apps to learn swift. I started to learn Swift after my friend showed me some great resources to learn the language. After making my first app, I was hooked and can’t stop. In the future, I hope I will be able to work for Apple as a software engineer. It’s my dream job."
        appleTVTextView.backgroundColor = UIColor.clearColor()
        let height = (secondScreenView?.bounds.width)!/1.5
        if secondScreenView?.bounds.height == 1080 {
            appleTVTextView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/5, width: 300, height: (secondScreenView?.bounds.width)!/1.5)
            appleTVTextView.font = appleTVTextView.font?.fontWithSize(25)
        } else {
            appleTVTextView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/6, width: 300, height: (secondScreenView?.bounds.width)!/1.5)
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
        notificationCenter.addObserver(self, selector: #selector(AboutMeViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(AboutMeViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
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
