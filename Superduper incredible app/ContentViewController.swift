//
//  ContentViewController.swift
//  Superduper incredible app
//
//  Created by Philippe Yu on 2016-04-08.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    

    var imageToSend = ""
    
    var counter = 0
    
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.imageView.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleText
        self.textView.scrollRangeToVisible(NSMakeRange(0, 0))
        textView.contentOffset = CGPointMake(0, 0)
        textView.setContentOffset(CGPointZero, animated: false)
        
        if titleLabel.text == "Inventory Made Simple" {
            textView.text = "Inventory Made Simple is the first app that I completly worked on by myself without the help of a guided tutorial. It is also the first app I published to the app store. It allows you to track where you put your things. It is extremely versatile therefore allowing you to track inventory in a store or even in your own house."
            
            
            
        } else {
            textView.text = "Homework Timer is an app that is currently in development. It allows teachers to track how long it takes for their students to do their homework for feedback on future assignments. Teachers will also be able to track how long their students practice their music instruments for band classes. It will be available this fall."
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        imageView = nil
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().postNotificationName(titleText, object: self)
    }
    
   
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func finished() {
        counter += 1
        
        if counter == 1 {
            imageToSend = imageFile!
            print(imageFile!)
            performSegueWithIdentifier("ShowImage", sender: self)
            
            
        }
        
        if counter == 2 {
            //self.view.alpha = 1
            self.titleLabel.alpha = 1
            
            self.textView.alpha = 1
            self.imageView.transform = CGAffineTransformMakeScale(1, 1)
            timer.invalidate()
            self.imageView.alpha = 1
            counter = 0
        }
        

    }
    
    func dismissImage(sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    

    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
*/
}
