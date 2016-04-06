//
//  OtherReducers.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState

protocol HasSwitchStates: State {
    var switch1: Bool { get set }
    var switch2: Bool { get set }
}

class SwitchReducer: Reducer {
    typealias StateType = HasSwitchStates
    
    func handleAction(state: StateType, actionType: ActionType) -> StateType {
        let newState = state
        
        switch(actionType) {
        case is InitAction:
            newState.switch1 = true
            newState.switch2 = false
            break
            
        case is Switch1Action:
            newState.switch1 = (actionType.data as! Bool)
            break

        case is Switch2Action:
            newState.switch2 = (actionType.data as! Bool)
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
    typealias StateType = HasTextState
    
    func handleAction(state: StateType, actionType: ActionType) -> StateType {
        let newState = state
        
        switch(actionType) {
        case is InitAction:
            newState.someText = ""
        case is TextAction:
            newState.someText = actionType.data as! String
            break
            
        default:
            break
        }
        
        return newState
    }
}