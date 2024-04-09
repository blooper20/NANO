//
//  ReleaseViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/17.
//

import UIKit
import RxSwift
import RxCocoa

final class ReleaseViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var viewModel = ReleaseViewModel()
    private let disposbag = DisposeBag()
    
    private var today: String
    
    private lazy var songListView: SongListView = {
        let view = SongListView()
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        self.today = "@@@@/!!/##"
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
        
        self.navigationItem.title = setTodayDateFormatter()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

extension ReleaseViewController {
    
    //MARK: - ViewModel
    private func bindViewModel() {
        let input = ReleaseViewModel.Input.init(viewDidLoad: .just(()))
        
        let output = viewModel.transform(input: input)
        
        output.releaseSongs
            .drive(songListView.songInfoTableView.rx.items(cellIdentifier: SongInfoCell.reuseIdentifier, cellType: SongInfoCell.self)) { (_, songListItem, cell) in
                
                cell.bind(model: .init(no: songListItem.no, title: songListItem.title, singer: songListItem.singer))
            }
            .disposed(by: disposbag)
        
        self.songListView.songInfoTableView.rx.itemSelected
            .withLatestFrom(output.releaseSongs) { index, items -> SongInfo in
            return items[index.row]
        }
        .subscribe(onNext: { [weak self] item in
            
            guard let snapshotView = self?.view.snapshotView(afterScreenUpdates: true) else {
                return
            }
            
            let songInfoView = SongDetailInfoView(hasReserveButton: false)
            songInfoView.bind(songInfo: item)
            
            let popUpVC = PopUpViewController(snapshotView: snapshotView, contentView: songInfoView)
            
            songInfoView.delegate = popUpVC
            
            popUpVC.modalTransitionStyle = .crossDissolve
            popUpVC.modalPresentationStyle = .fullScreen
            
            self?.present(popUpVC, animated: true)
        })
        .disposed(by: disposbag)
    }
    
    //MARK: - Function
    private func setTodayDateFormatter() -> String {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let convertNowStr = dateFormatter.string(from: nowDate)
        
        return convertNowStr
    }
}
