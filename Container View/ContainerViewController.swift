//
//  ContainerViewController.swift
//  sada
//
//  Created by Aaqib Hussain on 03/08/2015.
//  Copyright (c) 2015 Kode Snippets. All rights reserved.
//

import UIKit

public class ContainerViewController: UIViewController {
    private var vc : UIViewController!
    
    private var segueIdentifier : String!
    /*Identifier For First Container SubView*/
    @IBInspectable internal var firstLinkedSubView : String!
    
    private var lastViewController: UIViewController!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
  
        if let identifier = firstLinkedSubView{
        segueIdentifierReceivedFromParent(identifier)
        }
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueIdentifierReceivedFromParent(button: String){
        
        
        
        self.segueIdentifier = button
        self.performSegueWithIdentifier(self.segueIdentifier, sender: nil)
        
        
        
        
    }
    
    
    
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == segueIdentifier{
            
            
            
            if lastViewController != nil{
                
                
                lastViewController.view.removeFromSuperview()
                
                
                
            }
            
            
            
            vc = segue.destinationViewController
            self.addChildViewController(vc)
            vc.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(vc.view)
            
            vc.didMoveToParentViewController(self)
            lastViewController = vc
            
        }
        
    }
    
    
}
