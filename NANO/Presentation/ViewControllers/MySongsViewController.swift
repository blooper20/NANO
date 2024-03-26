//
//  MySongsViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/12/01.
//

import UIKit

final class MySongsViewController: UIViewController {

    //MARK: - Declaration
    private lazy var mySongsView: MySongsView = {
        let view = MySongsView()
        view.playlistTableView.dataSource = self
        view.playlistTableView.delegate = self
        
        return view
    }()
    
    private lazy var editmodeButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "수정"
        button.target = self
        button.action = #selector(editmodeButtonTapped)
        
        return button
    }()
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = mySongsView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItem()
    }
}

//MARK: - Function
extension MySongsViewController {
    
    private func setNavigationItem() {
        self.navigationItem.title = "보관함"
        self.navigationItem.rightBarButtonItem = editmodeButton
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
//        resumeCategory[indexPath.section].items.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
//        indexPath를 이용해서 row 옮기기
//        resumeCategory[sourceIndexPath.section].items.remove(at: sourceIndexPath.row)
//        resumeCategory[destinationIndexPath.section].items.insert(targetItem, at: destinationIndexPath.row)
    }
}

//MARK: - Selector
extension MySongsViewController {
    
    @objc func editmodeButtonTapped() {
        mySongsView.playlistTableView.isEditing.toggle()
        editmodeButton.title = mySongsView.playlistTableView.isEditing ? "완료" : "수정"
    }
}
