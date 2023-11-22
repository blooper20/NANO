//
//  ChoiceViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import UIKit
import SnapKit

class ChoiceViewController: UIViewController {
    
    //MARK: - Declaration
    private let choiceView = ChoiceView()
    let brandName = ["TJ", "금영", "JoySound", "DAM", "UGA"]
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubView()
        setPickerData()
    }
    
    override func viewWillLayoutSubviews() {
        choiceView.brandPickerView.setSelected()
    }
}

extension ChoiceViewController {
    
    //MARK: - Add View
    func setUpSubView() {
        view.backgroundColor = .white
        
        self.view.addSubview(choiceView)
        choiceView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setPickerData() {
        choiceView.brandPickerView.pickerView.dataSource = self
        choiceView.brandPickerView.pickerView.delegate = self
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
