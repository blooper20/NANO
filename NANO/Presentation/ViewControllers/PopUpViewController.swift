//
//  PopUpViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/04.
//

import UIKit
import SnapKit

final class PopUpViewController: UIViewController {
    
    //MARK: - Declaration
    private var snapshotView: UIView
    private var popupView: PopUpView
    private var constentsView: UIView
    
    //MARK: - Initialize
    init(snapshotView: UIView, popupView: PopUpView, constentsView: UIView) {
        self.snapshotView = snapshotView
        self.constentsView = constentsView
        self.popupView = PopUpView(constentsView: constentsView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = snapshotView
        self.view.backgroundColor = .white
        
        setUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PopUpViewController {
    
    //MARK: - Function
    private func setUpView() {
        
        self.view.addSubview(popupView)
        popupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
