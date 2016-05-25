//
//  Action.swift
//  ELState
//
//  Created by Brandon Sneed on 3/26/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public protocol AnyAction {}

public protocol ActionType: AnyAction {
    var data: Any { get }
}

public struct InitAction: ActionType {
    public var data: Any { return "" }
}
