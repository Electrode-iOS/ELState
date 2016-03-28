//
//  SwitchReducer.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState

typealias SwitchReducer1 = SwitchReducer

class SwitchReducer: Reducer {
    func handleAction(state: State?, actionType: ActionType) -> State? {
        guard let state = state as? AppState else {
            assertionFailure()
            return nil
        }
        
        switch(actionType) {
        case is Switch1Action:
            state.switch1 = !(actionType.data as! Bool)
            break

        case is Switch2Action:
            state.switch2 = !(actionType.data as! Bool)
            break
            
            
        default:
            break
        }
        
        // we couldn't do anything, so just return what came in.
        return state
    }
}