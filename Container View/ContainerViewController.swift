//
//  ContainerViewController.swift
//
//
//  Created by Aaqib Hussain on 03/08/2015.
//  Copyright (c) 2015 Kode Snippets. All rights reserved.
//

import UIKit

public class ContainerViewController: UIViewController {
    //Manipulating container views
    private weak var viewController : UIViewController!
    //Keeping track of containerViews
    private var containerViewObjects = Dictionary<String,UIViewController>()
    
    /** Specifies which ever container view is on the front */
    public var currentViewController : UIViewController{
        get {
            return self.viewController
            
        }
    }
    
    
    private var segueIdentifier : String!
    
    /*Identifier For First Container SubView*/
    @IBInspectable internal var firstLinkedSubView : String!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    public override func viewDidAppear(animated: Bool) {
        if let identifier = firstLinkedSubView{
            segueIdentifierReceivedFromParent(identifier)
        }
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueIdentifierReceivedFromParent(identifier: String){
        
        
        
        self.segueIdentifier = identifier
        self.performSegueWithIdentifier(self.segueIdentifier, sender: nil)
        
        
        
    }
    
    
    
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == segueIdentifier{
            
            
            //Remove Container View
            if viewController != nil{
                
                
                viewController.view.removeFromSuperview()
                viewController = nil
                
              
                
            }
            //Add to dictionary if isn't already there
            if ((self.containerViewObjects[self.segueIdentifier] == nil)){
                viewController = segue.destinationViewController
                self.containerViewObjects[self.segueIdentifier] = viewController
                
            }else{
                for (key, value) in self.containerViewObjects{
                    
                    if key == self.segueIdentifier{
                        
                        viewController = value
                        
                        
                    }
                    
                }
                
                
            }
            
            self.addChildViewController(viewController)
            viewController.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(viewController.view)
            viewController.didMoveToParentViewController(self)
           
            
        }
        
    }
    
    
}
