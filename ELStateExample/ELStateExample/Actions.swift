//
//  Actions.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState

struct Switch1Action: Action {
    var data: Bool
}

struct Switch2Action: Action {
    var data: Bool
}

struct TextAction: Action {
    var data: String
}