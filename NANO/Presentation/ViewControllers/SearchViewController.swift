//
//  SearchViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/29.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.songInfoTableView.dataSource = self
        view.songInfoTableView.delegate = self
        
        return view
    }()
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = searchView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.songInfoTableView.rowHeight = UITableView.automaticDimension
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
        songInfoCell.bind(model: .init(no: "", title: "", singer: ""))
        
        return songInfoCell
    }
}
