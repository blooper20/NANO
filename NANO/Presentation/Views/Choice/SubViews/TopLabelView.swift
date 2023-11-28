//
//  TopLabelView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import UIKit
import SnapKit

class TopLabelView: UIView {
    
    //MARK: - Declaration
    var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.mainTitle
        label.text = "어떤 노래방인가요?"
        label.textAlignment = .left
        label.asColor(targetString: "노래방", color: .main)
        
        return label
    }()
    
    var subTitleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.text = "노래방 브랜드에 해당하는 곡의 정보를 게시합니다."
        label.font = UIFont.subTitle
        label.textColor = .subText
        
        return label
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopLabelView {
    
    //MARK: - Add View
    func setUpSubViews() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        self.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(calculatingHeight(height: 17))
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
