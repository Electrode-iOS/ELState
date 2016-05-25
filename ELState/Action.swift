//
//  Action.swift
//  ELState
//
//  Created by Brandon Sneed on 3/26/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

/// Base protocol from which all Actions should derive.
public protocol Action { }

/// Do nothing, just instructs the reducer to initialize it's state.
public struct InitAction: Action { }
