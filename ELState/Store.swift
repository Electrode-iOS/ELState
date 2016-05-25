//
//  Store.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

@objc
public class Store: NSObject {
    public var state: State? {
        get {
            let tempState = _state
            return tempState
        }
    }
    
    public init(state: State, reducer: BaseReducer) {
        self.reducer = reducer
        self._state = state
        super.init()
        
        // Dispatch the InitAction so everyone puts in their default state.
        dispatch(InitAction())
    }
    
    public func subscribe(s: BaseSubscriber) {
        listeners.addObject(s)
        if let currentState = state {
            s._newState(currentState, store: self)
        }
    }
    
    public func unsubscribe(s: BaseSubscriber) {
        listeners.removeObject(s)
    }
    
    public func dispatch(action: AnyAction) {
        dispatch_async(dispatchQueue) { [weak self] in
            guard let strongSelf = self else { return }
            // get the state
            strongSelf._state = strongSelf.reducer._handleAction(action, state: strongSelf.state)
            // dispatch it to all subscribers, and on the  main thread.
            dispatch_async(dispatch_get_main_queue()) {
                if let state = strongSelf.state {
                    let enumerator = strongSelf.listeners.objectEnumerator()
                    while let listener = enumerator.nextObject() as? BaseSubscriber {
                        listener._newState(state, store: strongSelf)
                    }
                }
            }
        }
    }

    private var _state: State? = nil

    private let dispatchQueue = dispatch_queue_create("electrode.elstate", DISPATCH_QUEUE_SERIAL)
    
    // we want a weak hold on any listeners in case they forget
    // to unsubscribe.
    private var listeners = NSHashTable.weakObjectsHashTable()
    // the main reducer for the application.
    private var reducer: BaseReducer

}


private var __applicationStore: Store? = nil

extension UIApplication: StoreOwner {
    public class var store: Store {
        get {
            if __applicationStore == nil {
                assertionFailure("The main state store has not been set!")
            }
            return __applicationStore!
        }
        set(value) {
            if __applicationStore == nil {
                __applicationStore = value
            } else {
                assertionFailure("The main state store has already been set!")
            }
        }
    }
    
    public var store: Store {
        get {
            return UIApplication.store
        }
        set(value) {
            UIApplication.store = value
        }
    }
}



