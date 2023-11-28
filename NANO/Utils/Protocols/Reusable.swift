//
//  Reusable.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/28.
//

import Foundation
import UIKit

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
