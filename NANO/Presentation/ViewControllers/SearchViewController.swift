//
//  SearchViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/29.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var searchView = SearchView()
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = searchView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableData()
        searchView.songInfoTableView.rowHeight = UITableView.automaticDimension
    }
}

extension SearchViewController {

    //MARK: - Function
    private func setTableData() {
        searchView.songInfoTableView.dataSource = self
        searchView.songInfoTableView.delegate = self
    }
}

//MARK: - Delegate, DataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let songInfoCell = tableView.dequeueReusableCell(withIdentifier: SongInfoCell.reuseIdentifier, for: indexPath) as? SongInfoCell else {
            return UITableViewCell()
        }
        songInfoCell.bind(songInfo: SongInfo(no: "02345234535234544", title: "title: hafasdfasdfaskjhdfasjkdhgfkhjasdfgkjhsai", singer: "singer: meeasdfasdfasdfnoi", composer: "composer", lyricist: "lyricist", release: "2023.02.12"))
        
        return songInfoCell
    }
}
