//
//  SongInfoCell.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/28.
//

import UIKit
import SnapKit

final class SongInfoCell: UITableViewCell {
    
    //MARK: - Declaration
    private lazy var numberLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.cellMainText
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.cellSubText
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var singerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.cellSubText
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

extension SongInfoCell {
    
    //MARK: - Function
    private func setUpSubViews() {
        
        self.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 40))
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(calculatingWidth(width: 5))
            make.width.equalTo(calculatingWidth(width: 120))
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(numberLabel.snp.right).offset(calculatingWidth(width: 17))
            make.right.equalToSuperview().inset(calculatingWidth(width: 40))
            make.top.equalToSuperview().offset(calculatingHeight(height: 20))
        }
        
        self.addSubview(singerLabel)
        singerLabel.snp.makeConstraints { make in
            make.left.equalTo(numberLabel.snp.right).offset(calculatingWidth(width: 17))
            make.right.equalToSuperview().inset(calculatingWidth(width: 40))
            make.top.equalTo(titleLabel.snp.bottom).offset(calculatingHeight(height: 20))
            make.bottom.equalToSuperview().inset(calculatingHeight(height: 20))
        }
    }
}

extension SongInfoCell: ReuseIdentifying {
    
    struct Model {
        let no: String
        let title: String
        let singer: String
    }
    
    func bind(model: Model) {
        numberLabel.text = model.no
        titleLabel.text = model.title
        singerLabel.text = model.singer
    }
}
