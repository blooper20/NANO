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
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        let emojiConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: emojiConfig), for: .normal)
        
        return button
    }()
    
    private var contentsView: UIView

    //MARK: - Initialize
    convenience init(constentsView: UIView) {
        self.init()
        self.contentsView = constentsView
        
        setUpViews()
    }
    
    override init(frame: CGRect) {
        self.contentsView = UIView()
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
        
        self.popupView.addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom).offset(calculatingHeight(height: 10))
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 15))
        }
    }
}
