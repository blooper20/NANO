//
//  PopUpViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/04.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class PopUpViewController: UIViewController {
    
    //MARK: - Declaration
    private var snapshotView: UIView
    private var popupView: PopUpView
    private var contentsView: UIView
    private let disposebag = DisposeBag()
    
    //MARK: - Initialize
    init(snapshotView: UIView, contentView: UIView) {
        self.snapshotView = snapshotView
        self.contentsView = contentView
        self.popupView = PopUpView(constentsView: contentView)
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
        setDismissButton()
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
    
    private func setDismissButton() {
        popupView.dismissButton.rx.tap.subscribe(onNext: {
            self.dismiss(animated: true)
        }).disposed(by: disposebag)
    }
}
