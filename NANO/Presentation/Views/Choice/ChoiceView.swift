//
//  ChoiceView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import UIKit
import SnapKit

final class ChoiceView: UIView {
    
    //MARK: - Declaration
    private let topLabelView = TopLabelView()
    let brandPickerView = BrandPickerView()
    private let onlyTitleButton = MainButton(title: "다음")
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChoiceView {
    
    //MARK: - Function
    func setUpSubView() {
        self.addSubview(topLabelView)
        topLabelView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(calculatingHeight(height: 135))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 27))
        }
        
        self.addSubview(brandPickerView)
        brandPickerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 95))
            make.top.equalTo(topLabelView.snp.bottom).offset(calculatingHeight(height: 138))
        }
        
        self.addSubview(onlyTitleButton)
        onlyTitleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 27))
            make.bottom.equalToSuperview().inset(calculatingHeight(height: 40))
            make.height.equalTo(calculatingHeight(height: 50))
        }
    }
}
