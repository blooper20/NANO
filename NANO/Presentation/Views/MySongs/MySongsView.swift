//
//  MySongsView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/01.
//

import UIKit
import SnapKit

final class MySongsView: UIView {
    
    //MARK: - Declaration
    lazy var playlistTableView: UITableView = {
       let tableView = UITableView()
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        tableView.backgroundColor = .clear
        
        let cellType = PlaylistCell.self
        tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)

        return tableView
    }()

    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MySongsView {
    
    //MARK: - Function
    
    private func setSubView() {
        
        self.addSubview(playlistTableView)
        playlistTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 20))
            make.top.equalToSuperview().offset(calculatingHeight(height: 50))
            make.bottom.equalToSuperview()
        }
    }
}
