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
    private var contentView: UIView & ContentViewDelegating
    
    private let disposebag = DisposeBag()
    
    //MARK: - Initialize
    init(snapshotView: UIView, contentView: UIView & ContentViewDelegating) {
        self.snapshotView = snapshotView
        self.contentView = contentView
        self.popupView = PopUpView(contentView: contentView)
        
        super.init(nibName: nil, bundle: nil)
        setModalStyle()
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
        popupView.dismissButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true)
        }).disposed(by: disposebag)
    }
    
    private func setModalStyle() {
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .fullScreen
    }
}

//MARK: - Delegate
extension PopUpViewController: ContentViewDelegate {
    
    func contentViewAction(presentView: UIView & ContentViewDelegating, hasNavigation: Bool) {
        
        if hasNavigation {
            self.popupView.setUpNavigationView()
        } else {
            self.popupView.titleLabel.removeFromSuperview()
            self.popupView.sectionView.removeFromSuperview()
        }
        
        self.popupView.contentView = presentView
    }
    
    func dismissViewController() {
        self.dismiss(animated: true)
    }
}
