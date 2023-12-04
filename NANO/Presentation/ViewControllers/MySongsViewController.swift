//
//  MySongsViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/01.
//

import UIKit

class MySongsViewController: UIViewController {

    //MARK: - Declaration
    private lazy var mySongsView: MySongsView = {
        let view = MySongsView()
        view.playlistTableView.dataSource = self
        view.playlistTableView.delegate = self
        
        return view
    }()
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = mySongsView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Delegate, DataSource
extension MySongsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playlistCell = tableView.dequeueReusableCell(PlaylistCell.self, for: indexPath)
        playlistCell.bind(model: .init(brand: "brand", title: "title"))
        
        return playlistCell
    }
}
