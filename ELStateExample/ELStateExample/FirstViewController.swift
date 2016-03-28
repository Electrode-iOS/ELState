//
//  FirstViewController.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import UIKit
import ELState

class FirstViewController: UIViewController, Subscriber {
    
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
        textField.text = state.someText
    }

    @IBOutlet weak var textField: UITextField!

    @IBAction func textChangedAction(sender: AnyObject) {
        let text = textField.text
        appStore?.dispatch(TextAction(data: text))
    }
    
    @IBAction func doneAction(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    @IBAction func toggleSwitchesAction(sender: AnyObject) {
        if let state = appStore?.state as? AppState {
            let switch1 = !state.switch1
            let switch2 = !state.switch2
            
            appStore?.dispatch(Switch1Action(data: switch1))
            appStore?.dispatch(Switch2Action(data: switch2))
        }
    }
}

