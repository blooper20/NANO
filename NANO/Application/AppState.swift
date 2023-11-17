//
//  AppState.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import Foundation

class AppState {
    
    static let shared = AppState()
    
    private init() {}
    
    var brand: String = ""
}
