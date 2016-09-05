//
//  ProjectsViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-03-22.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UIPageViewControllerDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stuffView: UIView!
    
   
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    //Apple TV
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var imageView = UIImageView()
    var imageView2 = UIImageView()
    var label = UILabel()
    var label2 = UILabel()
    var textView = UITextView()
    var textView2 = UITextView()
    var activeVC = "inventory"

    deinit {
        
        print("Deinitialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()

        stuffView.transform = CGAffineTransformMakeTranslation(0, -300)
        
        image.layer.cornerRadius = 38
        image.clipsToBounds = true
        backButton.alpha = 0
        
        
        
        
        self.pageTitles = NSArray(objects: "Inventory Made Simple", "Homework Timer")
        self.pageImages = NSArray(objects: "Inventory Made Simple Screenshot", "Homework Timer Screenshot")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 800, self.view.frame.width, self.view.frame.size.height - 150)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        pageControl.backgroundColor = UIColor.whiteColor()
        
        
        
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupScreen()
        registerForScreenNotifications()
        
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.pageViewController.view.frame = CGRectMake(0, 150, self.view.frame.width, self.view.frame.size.height - 150)
            
        })
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.5, animations: {
                self.backButton.alpha = 1
            })
            
        })
        
        
        
        
    }
    /*
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        let pageContentViewController = pageViewController.viewControllers![0] as! ViewController
        let index = pageContentViewController.pageIndex
        
    }*/
    
    /*
     func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
     let currentPageIndex = (pendingViewControllers.last! as! ViewController).pageIndex!
     }
 */
    
    func oneAlphaNow() {
        UIApplication.sharedApplication().statusBarHidden = false
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.view.alpha = 1
            
            }, completion: nil)
        
        
        
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
    
    func zeroalphanow() {
       //self.stuffView.alpha = 0
        //self.backButton.alpha = 0
        //self.image.alpha  = 0
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
            self.view.alpha = 0
            //UIApplication.sharedApplication().statusBarHidden = true

            
            }, completion: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back() {
        
        /*
         var imageView = UIImageView()
         var imageView2 = UIImageView()
         var label = UILabel()
         var label2 = UILabel()
         var textView = UITextView()
         var textView2 = UITextView()
 */
        
        
        if UIScreen.screens().count > 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.imageView.transform = CGAffineTransformMakeTranslation(0, 900)
                self.imageView2.transform = CGAffineTransformMakeTranslation(0, -900)
                self.label.transform = CGAffineTransformMakeTranslation(0, 900)
                self.label2.transform = CGAffineTransformMakeTranslation(0, -900)
                self.textView.transform = CGAffineTransformMakeTranslation(0, 900)
                self.textView2.transform = CGAffineTransformMakeTranslation(0, -900)
                
            })
            
        }
        UIView.animateWithDuration(0.5, animations: {
            self.stuffView.transform = CGAffineTransformMakeTranslation(0, -300)
            self.pageViewController.view.frame = CGRectMake(0, 800, self.view.frame.width, self.view.frame.size.height - 150)
            self.backButton.alpha = 0
        })
        
        let delay = 0.55 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.dismissViewControllerAnimated(false, completion: nil)
        })
        
    }
    
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return ContentViewController()
        }
        
        let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
        
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index += 1
        
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
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
        secondScreenView?.backgroundColor = UIColor.whiteColor()
        
        
        let background = UIImage(named: "Sky 2")
        let backgroundIV = UIImageView(image: background)
        backgroundIV.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(backgroundIV)
        let visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        visualEffect.alpha = 1
        visualEffect.frame = (secondScreenView?.bounds)!
        secondScreenView?.addSubview(visualEffect)
        
        let image = UIImage(named: "Inventory Made Simple Screenshot")
        let image2 = UIImage(named: "Homework Timer Screenshot")
        
        
        
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 187.5, y: (secondScreenView?.bounds.height)!/2.1 - 333.5, width: 375, height: 667)
        imageView.transform = CGAffineTransformMakeTranslation(1000, 0)
        secondScreenView?.addSubview(imageView)
        
        imageView2 = UIImageView(image: image2)
        imageView2.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 187.5, y: (secondScreenView?.bounds.height)!/2.1 - 333.5, width: 375, height: 667)
        imageView2.transform = CGAffineTransformMakeTranslation(1000, 0)
        secondScreenView?.addSubview(imageView2)
        
        
        label.text = "Inventory Made Simple"
        label.font = UIFont(name: "Helevetica", size: 200.0)
        label.font = label.font.fontWithSize(30)
        label.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 175, y: (secondScreenView?.bounds.height)!/6.4 - 45, width: 350, height: 90)
        label.transform = CGAffineTransformMakeTranslation(-1000, 0)
        label.font = UIFont.systemFontOfSize(30, weight: UIFontWeightThin)
        secondScreenView?.addSubview(label)
        
        label2.text = "Homework Timer"
        label2.font = UIFont(name: "Helevetica", size: 200.0)
        label2.font = label.font.fontWithSize(30)
        label2.font = UIFont.systemFontOfSize(30, weight: UIFontWeightThin)
        
        label2.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 175, y: (secondScreenView?.bounds.height)!/6.4 - 45, width: 350, height: 90)
        label2.transform = CGAffineTransformMakeTranslation(-1000, 0)
        
        //label2.textAlignment = .Center
        secondScreenView?.addSubview(label2)
        
        textView2.text = "Homework Timer is an app that is currently in development. It allows teachers to track how long it takes for their students to do their homework for feedback on future assignments. Teachers will also be able to track how long their students practice their music instruments for band classes. It will be available this fall."
        textView2.font = label.font.fontWithSize(30)
        textView2.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 200, y: (secondScreenView?.bounds.height)!/2 - 225, width: 400, height: 450)
        textView2.editable = false
        textView2.selectable = false
        textView2.backgroundColor = UIColor.clearColor()
        textView2.transform = CGAffineTransformMakeTranslation(-1000, 0)
        secondScreenView?.addSubview(textView2)
        
        textView.text = "Inventory Made Simple is the first app that I completly worked on by myself without the help of a guided tutorial. It is also the first app I published to the app store. It allows you to track where you put your things. It is extremely versatile therefore allowing you to track inventory in a store or even in your own house."
        textView.font = label.font.fontWithSize(30)
        textView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 200, y: (secondScreenView?.bounds.height)!/2 - 225, width: 400, height: 450)
        textView.editable = false
        textView.selectable = false
        textView.backgroundColor = UIColor.clearColor()
        textView.transform = CGAffineTransformMakeTranslation(-1000, 0)
        secondScreenView?.addSubview(textView)
        
        if activeVC == "homeworkTimer" {
            homeworkTimerActive()
        } else {
            inventoryActive()
        }
 
        /*
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 187.5, y: (secondScreenView?.bounds.height)!/2.1 - 333.5, width: 375, height: 667)
        secondScreenView?.addSubview(imageView)
        
        
        imageView2 = UIImageView(image: image2)
        imageView2.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.2 - 187.5, y: (secondScreenView?.bounds.height)!/2.1 - 333.5, width: 375, height: 667)
        secondScreenView?.addSubview(imageView2)
        
        label.text = "Inventory Made Simple"
        label.font = label.font.fontWithSize(30)
        label.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 175, y: (secondScreenView?.bounds.height)!/6.4 - 45, width: 350, height: 90)
        secondScreenView?.addSubview(label)
        
        label2.text = "Homework Timer"
        label2.font = label2.font.fontWithSize(30)
        label2.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 175, y: (secondScreenView?.bounds.height)!/6.4 - 45, width: 350, height: 90)
        secondScreenView?.addSubview(label2)
        
        textView2.text = "Homework Timer is an app that is currently in development. It allows teachers to track how long it takes for their students to do their homework for feedback on future assignments. Teachers will also be able to track how long their students practice their music instruments for band classes. It will be available this fall."
        textView2.font = textView2.font?.fontWithSize(30)
        textView2.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 200, y: (secondScreenView?.bounds.height)!/2 - 225, width: 400, height: 450)
        textView2.editable = false
        textView2.selectable = false
        secondScreenView?.addSubview(textView2)
        
        textView.text = "Inventory Made Simple is the first app that I completly worked on by myself without the help of a guided tutorial. It is also the first app I published to the app store. It allows you to track where you put your things. It is extremely versatile therefore allowing you to track inventory in a store or even in your own house."
        textView.font = textView.font?.fontWithSize(30)
        textView.frame = CGRect(x: (secondScreenView?.bounds.width)!/5.6 - 200, y: (secondScreenView?.bounds.height)!/2 - 225, width: 400, height: 450)
        textView.editable = false
        textView.selectable = false
        secondScreenView?.addSubview(textView)
        
        //setup animations
        imageView.transform = CGAffineTransformMakeTranslation(1000, 0)
        imageView2.transform = CGAffineTransformMakeTranslation(1000, 0)
        label.transform = CGAffineTransformMakeTranslation(-1000, 0)
        label2.transform = CGAffineTransformMakeTranslation(-1000, 0)
        textView2.transform = CGAffineTransformMakeTranslation(-1000, 0)
        textView.transform = CGAffineTransformMakeTranslation(-1000, 0)
        */
        if activeVC == "homeworkTimer" {
            homeworkTimerActive()
            //textView.transform = CGAffineTransformMakeTranslation(-1000, 0)
        } else {
            inventoryActive()
            //textView2.transform = CGAffineTransformMakeTranslation(-1000, 0)
        }
        
        
        
    }
    
    func homeworkTimerActive() {
        activeVC = "homeworkTimer"
        print(activeVC)
        UIView.animateWithDuration(0.5, animations: {
            /*
            self.label.transform = CGAffineTransformMakeTranslation(-1000, 0)
            self.textView.transform = CGAffineTransformMakeTranslation(-1000, 0)
            self.imageView.transform = CGAffineTransformMakeTranslation(1000, 0)
            
            self.imageView2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView2.transform = CGAffineTransformMakeTranslation(0, 0)
             
 */
            self.label.transform = CGAffineTransformMakeTranslation(0, 900)
            self.textView.transform = CGAffineTransformMakeTranslation(0, 900)
            self.imageView.transform = CGAffineTransformMakeTranslation(0, 900)
            
            self.imageView2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.label2.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView2.transform = CGAffineTransformMakeTranslation(0, 0)
        })
    }
    
    func inventoryActive() {
        activeVC = "inventory"
        print(activeVC)
        UIView.animateWithDuration(0.5, animations: {
            /*
            self.label.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            self.imageView2.transform = CGAffineTransformMakeTranslation(1000, 0)
            self.label2.transform = CGAffineTransformMakeTranslation(-1000, 0)
            self.textView2.transform = CGAffineTransformMakeTranslation(-1000, 0)
 */
            self.label.transform = CGAffineTransformMakeTranslation(0, 0)
            self.textView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            self.imageView2.transform = CGAffineTransformMakeTranslation(0, -900)
            self.label2.transform = CGAffineTransformMakeTranslation(0, -900)
            self.textView2.transform = CGAffineTransformMakeTranslation(0, -900)

        })
        
    }
    
    
    
    func disconnected() {
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
        label.removeFromSuperview()
        textView.removeFromSuperview()
        imageView.removeFromSuperview()
        imageView2.removeFromSuperview()
        label2.removeFromSuperview()
        textView2.removeFromSuperview()
        textView2.transform = CGAffineTransformMakeTranslation(0, 0)
        textView.transform  = CGAffineTransformMakeTranslation(0, 0)
        label.transform = CGAffineTransformMakeTranslation(0, 0)
        label2.transform = CGAffineTransformMakeTranslation(0, 0)
        imageView2.transform = CGAffineTransformMakeTranslation(0, 0)
        imageView.transform = CGAffineTransformMakeTranslation(0, 0)
    }
    
    func registerForScreenNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(ProjectsViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ProjectsViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ProjectsViewController.inventoryActive), name: "Inventory Made Simple", object: nil)
        notificationCenter.addObserver(self, selector: #selector(ProjectsViewController.homeworkTimerActive), name: "Homework Timer", object: nil)
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
