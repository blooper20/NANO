//
//  PopUpPlaylistCell.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/06.
//

import UIKit
import SnapKit

final class PopUpPlaylistCell: UITableViewCell {

    //MARK: - Declaration
    private lazy var brandLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.cellMainText
        label.textColor = .black
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.cellSmallText
        label.sizeToFit()
        
        return label
    }()

    //MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fatalError("awakeFromNib() has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension PopUpPlaylistCell {
    
    //MARK: - Function
    private func setUpSubViews() {
        
        self.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(calculatingWidth(width: 16))
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 13))
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(brandLabel.snp.right).offset(calculatingWidth(width: 45))
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 13))
        }
    }
}

extension PopUpPlaylistCell: ReuseIdentifying {
    
    struct Model {
        let brand: String
        let title: String
    }
    
    func bind(model: Model) {
        brandLabel.text = model.brand
        titleLabel.text = model.title
    }
}
