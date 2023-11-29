//
//  Reusable.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/28.
//

import Foundation
import UIKit

public protocol ReuseIdentifying {

    /// `Cell` 을 구성하는 데이터들의 집합입니다.
    associatedtype Model

    /// A `reusableIdentifier` that will be used by `dequeueReusableCell(withIdentifier:for:)`.
    ///
    /// If you don't override, it's concrete class name.
    static var reuseIdentifier: String { get }

    func bind(model: Model)

}

extension ReuseIdentifying {

    public static var reuseIdentifier: String {
        return .init(describing: Self.self)
    }

}
