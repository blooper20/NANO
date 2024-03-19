//
//  PopUpViewModel.swift
//  NANO
//
//  Created by DwaeWoo on 2024/03/12.
//

import UIKit

protocol ContentViewDelegate: AnyObject {
    func contentViewAction(presentView: UIView & ContentViewDelegating, navigation: Bool)
}

protocol ContentViewDelegating {
    var delegate: ContentViewDelegate? { set get }
}
