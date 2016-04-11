//
//  OtherReducers.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState

public protocol HasSwitchStates: State {
    var switch1: Bool { get set }
    var switch2: Bool { get set }
}

class SwitchReducer: Reducer {
    func handleAction(action: ActionType, state: HasSwitchStates) -> HasSwitchStates {
        var newState = state
        
        switch(action) {
        case is InitAction:
            newState.switch1 = true
            newState.switch2 = false
            break
            
        case is Switch1Action:
            newState.switch1 = (action.data as! Bool)
            break

        case is Switch2Action:
            newState.switch2 = (action.data as! Bool)
            break
            
            
        default:
            break
        }
        
        return newState
    }
}

protocol HasTextState: State {
    var someText: String { get set }
}

class TextReducer: Reducer {
    func handleAction(action: ActionType, state: HasTextState) -> HasTextState {
        var newState = state
        
        switch(action) {
        case is InitAction:
            newState.someText = ""
        case is TextAction:
            newState.someText = action.data as! String
            break
            
        default:
            break
        }
        
        return newState
    }
}