//
//  Subscriber.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public protocol BaseSubscriber {
    func _newState(state: State, store: Store)
}

public protocol Subscriber: BaseSubscriber {
    associatedtype StateType
    
    func newState(state: StateType, store: Store)
}

public extension Subscriber {
    func _newState(state: State, store: Store) {
        newState(state as! StateType, store: store)
    }
}