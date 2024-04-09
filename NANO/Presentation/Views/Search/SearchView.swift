//
//  SearchView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/27.
//

import UIKit
import SnapKit

final class SearchView: UIView {
    
    //MARK: - Declaration
    lazy var singerTitleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["제목","가수"])
        segmentedControl.backgroundColor = .main

        return segmentedControl
    }()
    
    lazy var searchBar: MainSearchBar = {
        let searchBar = MainSearchBar()
        searchBar.placeholder = "검색할 내용을 입력하세요."
        
        return searchBar
    }()
    
    lazy var songInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = true
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
        
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    
    //MARK: - Function
    private func setUpSubViews() {
        
        self.addSubview(singerTitleSegmentedControl)
        singerTitleSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(calculatingHeight(height: 22))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 18))
            make.height.equalTo(calculatingHeight(height: 40))
        }
        
        self.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(singerTitleSegmentedControl.snp.bottom).offset(calculatingHeight(height: 10))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 18))
        }
        
        self.addSubview(songInfoTableView)
        songInfoTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(calculatingHeight(height: 40))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 18))
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(calculatingHeight(height: 20))
        }
    }
}
