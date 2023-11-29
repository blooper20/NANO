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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return brandName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return calculatingHeight(height: 90)
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return calculatingWidth(width: 200)
    }
}
