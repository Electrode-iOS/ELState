//
//  SecondViewController.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import UIKit
import ELState

class SecondViewController: UIViewController, Subscriber {
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
        switch1.on = state.switch1
        switch2.on = state.switch2
    }

    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    @IBAction func switch1Changed(sender: AnyObject) {
        UIApplication.store.dispatch(Switch1Action(data: switch1.on))
    }
    
    @IBAction func switch2Changed(sender: AnyObject) {
        UIApplication.store.dispatch(Switch2Action(data: switch2.on))
    }
}

