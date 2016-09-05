//
//  ContactViewController.swift
//  Philippe Yu WWDC
//
//  Created by Philippe Yu on 2016-04-26.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ContactViewController: UIViewController, SFSafariViewControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var twitterLabel: UILabel!
    @IBOutlet weak var stuffView: UIView!
    
    
    //Apple TV
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var label = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    var label4 = UILabel()
    var imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton.alpha = 0
        stuffView.transform = CGAffineTransformMakeTranslation(0, -200)
        twitterLabel.transform = CGAffineTransformMakeTranslation(0, 500)
        websiteButton.transform = CGAffineTransformMakeTranslation(0, 450)
        emailButton.transform = CGAffineTransformMakeTranslation(0, 400)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupScreen()
        registerForScreenNotifications()
        
        UIView.animateWithDuration(0.5, animations: {
            self.backButton.alpha = 1
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.twitterLabel.transform = CGAffineTransformMakeTranslation(0, 0)
            self.websiteButton.transform = CGAffineTransformMakeTranslation(0, 0)
            self.emailButton.transform = CGAffineTransformMakeTranslation(0, 0)
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

    @IBAction func website() {
        let safariVC = SFSafariViewController(URL: NSURL(string: "http://www.PhilippeYu.com")!)
        self.presentViewController(safariVC, animated: true, completion: nil)
        
    }
    
    @IBAction func sendMail() {
        let mailViewController = MFMailComposeViewController()
        
        if !MFMailComposeViewController.canSendMail() {
            let alert = UIAlertController(title: "Please setup Mail", message: "It seems like your email is not setup on this device.", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
            presentViewController(alert, animated: true, completion: nil)
            
        } else {
            mailViewController.mailComposeDelegate = self
            mailViewController.setToRecipients(["philippejlyu@gmail.com", "Philippejlyu@me.com"])
            mailViewController.setSubject("Congratulations Philippe")
            mailViewController.setMessageBody("You have won a scholarship to WWDC (dub dub dee see). We hope to see you there \n \n -Apple", isHTML: false)
            self.presentViewController(mailViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func back() {
        if UIScreen.screens().count > 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.imageView.transform = CGAffineTransformMakeTranslation(400, 0)
                self.label.transform = CGAffineTransformMakeTranslation(400, 0)
                self.label2.transform = CGAffineTransformMakeTranslation(-400, 0)
                self.label3.transform = CGAffineTransformMakeTranslation(-400, 0)
                self.label4.transform = CGAffineTransformMakeTranslation(-400, 0)
                
            })
        }
        UIView.animateWithDuration(0.5, animations: {
            self.backButton.alpha = 0
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, -200)
            self.twitterLabel.transform = CGAffineTransformMakeTranslation(0, 500)
            self.websiteButton.transform = CGAffineTransformMakeTranslation(0, 450)
            self.emailButton.transform = CGAffineTransformMakeTranslation(0, 400)
        })
        
        
        let delay = 0.55 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            
            //let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            //let vc  : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainScreen") as UIViewController
            self.dismissViewControllerAnimated(false, completion: nil)
            //self.removeFromParentViewController()
            //self.presentViewController(vc, animated: false, completion: nil)
            
 
            
        })
    }
    //MARK: - Delegate functions
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
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
        let image = UIImage(named: "Speech Bubble")
        imageView = UIImageView(image: image)
        /*
        let label = UILabel()
        let label2 = UILabel()
        let label3 = UILabel()
        let label4 = UILabel()
        */
        
        let background = UIImage(named: "Sky 2")
        let backgroundIV = UIImageView(image: background)
        backgroundIV.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(backgroundIV)
        let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        visualEffect.alpha = 1
        visualEffect.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(visualEffect)
        
        
        
        //customise the view
        secondScreenView?.backgroundColor = UIColor.whiteColor()
        
        
        imageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 45, y: (secondScreenView?.bounds.height)!/2.3 - 45, width: 90, height: 90)
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        imageView.transform = CGAffineTransformMakeTranslation(400, 0)
        secondScreenView?.addSubview(imageView)
        
        
        
        
        label.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 60, y: (secondScreenView?.bounds.height)!/1.9 - 25, width: 120, height: 50)
        label.font = UIFont(name: "Helevetica", size: 200.0)
        label.font = label.font.fontWithSize(30)
        label.textAlignment = .Center
        label.text = "Contact"
        label.transform = CGAffineTransformMakeTranslation(400, 0)
        secondScreenView?.addSubview(label)
        
        label2.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/2.5 - 75, width: 300, height: 150)
        label2.font = UIFont(name: "Helevetica", size: 150.0)
        label2.font = label2.font.fontWithSize(20)
        label.textAlignment = .Center
        label2.text = "Twitter @PhilippeYu"
        label2.transform = CGAffineTransformMakeTranslation(-400, 0)
        secondScreenView?.addSubview(label2)
        
        label3.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/2 - 75, width: 300, height: 150)
        label3.font = UIFont(name: "Helevetica", size: 150.0)
        label3.font = label3.font.fontWithSize(20)
        label.textAlignment = .Center
        label3.text = "PhilippeYu.com"
        label3.transform = CGAffineTransformMakeTranslation(-400, 0)

        secondScreenView?.addSubview(label3)
        
        label4.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.4 - 150, y: (secondScreenView?.bounds.height)!/1.65 - 75, width: 300, height: 150)
        label4.font = UIFont(name: "Helevetica", size: 150.0)
        label4.font = label4.font.fontWithSize(20)
        label.textAlignment = .Center
        label4.text = "philippejlyu@gmail.com"
        label4.transform = CGAffineTransformMakeTranslation(-400, 0)

        secondScreenView?.addSubview(label4)
        
        UIView.animateWithDuration(0.5, animations: {
            self.imageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label3.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label4.transform = CGAffineTransformMakeTranslation(0, 0)

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
        notificationCenter.addObserver(self, selector: #selector(ContactViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ContactViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
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
