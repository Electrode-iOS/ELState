//
//  CombineReducers.swift
//  ELState
//
//  Created by Brandon Sneed on 4/7/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public class CombineReducers: BaseReducer {
    private var reducers = [BaseReducer]()
    
    public init(_ reducers: [BaseReducer]) {
        self.reducers = reducers
    }
    
    public func _handleAction(action: Action, state: State?) -> State? {
        var newState = state
        
        for item in reducers {
            let alteredState = item._handleAction(action, state: newState)
            if let validState = alteredState {
                newState = validState
            } else {
                assertionFailure("Reducer `\(item)` returned an empty state for action `\(action)`!")
            }
        }
        
        return newState
    }
}