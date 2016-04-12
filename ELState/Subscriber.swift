//
//  Subscriber.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public protocol BaseSubscriber: AnyObject {
    func _newState(state: State, store: Store)
}

public protocol Subscriber: BaseSubscriber, Equatable, Hashable {
    associatedtype StateType
    
    func newState(state: StateType, store: Store)
}

public extension Subscriber {
    func _newState(state: State, store: Store) {
        newState(state as! StateType, store: store)
    }
}

public extension BaseSubscriber {
    var hashValue: Int {
        return 0
    }
}


// MARK: Equatable

/*public func ==<T: BaseSubscriber>(lhs: T, rhs: T) -> Bool {
    return lhs.hashValue == rhs.hashValue
}*/

/*public func !=<T: Subscriber>(lhs: T, rhs: T) -> Bool {
    return lhs.hashValue != rhs.hashValue
}*/

/*public func !=<T: BaseSubscriber>(lhs: T, rhs: T) -> Bool {
    return lhs.hashValue != rhs.hashValue
}*/
