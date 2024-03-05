//
//  ChoiceViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import UIKit
import SnapKit

final class ChoiceViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var choiceView: ChoiceView = {
        let view = ChoiceView()
        view.brandPickerView.pickerView.dataSource = self
        view.brandPickerView.pickerView.delegate = self
        view.onlyTitleButton.addTarget(self, action: #selector(onlyTitleButtonTapped), for: .touchUpInside)
        return view
    }()
    let brandName = ["TJ", "금영", "JoySound", "DAM", "UGA"]
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = choiceView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        choiceView.brandPickerView.setSelected()
    }
}

//MARK: - DataSource, Delegate
extension ChoiceViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brandName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let color = UIColor.black

        return NSAttributedString(string: brandName[row], attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return calculatingHeight(height: 90)
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return calculatingWidth(width: 200)
    }
}

extension ChoiceViewController {
    //MARK: - Selector
    @objc func onlyTitleButtonTapped() {
        let customTabBarController = CustomTabBarController()
        self.navigationController?.pushViewController(customTabBarController, animated: true)
    }
}
