//
//  ThirdViewController.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 4/12/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

import UIKit
import ELState

class ThirdViewController: UIViewController, Subscriber {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.store.subscribe(self)
    }
    
    deinit {
        UIApplication.store.unsubscribe(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newState(state: HasSwitchStates, store: Store) {
        
    }
    
}

