//
//  SongListView.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/17.
//

import UIKit
import SnapKit

final class SongListView: UIView {
    
    //MARK: - Declaration
    lazy var songInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        let cellType = SongInfoCell.self
        tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
        
        return tableView
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SongListView {
    
    //MARK: - Function
    private func setUpView() {
        
        self.addSubview(songInfoTableView)
        songInfoTableView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(calculatingHeight(height: 5))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 18))
        }
    }
}
