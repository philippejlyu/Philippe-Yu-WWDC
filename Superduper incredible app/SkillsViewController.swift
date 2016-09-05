//
//  SkillsViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-03-22.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
   
    
    @IBOutlet weak var violinImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stuffView: UIView!
    @IBOutlet weak var swiftTV: UITextView!
    @IBOutlet weak var CSharpTV: UITextView!
    @IBOutlet weak var HTML5TV: UITextView!
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var superTopView: UIView!

    //Apple TV
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var textView = UITextView()
    var textView2 = UITextView()
    var textView3 = UITextView()
    var textView4 = UITextView()
    var imageView = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    var imageView4 = UIImageView()
    var label = UILabel()
    var cLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stuffView.transform = CGAffineTransformMakeTranslation(0, -300)
        
        self.swiftTV.contentOffset = CGPointMake(0, 0)
        self.CSharpTV.contentOffset = CGPointMake(0, 0)
        self.HTML5TV.contentOffset = CGPointMake(0, 0)
        
       
        
        image.layer.cornerRadius = 38
        image.clipsToBounds = true
        backButton.alpha = 0
        
        superTopView.transform = CGAffineTransformMakeTranslation(600, 0)
        topView.transform = CGAffineTransformMakeTranslation(600, 0)
        middleView.transform = CGAffineTransformMakeTranslation(600, 0)
        bottomView.transform = CGAffineTransformMakeTranslation(600, 0)
        
        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupScreen()
        registerForScreenNotifications()
        /*
        topView.transform = CGAffineTransformMakeTranslation(600, 0)
        middleView.transform = CGAffineTransformMakeTranslation(600, 0)
        bottomView.transform = CGAffineTransformMakeTranslation(600, 0)
        */
        
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            
        })
        
        //Move the first one
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
            self.superTopView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
                self.topView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)
        
        //Move the second one
        UIView.animateWithDuration(0.5, delay: 0.6, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
            self.middleView.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        //Move the third one
        UIView.animateWithDuration(0.5, delay: 0.8, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
            self.bottomView.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        
        
        
        
        let delay = 0.6555 * Double(NSEC_PER_SEC)
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
                self.textView.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.textView2.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.textView3.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.textView4.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.imageView.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.imageView2.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.imageView3.transform = CGAffineTransformMakeTranslation(-600, 0)
                self.imageView4.transform = CGAffineTransformMakeTranslation(500, 0)
                self.label.transform = CGAffineTransformMakeTranslation(500, 0)
                self.cLabel.transform = CGAffineTransformMakeTranslation(-600, 0)
            })
            
        }
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, -300)
          
            self.backButton.alpha = 0
           
            
        })
        UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 9.5, options: [], animations: {
            self.superTopView.transform = CGAffineTransformMakeTranslation(600, 0)
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 9.5, options: [], animations: {
            self.topView.transform = CGAffineTransformMakeTranslation(600, 0)
            
            }, completion: nil)
        
        //Move the second one
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 9.5, options: [], animations: {
            self.middleView.transform = CGAffineTransformMakeTranslation(600, 0)
            }, completion: nil)
        //Move the third one
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 9.5, options: [], animations: {
            self.bottomView.transform = CGAffineTransformMakeTranslation(600, 0)
            }, completion: nil)
        
        
        let delay = 0.55 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.dismissViewControllerAnimated(false, completion: nil)

            
        })
        
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    
    //MARK: - Apple TV Code
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
        
        let image = UIImage(named: "Swift Logo")
        let image2 = UIImage(named: "Violin Right Side")
        let image3 = UIImage(named: "HTML5_Logo_512")
        let skillsImage = UIImage(named: "Skills")
        
        let background = UIImage(named: "Sky 2")
        let backgroundIV = UIImageView(image: background)
        backgroundIV.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(backgroundIV)
        let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        visualEffect.alpha = 1
        visualEffect.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(visualEffect)
        
        
        imageView = UIImageView(image: image)
        
        imageView2 = UIImageView(image: image2)
        
        imageView3 = UIImageView(image: image3)
        
        imageView4 = UIImageView(image: skillsImage)
        imageView4.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 45, y: (secondScreenView?.bounds.height)!/2.3 - 45, width: 90, height: 90)
        imageView4.transform = CGAffineTransformMakeTranslation(600, 0)
        imageView4.layer.cornerRadius = 45
        imageView4.clipsToBounds = true
        secondScreenView?.addSubview(imageView4)
        
        label.text = "Skills"
        label.font = UIFont(name: "Helevetica", size: 200.0)
        label.font = label.font.fontWithSize(30)
        label.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 50, y: (secondScreenView?.bounds.height)!/1.9 - 25, width: 100, height: 50)
        label.transform = CGAffineTransformMakeTranslation(600, 0)
        label.textAlignment = .Center
        secondScreenView?.addSubview(label)
        
        
        textView.text = "Swift is the first programming language I learned. When it first came out at WWDC, I was ready for it! I consider myself quite familiar with Swift."
        textView.backgroundColor = UIColor.clearColor()
        textView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5 - 150, y: (secondScreenView?.bounds.height)!/7 - 75, width: 300, height: 150)
        textView.font = textView.font?.fontWithSize(20)
        textView.editable = false
        textView.selectable = false
        textView.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(textView)
        
        imageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/7.8 - 150, y: (secondScreenView?.bounds.height)!/6.4 - 75, width: 90, height: 90)
        imageView.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(imageView)
        
        
        
        textView2.text = "I am very experienced in playing the violin since I began when I was 4-years-old. I've been playing for 11-and-a-half years. I will be doing my grade 10 RCM exam in June."
        textView2.backgroundColor = UIColor.clearColor()
        textView2.frame = CGRect(x: (secondScreenView?.bounds.width)!/5 - 150, y: (secondScreenView?.bounds.height)!/3 - 75, width: 300, height: 150)
        textView2.font = textView.font?.fontWithSize(20)
        textView2.editable = false
        textView2.selectable = false
        textView2.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(textView2)
        imageView2.frame = CGRect(x: (secondScreenView?.bounds.width)!/7.8 - 150, y: (secondScreenView?.bounds.height)!/2.8 - 75, width: 90, height: 90)
        imageView2.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(imageView2)
        
        textView3.text = "I am beginning to learn C# in my programming class at school so I can make 3D games in the Unity SDK. I have made two 3D games so far."
        textView3.backgroundColor = UIColor.clearColor()
        textView3.frame = CGRect(x: (secondScreenView?.bounds.width)!/5 - 150, y: (secondScreenView?.bounds.height)!/1.8 - 75, width: 300, height: 150)
        textView3.font = textView.font?.fontWithSize(20)
        textView3.editable = false
        textView3.selectable = false
        textView3.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(textView3)
        cLabel.text = "C#"
        cLabel.font = cLabel.font.fontWithSize(60)
        cLabel.font = UIFont.systemFontOfSize(60, weight: UIFontWeightThin)
        cLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/7.8 - 150, y: (secondScreenView?.bounds.height)!/1.7 - 75, width: 90, height: 90)
        cLabel.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(cLabel)
        
        textView4.text = "I started to learn HTML 5 when I was 11 years old on a trip to Mexico. This is one of the most useful skills I have acquired so far as it allows me to make websites and front ends for servers on the web."
        textView4.backgroundColor = UIColor.clearColor()
        textView4.frame = CGRect(x: (secondScreenView?.bounds.width)!/5 - 150, y: (secondScreenView?.bounds.height)!/1.3 - 85, width: 300, height: 170)
        textView4.font = textView.font?.fontWithSize(20)
        textView4.editable = false
        textView4.selectable = false
        textView4.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(textView4)
        imageView3.frame = CGRect(x: (secondScreenView?.bounds.width)!/7.8 - 150, y: (secondScreenView?.bounds.height)!/1.25 - 75, width: 90, height: 90)
        imageView3.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(imageView3)
        
        UIView.animateWithDuration(0.5, animations: {
            self.textView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView3.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView4.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageView2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageView3.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageView4.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label.transform = CGAffineTransformMakeTranslation(0, 0)
            self.cLabel.transform = CGAffineTransformMakeTranslation(0, 0)
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
        notificationCenter.addObserver(self, selector: #selector(SkillsViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(SkillsViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
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
