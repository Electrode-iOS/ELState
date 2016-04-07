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
    associatedtype StateType

    func handleAction(state: StateType, actionType: ActionType) -> StateType
}

public extension Reducer {
    public func _handleAction(state: State?, actionType: ActionType) -> State? {
        if state != nil {
            if let aState = state as? StateType {
                let thisState = aState
                let result = handleAction(thisState, actionType: actionType) as? State
                return result
            }
        }
        
        return nil
    }
}
