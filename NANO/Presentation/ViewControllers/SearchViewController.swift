//
//  SearchViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/29.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var viewModel = SearchViewModel()
    private let disposbag = DisposeBag()
    
    private lazy var searchView: SearchView = {
        let view = SearchView()
        
        return view
    }()
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = searchView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSegmentedControl()
        bindViewModel()
        self.navigationItem.title = "검색"
        self.tabBarController?.navigationItem.title = "검색"
    }
    
    //MARK: - Override
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
extension SearchViewController {
    
    //MARK: - ViewModel
    private func bindViewModel() {
        
        let input = SearchViewModel.Input.init(
            searchedText: self.searchView.searchBar.rx.text.orEmpty.asObservable(),
            tapSearching: self.searchView.searchBar.rx.searchButtonClicked.asObservable()
        )
        
        let output = viewModel.transform(input: input)
        
        self.searchView.songInfoTableView.rx.itemSelected
            .withLatestFrom(output.searchingResult) { index, items in
                return items[index.row]
            }
            .subscribe(onNext: { [weak self] item in
                
                guard let snapshotView = self?.view.snapshotView(afterScreenUpdates: true) else {
                    return
                }
                
                let songInfoView = SongDetailInfoView(hasReserveButton: true)
                songInfoView.bind(songInfo: item)
                
                let popUpVC = PopUpViewController(snapshotView: snapshotView, contentView: songInfoView)
                
                songInfoView.delegate = popUpVC
                
                popUpVC.modalTransitionStyle = .crossDissolve
                popUpVC.modalPresentationStyle = .fullScreen
                
                self?.present(popUpVC, animated: true)
            })
            .disposed(by: disposbag)
        
        output.searchingResult
            .drive(searchView.songInfoTableView.rx.items(cellIdentifier: SongInfoCell.reuseIdentifier, cellType: SongInfoCell.self)) { (_, songListItem, cell) in
                
                cell.bind(model: .init(no: songListItem.no, title: songListItem.title, singer: songListItem.singer))
            }
            .disposed(by: disposbag)
    }
    
    //MARK: - Function
    private func setSegmentedControl() {
        
        searchView.singerTitleSegmentedControl.selectedSegmentIndex = 0
        searchView.singerTitleSegmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
    }
    
    //MARK: - Selector
    @objc func indexChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.searchingItem = .title
        case 1:
            viewModel.searchingItem = .singer
        default:
            viewModel.searchingItem = .title
        }
    }
}
