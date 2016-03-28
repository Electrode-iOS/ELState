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
        appStore?.subscribe(self)
    }
    
    deinit {
        appStore?.unsubscribe(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newState(state: State) {
        guard let state = state as? AppState else {
            return
        }
        
        switch1.on = state.switch1
        switch2.on = state.switch2
    }

    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    @IBAction func switch1Changed(sender: AnyObject) {
        appStore?.dispatch(Switch1Action(data: switch1.on))
    }
    
    @IBAction func switch2Changed(sender: AnyObject) {
        appStore?.dispatch(Switch2Action(data: switch2.on))
    }
}

