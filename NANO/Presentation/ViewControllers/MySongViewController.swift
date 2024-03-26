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
        
        setNavigationController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Navigation
    private func setNavigationController() {
        navigationItem.title = self.playlistTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(setModifyMode))
    }
}

extension MySongViewController {
    
    //MARK: - selector
    @objc private func setModifyMode() {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let snapshotView = view.snapshotView(afterScreenUpdates: true) else {
            return
        }
        
        let songInfoView = SongDetailInfoView(hasReserveButton: false)
        let popUpVC = PopUpViewController(snapshotView: snapshotView, contentView: songInfoView)
        
        songInfoView.delegate = popUpVC
        
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.modalPresentationStyle = .fullScreen
        
        self.present(popUpVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songInfoCell = tableView.dequeueReusableCell(SongInfoCell.self, for: indexPath)
        songInfoCell.bind(model: .init(no: "no", title: "title", singer: "singer"))
        
        return songInfoCell
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
