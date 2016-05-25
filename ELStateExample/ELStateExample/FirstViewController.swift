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
        
        UIApplication.store.subscribe(self)
        
        textField.addTarget(self, action: #selector(textChangedAction), forControlEvents: .AllEditingEvents)
    }
    
    deinit {
        UIApplication.store.unsubscribe(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newState(state: HasTextState, store: Store) {
        textField.text = state.someText
    }

    @IBOutlet weak var textField: UITextField!

    func textChangedAction(sender: AnyObject) {
        let text = textField.text
        UIApplication.store.dispatch(TextAction(data: text!))
    }
    
    @IBAction func doneAction(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    @IBAction func toggleSwitchesAction(sender: AnyObject) {
        let state = UIApplication.store.state as? HasSwitchStates
        
        let switch1 = !state!.switch1
        let switch2 = !state!.switch2
        
        UIApplication.store.dispatch(Switch1Action(data: switch1))
        UIApplication.store.dispatch(Switch2Action(data: switch2))
    }
}

