//
//  TimelineViewController.swift
//  Philippe Yu WWDC
//
//  Created by Philippe Yu on 2016-04-26.
//  Copyright © 2016 PhilippeYu. All rights reserved.
//

import UIKit

class TimelineViewController: UITableViewController {

    @IBOutlet weak var screenTableView: UITableView!
    
    @IBOutlet var cellone: UITableViewCell!
    
    var visualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    
    //AppleTV
    var secondWindow: UIWindow?
    var secondScreenView: UIView?
    var WWDCLabel = UILabel()
    var unityLabel = UILabel()
    var inventoryLabel = UILabel()
    var gamemakerLabel = UILabel()
    var swiftLabel = UILabel()
    var LLDLabel = UILabel()
    var gamesaladLabel = UILabel()
    var htmlLabel = UILabel()
    var violinLabel = UILabel()
    
    var WWDCimageView = UIImageView()
    var unityimageView = UIImageView()
    var inventoryimageView = UIImageView()
    var gamemakerimageView = UIImageView()
    var swiftimageView = UIImageView()
    var lldimageView = UIImageView()
    var gamesaladimageView = UIImageView()
    var htmlimageView = UIImageView()
    var violinimageView = UIImageView()
    
    var timer: NSTimer?
    var offset = CGFloat()
    var startAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualEffect.alpha = 1
        visualEffect.frame = self.view.frame
        self.view.addSubview(visualEffect)
        
        
        navigationController?.navigationBar.addSubview(visualEffect)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }
    
    func animationOffset() {
        //let offset = tableView.contentOffset.x
        if offset > -400 && offset < 90 {
            //WWDC is front and center
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, -800)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -4800)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -4800)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -5600)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -5600)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -6400)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -6400)
                
            })
            
        } else if offset > 90 && offset < 469 {
            //Unity
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, -900)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, -900)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -4800)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -4800)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -5600)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -5600)
            })
            
        } else if offset > 469 && offset < 845 {
            //Inventory made simple
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 1500)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, -800)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -4800)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -4800)
                
            })
            
        } else if offset > 845 && offset < 1104 {
            //Game maker
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, -800)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -4000)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -4000)
            })
            
        } else if offset > 1104 && offset < 1471 {
            //Swift
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, -800)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -3200)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -3200)
            })
            
        } else if offset > 1471 && offset < 1786 {
            //LLD
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -800)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
            })
        } else if offset > 1786 && offset < 2125 {
            //Game salad
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 4800)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 4800)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, -800)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
            })
        } else if offset > 2125 && offset < 2322.3 {
            //html
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 5600)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 5600)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 4800)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 4800)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, -800)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, -800)
            })
        } else {
            //violin
            UIView.animateWithDuration(0.75, animations: {
                self.WWDCimageView.transform = CGAffineTransformMakeTranslation(0, 6400)
                self.WWDCLabel.transform = CGAffineTransformMakeTranslation(0, 6400)
                self.unityimageView.transform = CGAffineTransformMakeTranslation(0, 5600)
                self.unityLabel.transform = CGAffineTransformMakeTranslation(0, 5660)
                self.inventoryimageView.transform = CGAffineTransformMakeTranslation(0, 4800)
                self.inventoryLabel.transform = CGAffineTransformMakeTranslation(0, 4800)
                self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, 4000)
                self.swiftimageView.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.swiftLabel.transform = CGAffineTransformMakeTranslation(0, 3200)
                self.lldimageView.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.LLDLabel.transform = CGAffineTransformMakeTranslation(0, 2400)
                self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, 1600)
                self.htmlimageView.transform = CGAffineTransformMakeTranslation(0, 800)
                self.htmlLabel.transform = CGAffineTransformMakeTranslation(0, 800)
                self.violinimageView.transform = CGAffineTransformMakeTranslation(0, 0)
                self.violinLabel.transform = CGAffineTransformMakeTranslation(0, 0)
            })
        }
        startAnimating = true
    }
    
    override func viewWillAppear(animated: Bool) {
        setupScreen()
        registerForScreenNotifications()
        UIView.animateWithDuration(0.5, animations: {
            self.visualEffect.alpha = 0
            self.visualEffect.effect = UIBlurEffect(style: .ExtraLight)
        })
        
        let delay = 0.55555555 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.5, animations: {
                self.view.willRemoveSubview(self.visualEffect)
                self.navigationController?.navigationBar.willRemoveSubview(self.visualEffect)
            })
            
        })
        
    }
    
    

    @IBAction func back() {
        timer?.invalidate()
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidConnectNotification)
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidDisconnectNotification)
        
        if UIScreen.screens().count > 1 {
            UIView.animateWithDuration(0.5, animations: {
               
                    self.WWDCimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.WWDCLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.unityimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.unityLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.inventoryimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.inventoryLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.gamemakerimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.gamemakerLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.swiftimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.swiftLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.lldimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.LLDLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.gamesaladimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.gamesaladLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.htmlimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.htmlLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
                    self.violinimageView.transform = CGAffineTransformMakeTranslation(3000, 0)
                    self.violinLabel.transform = CGAffineTransformMakeTranslation(-3000, 0)
            })
        }
        
        self.visualEffect.alpha = 0
        visualEffect.effect = UIBlurEffect(style: .Light)
        self.view.addSubview(self.visualEffect)
        
        navigationController?.navigationBar.addSubview(self.visualEffect)
        
        UIView.animateWithDuration(0.5, animations: {
            self.visualEffect.alpha = 1
        })
        
        let delay = 0.55555555 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.5, animations: {
                self.dismissViewControllerAnimated(false, completion: nil)

            })
            
        })
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidConnectNotification)
        NSNotificationCenter.defaultCenter().removeObserver(UIScreenDidDisconnectNotification)
    }
    // MARK: - Table view data source

    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if startAnimating {
            animationOffset()
        }
        //animationOffset()
        offset = scrollView.contentOffset.y
        print(scrollView.contentOffset.y)
        
    }
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Apple TV secondary display
    
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
        
        
        let wwdcImage = UIImage(named: "Hello WWDC")
        let unityImage = UIImage(named: "Unity Logo")
        let inventoryImage = UIImage(named: "Inventory Made Simple")
        let gamemakerImage = UIImage(named: "Game_maker_logo")
        let swiftImage = UIImage(named: "Swift Logo")
        let lldImage = UIImage(named: "LLD icon")
        let gamesaladImage = UIImage(named: "GameSalad Logo")
        let htmlImage = UIImage(named: "HTML5_Logo_512")
        let violinImage = UIImage(named: "Violin")
        
        WWDCimageView = UIImageView(image: wwdcImage)
        unityimageView = UIImageView(image: unityImage)
        inventoryimageView = UIImageView(image: inventoryImage)
        gamemakerimageView = UIImageView(image: gamemakerImage)
        swiftimageView = UIImageView(image: swiftImage)
        lldimageView = UIImageView(image: lldImage)
        gamesaladimageView = UIImageView(image: gamesaladImage)
        htmlimageView = UIImageView(image: htmlImage)
        violinimageView = UIImageView(image: violinImage)
        
        WWDCimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 250, y: (secondScreenView?.bounds.height)!/2 - 150, width: 500, height: 300)
        WWDCimageView.transform = CGAffineTransformMakeTranslation(700, 0)
        secondScreenView?.addSubview(WWDCimageView)
        WWDCLabel.text = "2016, go to WWDC"
        WWDCLabel.font = WWDCLabel.font.fontWithSize(30)
        WWDCLabel.textAlignment = .Right
        WWDCLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 150, y: (secondScreenView?.bounds.height)!/2 - 50, width: 300, height: 100)
        WWDCLabel.transform = CGAffineTransformMakeTranslation(-600, 0)
        secondScreenView?.addSubview(WWDCLabel)
        
        
        unityimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 150, y: (secondScreenView?.bounds.height)!/2 - 150, width: 300, height: 300)
        unityimageView.transform = CGAffineTransformMakeTranslation(0, -800)
        secondScreenView?.addSubview(unityimageView)
        unityLabel.text = "March 2016, Started learning C# with Unity"
        unityLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/4 - 300, y: (secondScreenView?.bounds.height)!/2 - 50, width: 600, height: 100)
        unityLabel.textAlignment = .Right
        unityLabel.transform = CGAffineTransformMakeTranslation(0, -800)

        unityLabel.font = unityLabel.font.fontWithSize(30)
        secondScreenView?.addSubview(unityLabel)
        
        
        inventoryimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 150, y: (secondScreenView?.bounds.height)!/2 - 150, width: 300, height: 300)
        inventoryimageView.transform = CGAffineTransformMakeTranslation(0, -1600)
        secondScreenView?.addSubview(inventoryimageView)
        inventoryLabel.text = "January 2016, second app on the app store"
        inventoryLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/4 - 300, y: (secondScreenView?.bounds.height)!/2 - 50, width: 600, height: 100)
        inventoryLabel.transform = CGAffineTransformMakeTranslation(0, -1600)
        inventoryLabel.font = inventoryLabel.font.fontWithSize(30)
        inventoryLabel.textAlignment = .Right
        secondScreenView?.addSubview(inventoryLabel)
        
        gamemakerimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 125, y: (secondScreenView?.bounds.height)!/2 - 125, width: 250, height: 250)
        gamemakerimageView.transform = CGAffineTransformMakeTranslation(0, -2400)
        secondScreenView?.addSubview(gamemakerimageView)
        gamemakerLabel.text = "October 2015, Started learning Game Maker Studio"
        gamemakerLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 350, y: (secondScreenView?.bounds.height)!/2 - 50, width: 700, height: 100)
        gamemakerLabel.transform = CGAffineTransformMakeTranslation(0, -2400)
        gamemakerLabel.textAlignment = .Right
        gamemakerLabel.font = gamemakerLabel.font.fontWithSize(30)
        secondScreenView?.addSubview(gamemakerLabel)
        
        swiftimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 128, y: (secondScreenView?.bounds.height)!/2 - 128, width: 256, height: 256)
        swiftimageView.transform = CGAffineTransformMakeTranslation(0, -3200)
        secondScreenView?.addSubview(swiftimageView)
        swiftLabel.text = "May 2015, Started learning Swift"
        swiftLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 350, y: (secondScreenView?.bounds.height)!/2 - 50, width: 700, height: 100)
        swiftLabel.transform = CGAffineTransformMakeTranslation(0, -3200)
        swiftLabel.textAlignment = .Right
        swiftLabel.font = swiftLabel.font.fontWithSize(30)
        secondScreenView?.addSubview(swiftLabel)
        
        lldimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 150, y: (secondScreenView?.bounds.height)!/2 - 150, width: 300, height: 300)
        lldimageView.transform = CGAffineTransformMakeTranslation(0, -4000)
        lldimageView.layer.cornerRadius = 20
        lldimageView.clipsToBounds = true
        secondScreenView?.addSubview(lldimageView)
        LLDLabel.text = "2012, Published my first app, Lizzy Land Defense"
        LLDLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 350, y: (secondScreenView?.bounds.height)!/2 - 50, width: 700, height: 100)
        LLDLabel.transform = CGAffineTransformMakeTranslation(0, -4000)
        LLDLabel.textAlignment = .Right
        LLDLabel.font = LLDLabel.font.fontWithSize(30)
        secondScreenView?.addSubview(LLDLabel)
        
        
        gamesaladimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 150, y: (secondScreenView?.bounds.height)!/2 - 150, width: 300, height: 300)
        gamesaladimageView.transform = CGAffineTransformMakeTranslation(0, -4800)
        secondScreenView?.addSubview(gamesaladimageView)
        gamesaladLabel.text = "2011, Started learning GameSalad"
        gamesaladLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 350, y: (secondScreenView?.bounds.height)!/2 - 50, width: 700, height: 100)
        gamesaladLabel.transform = CGAffineTransformMakeTranslation(0, -4800)
        gamesaladLabel.font = gamesaladLabel.font.fontWithSize(30)
        gamesaladLabel.textAlignment = .Right
        secondScreenView?.addSubview(gamesaladLabel)
        
        
        htmlimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 128, y: (secondScreenView?.bounds.height)!/2 - 128, width: 256, height: 256)
        htmlimageView.transform = CGAffineTransformMakeTranslation(0, -5600)
        secondScreenView?.addSubview(htmlimageView)
        htmlLabel.text = "December 2011, Started to learn HTML"
        htmlLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 350, y: (secondScreenView?.bounds.height)!/2 - 50, width: 700, height: 100)
        htmlLabel.transform = CGAffineTransformMakeTranslation(0, -5600)
        htmlLabel.font = htmlLabel.font.fontWithSize(30)
        htmlLabel.textAlignment = .Right
        secondScreenView?.addSubview(htmlLabel)
        
        violinimageView.frame = CGRect(x: (secondScreenView?.bounds.width)!/1.3 - 250, y: (secondScreenView?.bounds.height)!/2 - 166.75, width: 500, height: 333.5)
        violinimageView.transform = CGAffineTransformMakeTranslation(0, -6400)
        secondScreenView?.addSubview(violinimageView)
        violinLabel.text = "September 2004, Started learning the violin"
        violinLabel.frame = CGRect(x: (secondScreenView?.bounds.width)!/3.5 - 350, y: (secondScreenView?.bounds.height)!/2 - 50, width: 700, height: 100)
        violinLabel.transform = CGAffineTransformMakeTranslation(0, -6400)
        violinLabel.font = unityLabel.font.fontWithSize(30)
        violinLabel.textAlignment = .Right
        secondScreenView?.addSubview(violinLabel)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(TimelineViewController.animationOffset), userInfo: nil, repeats: true)
        
    }
    
    
    
    func disconnected() {
        secondScreenView?.removeFromSuperview()
        secondWindow?.removeFromSuperview()
        secondWindow = nil
        secondScreenView = nil
        timer?.invalidate()
    }
    
    func registerForScreenNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(TimelineViewController.setupScreen), name: UIScreenDidConnectNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(TimelineViewController.disconnected), name: UIScreenDidDisconnectNotification, object: nil)
    }

}
extension UINavigationController {
    override public func shouldAutorotate() -> Bool {
        return true
    }
    
    override public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
