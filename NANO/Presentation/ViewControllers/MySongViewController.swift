//
//  MySongViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/17.
//

import UIKit

class MySongViewController: UIViewController {
    
    //MARK: - Declaration
    private var playlistTitle: String
    
    private lazy var songListView: SongListView = {
        let view = SongListView()
        view.songInfoTableView.dataSource = self
        view.songInfoTableView.delegate = self
        
        return view
    }()
    
    //MARK: - Initialize
    init(playlistTitle: String) {
        self.playlistTitle = playlistTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = songListView
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationControll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Navigation
    private func navigationControll() {
        navigationController?.navigationBar.topItem?.title = self.playlistTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(modifyMode))
    }
}

extension MySongViewController {
    
    //MARK: - selector
    @objc private func modifyMode() {
        if navigationItem.rightBarButtonItem?.title == "수정" {
            self.songListView.songInfoTableView.isEditing = true
            navigationItem.rightBarButtonItem?.title = "수정완료"
        } else {
            self.songListView.songInfoTableView.isEditing = false
            navigationItem.rightBarButtonItem?.title = "수정"
        }
    }
}

//MARK: - Delegate, DataSource
extension MySongViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songInfoCell = tableView.dequeueReusableCell(SongInfoCell.self, for: indexPath)
        songInfoCell.bind(model: .init(no: "no", title: "title", singer: "singer"))
        
        return songInfoCell
    }
}
