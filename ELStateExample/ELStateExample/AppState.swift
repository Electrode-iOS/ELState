//
//  AppReducer.swift
//  ELStateExample
//
//  Created by Brandon Sneed on 3/27/16.
//  Copyright © 2016 Electrode-iOS. All rights reserved.
//

import Foundation
import ELState


class AppState: State, HasSwitchStates, HasTextState {
    var switch1: Bool = false
    var switch2: Bool = false
    var someText: String = ""
}

