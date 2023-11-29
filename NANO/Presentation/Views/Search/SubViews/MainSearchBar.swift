//
//  MainSearchBar.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/28.
//

import UIKit

final class MainSearchBar: UISearchBar {
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainSearchBar {
    
    //MARK: - Function
    private func setUpColor() {
        self.searchTextField.leftView?.tintColor = .main
    }
}
