//
//  StateOwner.swift
//  ELState
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation

public protocol StateOwner {
    var store: Store? { get }
}