//
//  PopUpView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/04.
//

import UIKit
import SnapKit

final class PopUpView: UIView {

    //MARK: - Declaration
    private lazy var dimView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.8)
        
        return view
    }()
    
    lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "예약목록을 선택해주세요."
        label.textAlignment = .left
        label.font = UIFont.cellMainText
        label.textColor = .black
        label.sizeToFit()
        
        return label
    }()
    
    lazy var sectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .main
        
        return view
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        let emojiConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: emojiConfig), for: .normal)
        
        return button
    }()
    
    var contentView: UIView {
        willSet {
            self.resetContentView(newContentView: newValue)
        }
    }

    //MARK: - Initialize
    convenience init(contentView: UIView) {
        self.init()
        self.contentView = contentView
        
        setUpViews()
    }
    
    override init(frame: CGRect) {
        self.contentView = UIView()
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopUpView {
    
    //MARK: - Function
    private func setUpViews() {
        
        self.addSubview(dimView)
        dimView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.dimView.addSubview(popupView)
        popupView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 15))
        }
        
        self.popupView.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(calculatingHeight(height: 30))
            make.right.equalToSuperview().inset(calculatingWidth(width: 30))
            make.width.height.equalTo(50)
        }
        
        self.popupView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom).offset(calculatingHeight(height: 5))
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 15))
        }
    }
    
    private func resetContentView(newContentView: UIView) {
        
        self.contentView.removeFromSuperview()
        
        self.popupView.addSubview(newContentView)
        newContentView.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom).offset(calculatingHeight(height: 10))
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 15))
        }
    }
    
    func setUpNavigationView() {
        
        self.popupView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dismissButton)
            make.height.equalTo(dismissButton)
            make.left.equalToSuperview().inset(calculatingWidth(width: 20))
        }
        
        self.popupView.addSubview(sectionView)
        sectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(calculatingHeight(height: 10))
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
