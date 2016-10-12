//
//  ViewController.swift
//  
//
//  Created by Aaqib Hussain on 03/08/2015.
//  Copyright (c) 2015 Kode Snippets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var contain: UIView!
    
    var containerView: ContainerViewController?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentControl(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
        containerView!.segueIdentifierReceivedFromParent("first")
        
        }
        else{
        
        containerView!.segueIdentifierReceivedFromParent("second")
        
        }
    
    }
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "container"{
        
        containerView = segue.destinationViewController as? ContainerViewController
      
        
        }
    }



}

