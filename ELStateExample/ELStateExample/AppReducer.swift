//
//  AppReducer.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState


class AppState: State {
    var switch1: Bool = false
    var switch2: Bool = false
    var someText: String = ""
}

public class AppReducer: Reducer {
    public func handleAction(state: State?, actionType: ActionType) -> State? {
        var newState = state
        
        switch(actionType) {
        case is InitAction:
            let appState = AppState()
            appState.someText = "default"
            appState.switch1 = false
            appState.switch2 = true
            
            newState = appState
            break
            
        case is Switch1Action:
            newState = SwitchReducer().handleAction(state, actionType: actionType)
            
        case is Switch2Action:
            newState = SwitchReducer().handleAction(state, actionType: actionType)
            
        case is TextAction:
            newState = TextReducer().handleAction(state, actionType: actionType)
            
        default:
            break
        }
        
        if let appState = newState as? AppState {
            print("State = {\ntext: \(appState.someText)\nswitch1: \(appState.switch1)\nswitch2: \(appState.switch2)\n}")
        }
        
        return newState
    }
}