//
//  PlaylistCell.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/01.
//

import UIKit
import SnapKit

final class PlaylistCell: UITableViewCell {
    
    //MARK: - Declaration
    private lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .main
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var brandLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.cellMainText
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.cellMainText
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

extension PlaylistCell {
    
    private func setUpSubViews() {
        
        self.addSubview(cellBackgroundView)
        cellBackgroundView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 7.5))
        }
        
        cellBackgroundView.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(calculatingWidth(width: 16))
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 13))
        }
        
        cellBackgroundView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(brandLabel.snp.right).offset(calculatingWidth(width: 45))
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 13))
        }
        
    }
}

extension PlaylistCell: ReuseIdentifying {
    
    struct Model {
        let brand: String
        let title: String
    }
    
    func bind(model: Model) {
        brandLabel.text = model.brand
        titleLabel.text = model.title
    }
}
