//
//  UIButton+.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/03.
//

import UIKit

extension UIButton {
    
    static var cancelConfig: UIButton.Configuration = {
        var config = UIButton.Configuration.borderedProminent()
        config.baseBackgroundColor = .systemRed
        config.baseForegroundColor = .white
        config.attributedTitle?.font = UIFont.buttonTitle

        return config
    }()
}
