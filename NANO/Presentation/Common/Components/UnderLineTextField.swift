//
//  UnderLineTextField.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/03.
//

import UIKit
import SnapKit

final class UnderLineTextField: UITextField {
    
    //MARK: - Declaration
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .main
        
        return view
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnderLineTextField {
    
    //MARK: - Function
    private func setUpView() {
        self.addSubview(underlineView)
        
        underlineView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(self.snp.bottom).inset(1)
        }
    }
}


