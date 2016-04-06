//
//  Reducer.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public protocol BaseReducer: class {
    func _handleAction(state: State?, actionType: ActionType) -> State?
}

public protocol Reducer: BaseReducer {
    associatedtype StateType: State

    func handleAction(state: StateType, actionType: ActionType) -> StateType
}

public extension Reducer {
    public func _handleAction(state: State?, actionType: ActionType) -> State? {
        var thisState: StateType
        
        if state == nil {
            thisState = StateType()
        } else {
            if let aState = state as? StateType {
                thisState = aState
            } else {
                return nil
            }
        }
        
        let result = handleAction(thisState, actionType: actionType)
        return result
    }
}