//
//  Reducer.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public protocol BaseReducer: class {
    func _handleAction(action: AnyAction, state: State?) -> State?
}

public protocol Reducer: BaseReducer {
    associatedtype StateType

    func handleAction(action: AnyAction, state: StateType?) -> StateType
}

public extension Reducer {
    public func _handleAction(action: AnyAction, state: State?) -> State? {
        if state != nil {
            if let aState = state as? StateType {
                let thisState = aState
                let result = handleAction(action, state: thisState) as? State
                return result
            }
        }
        
        return nil
    }
}
