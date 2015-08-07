//
//  ContainerViewController.swift
//  sada
//
//  Created by Aaqib Hussain on 03/08/2015.
//  Copyright (c) 2015 Kode Snippets. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
 var firstVC: FirstViewController?
    var vc : UIViewController!
  
    var segueIdentifier : String!

    var lastViewController: UIViewController!
 
    override func viewDidLoad() {
        super.viewDidLoad()
            segueIdentifierReceivedFromParent("buttonOne")
       
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func segueIdentifierReceivedFromParent(button: String){
        if button == "buttonOne"
        {
        
            self.segueIdentifier = "first"
            self.performSegueWithIdentifier(self.segueIdentifier, sender: nil)
            
        
        }
        else if button == "buttonTwo"
        {
        
            self.segueIdentifier = "second"
            self.performSegueWithIdentifier(self.segueIdentifier, sender: nil)
           
        }
    
    
    }
    
    
   
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == segueIdentifier{
       
            

            if lastViewController != nil{
            
               
             lastViewController.view.removeFromSuperview()
               
            
            
            }

            
            
            vc = segue.destinationViewController as! UIViewController
            self.addChildViewController(vc)
            vc.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(vc.view)
            
            vc.didMoveToParentViewController(self)
            lastViewController = vc
            
        }
    
    }


}
