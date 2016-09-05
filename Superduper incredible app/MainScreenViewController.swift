//
//  MainScreenViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-03-20.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet weak var faceButton: UIButton!
    @IBOutlet weak var interestsButton: UIButton!
    @IBOutlet weak var projectButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var timelineButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    
    //Second Screen properties
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
   

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //Make the buttons circles
        self.timelineButton.layer.cornerRadius = 38
        self.timelineButton.clipsToBounds = true
        
        self.skillsButton.layer.cornerRadius = 38
        self.skillsButton.clipsToBounds = true
        
        self.projectButton.layer.cornerRadius = 38
        self.projectButton.clipsToBounds = true
        
        self.interestsButton.layer.cornerRadius = 38
        self.interestsButton.clipsToBounds = true
        
        self.faceButton.layer.cornerRadius = 50
        self.faceButton.clipsToBounds = true
        
        self.contactButton.layer.cornerRadius = 38
        self.contactButton.clipsToBounds = true
        
        self.galleryButton.layer.cornerRadius = 38
        self.galleryButton.clipsToBounds = true

        //Make them hidden
        //timelineButton.hidden = true
        //projectButton.hidden = true
        //skillsButton.hidden = true
      //  interestsButton.hidden = true
        
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
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
    
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
        //Make the buttons start behind the face button
        timelineButton.transform = CGAffineTransformMakeTranslation(114, 12)
        projectButton.transform = CGAffineTransformMakeTranslation(60, 110)
        skillsButton.transform = CGAffineTransformMakeTranslation(-60, 110)
        interestsButton.transform = CGAffineTransformMakeTranslation(-114, 12)
        
        contactButton.transform = CGAffineTransformMakeTranslation(60, -110)
        galleryButton.transform = CGAffineTransformMakeTranslation(-60, -110)

        timelineButton.alpha = 1
        projectButton.alpha = 1
        skillsButton.alpha = 1
        interestsButton.alpha = 1
        contactButton.alpha = 1
        galleryButton.alpha = 1
        faceButton.alpha = 1
        //Make the face button big so it can become smaller
        faceButton.transform = CGAffineTransformMakeScale(4.5, 4.5)
    }
    
    override func viewDidAppear(animated: Bool) {
        setupScreen()
        registerForScreenNotifications()


        
        
        super.viewDidAppear(animated)
        //Make the buttons visible again to prepare for the animation
        self.timelineButton.hidden = false
        self.projectButton.hidden = false
        self.skillsButton.hidden = false
        self.interestsButton.hidden = false
        self.contactButton.hidden = false
        self.galleryButton.hidden = false

        UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                //Make facebutton smaller
                self.faceButton.transform = CGAffineTransformMakeScale(1, 1)

                }, completion: nil)
        
        //Wait for the face button to become smaller
        let delay = 0.75 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            
            UIView.animateWithDuration(0.25, animations: {
                //Run an animation that will make the buttons go to their respective places
                self.timelineButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.projectButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.skillsButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.interestsButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.contactButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.galleryButton.transform = CGAffineTransformMakeTranslation(0, 0)
            })
        })
       
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func timeline() {
        openSegue("Timeline")
    }
    
    @IBAction func projects() {
        openSegue("projects")
    }
    
    @IBAction func skills() {
        openSegue("skills")
    }
    
    @IBAction func interests() {
        openSegue("interests")
    }

    @IBAction func faceButton(sender: AnyObject) {
        openSegue("aboutMe")
    }
    @IBAction func viewGalleryButton() {
        openSegue("gallery")
    }
    @IBAction func contactMeButton() {
        openSegue("contact")
    }
    
    func openSegue(name: String) {
        UIView.animateWithDuration(0.4, animations: {
            self.timelineButton.transform = CGAffineTransformMakeTranslation(114, 12)
            self.projectButton.transform = CGAffineTransformMakeTranslation(60, 110)
            self.skillsButton.transform = CGAffineTransformMakeTranslation(-60, 110)
            self.interestsButton.transform = CGAffineTransformMakeTranslation(-114, 12)
            self.contactButton.transform = CGAffineTransformMakeTranslation(60, -110)
            self.galleryButton.transform = CGAffineTransformMakeTranslation(-60, -110)
        })
        
        
        
        
        UIView.animateWithDuration(0.3, delay: 0.1, options: [.CurveEaseIn], animations: {
            //Change the alpha 0.3 seconds after the button was pressed for a effect
            self.timelineButton.alpha = 0
            self.projectButton.alpha = 0
            self.skillsButton.alpha = 0
            self.interestsButton.alpha = 0
            self.contactButton.alpha = 0
            self.galleryButton.alpha = 0
            }, completion: nil)
        
        
        let delay = 0.444444 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            //Make it like this or else the dissolve animation looks bad
            self.timelineButton.hidden = true
            self.projectButton.hidden = true
            self.skillsButton.hidden = true
            self.interestsButton.hidden = true
            self.contactButton.hidden = true
            self.galleryButton.hidden = true
            UIView.animateWithDuration(0.5, animations: {
                //Make it dissolve
                self.faceButton.alpha = 0
            })
        })
        
        
        
        //Timer to delay so the animation runs
        let delay1 = 0.75 * Double(NSEC_PER_SEC)
        let time1 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay1))
        dispatch_after(time1, dispatch_get_main_queue(), {
            
      
            self.performSegueWithIdentifier(name, sender: self)
         
            
        })
        
        
    }
    
    
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
            secondScreenView?.backgroundColor = UIColor.whiteColor()
         
            let image = UIImage(named: "Sky 2")
            let imageView = UIImageView(image: image)
            imageView.frame = (secondScreenView?.bounds)!
            secondScreenView?.addSubview(imageView)
            let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
            visualEffect.alpha = 1
            visualEffect.frame = (secondScreenView?.bounds)!
            secondScreenView?.addSubview(visualEffect)
         
            let visualEffect1 = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
            visualEffect1.alpha = 1
            visualEffect1.frame = CGRect(x: (secondScreenView?.bounds.width)!/2 - 330, y: (secondScreenView?.bounds.height)!/2 - 80, width: 660, height: 160)
            visualEffect1.layer.cornerRadius = 10
            visualEffect1.clipsToBounds = true
            secondScreenView?.addSubview(visualEffect1)
            
            
            //visualEffect1.frame = CGRect(x: (secondScreenView?.bounds.width)!/2 - 165, y: (secondScreenView?.bounds.height)!/2 - 40, width: 330, height: 80)
            
            let externalLabel = UILabel()
            externalLabel.textAlignment = NSTextAlignment.Center
            externalLabel.font = UIFont(name: "Helevetica", size: 150.0)
            externalLabel.frame = (secondScreenView?.bounds)!
            externalLabel.text = "Click any of the buttons to see more info"
            externalLabel.transform = CGAffineTransformMakeScale(2, 2)
            secondScreenView?.addSubview(externalLabel)
         
            UIView.animateWithDuration(0.5, animations: {
                externalLabel.transform = CGAffineTransformMakeScale(1, 1)
                visualEffect1.frame = CGRect(x: (self.secondScreenView?.bounds.width)!/2 - 165, y: (self.secondScreenView?.bounds.height)!/2 - 40, width: 330, height: 80)
         
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
        notificationCenter.addObserver(self, selector: #selector(MainScreenViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(MainScreenViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
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
