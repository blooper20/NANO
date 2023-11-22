//
//  BrandPickerView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import UIKit
import SnapKit

class BrandPickerView: UIView {
    
    
    //MARK: - Declaration
    var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BrandPickerView {
    
    //MARK: - Add View
    private func setUpSubView() {
        self.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setSelected() {
        let upLine = UIView(frame: CGRect(x: 0, y: 0, width: calculatingWidth(width: 200), height: 2))
        let underLine = UIView(frame: CGRect(x: 0, y: calculatingHeight(height: 90), width: calculatingWidth(width: 200), height: 2))
        
        upLine.backgroundColor = UIColor.main
        underLine.backgroundColor = UIColor.main
        
        pickerView.subviews[1].backgroundColor = .clear
        pickerView.subviews[1].addSubview(upLine)
        pickerView.subviews[1].addSubview(underLine)
    }
}
