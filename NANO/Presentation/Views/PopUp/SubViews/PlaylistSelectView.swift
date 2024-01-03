//
//  PlaylistSelectView.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/06.
//

import UIKit
import SnapKit

final class PlaylistSelectView: UIView {
    
    //MARK: - Declaration
    private lazy var playlistTableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellType = PopUpPlaylistCell.self
        tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
        
        return tableView
    }()
    
    private lazy var plusButton: MainButton = {
        let button = MainButton(title: "새 예약목록")
        let emojiConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .medium)
        button.setImage(UIImage(systemName: "plus", withConfiguration: emojiConfig), for: .normal)
        button.tintColor = .black

        return button
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaylistSelectView {
    
    //MARK: - Function
    private func setUpViews() {
        
        self.addSubview(playlistTableView)
        playlistTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(calculatingHeight(height: 5))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 15))
            make.height.equalTo(calculatingHeight(height: 400))
        }
        
        self.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(playlistTableView.snp.bottom).offset(calculatingHeight(height: 10))
            make.bottom.equalToSuperview().inset(calculatingHeight(height: 20))
            make.right.equalToSuperview().inset(calculatingWidth(width: 10))
        }
    }
}

//MARK: - Delegate, DataSource
extension PlaylistSelectView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(PopUpPlaylistCell.self, for: indexPath)
        cell.bind(model: .init(brand: "brand", title: "title"))
        
        return cell
    }
}
