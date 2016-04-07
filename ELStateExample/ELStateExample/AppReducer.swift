//
//  AppReducer.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState


class AppState: State, HasSwitchStates, HasTextState {
    var switch1: Bool = false
    var switch2: Bool = false
    var someText: String = ""
}

class AppReducer: Reducer {
    typealias StateType = AppState
    
    func handleAction(action: ActionType, state: AppState) -> AppState {
        var newState = state
        
        switch(action) {
        case is InitAction:
            let appState = AppState()
            appState.someText = "default"
            appState.switch1 = false
            appState.switch2 = true
            
            newState = appState
            break
            
        case is Switch1Action:
            newState = SwitchReducer().handleAction(action, state: state) as! StateType
            
        case is Switch2Action:
            newState = SwitchReducer().handleAction(action, state: state) as! StateType
            
        case is TextAction:
            newState = TextReducer().handleAction(action, state: state) as! StateType
            
        default:
            break
        }
        
        print("State = {\ntext: \(newState.someText)\nswitch1: \(newState.switch1)\nswitch2: \(newState.switch2)\n}")
        
        return newState
    }
}