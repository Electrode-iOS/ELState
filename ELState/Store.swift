//
//  Store.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

//public typealias State = NSDictionary
@objc
public protocol State {
    
}

@objc
public class Store: NSObject {
    public var state: State? {
        get {
            let tempState = _state
            return tempState
        }
    }
    
    public init(reducer: Reducer) {
        self.reducer = reducer
        super.init()
        
        // Dispatch the InitAction so everyone puts in their default state.
        dispatch(InitAction())
    }
    
    public func subscribe(s: Subscriber) {
        if listeners.containsObject(s) {
            // this guy is already a subscriber, ignore him, he's drunk.
            return
        } else {
            listeners.addObject(s)
            if let currentState = state {
                s.newState(currentState)
            }
        }
    }
    
    public func unsubscribe(s: Subscriber) {
        listeners.removeObject(s)
    }
    
    public func dispatch(action: ActionType) {
        // this should only catch if a reducer attempts to dispatch an action.
        if isDispatching {
            assertionFailure("Reducers cannot dispatch actions!")
            return
        }
        
        // go into dispatch mode.
        isDispatching = true
        
        // get the state
        _state = reducer.handleAction(state, actionType: action)
        // dispatch it to all subscribers.
        if let state = state {
            let currentListeners = listeners.allObjects
            currentListeners.forEach {
                $0.newState(state)
            }
        }
        
        // we're done, turn it off
        isDispatching = false
    }
    
    private var _state: State? = nil
    // TODO: Make this atomic?
    private var isDispatching: Bool = false
    
    // we want a weak hold on any listeners in case they forget
    // to unsubscribe.
    private var listeners = NSHashTable.weakObjectsHashTable()
    // the main reducer for the application.
    private var reducer: Reducer

}