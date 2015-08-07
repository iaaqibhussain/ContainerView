//
//  ViewController.swift
//  sada
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

    @IBAction func second(sender: AnyObject) {
    containerView!.segueIdentifierReceivedFromParent("buttonTwo")
      
    }

    @IBAction func first(sender: AnyObject) {

    containerView!.segueIdentifierReceivedFromParent("buttonOne")
    
    
    }

   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "container"{
        
        containerView = segue.destinationViewController as? ContainerViewController
      
        
        }
    }



}

