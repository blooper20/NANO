//
//  SearchViewModel.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import Foundation
import RxSwift

enum SearchParameter {
    case title
    case singer
}

final class SearchViewModel: ViewModel {
    
    //MARK: - Declaration
    var disposeBag = DisposeBag()
    let searchUseCase = SearchUseCase.shared
    var searchingItem: SearchParameter = .title
    
    //MARK: - Transform
    func transform(input: Input) -> Output {
        let searchingResult = input.tapSearching
            .withLatestFrom(input.searchedText)
            .flatMap { text in
                
                switch self.searchingItem {
                case .title:
                    return  self.searchUseCase.getSearchingTitle(brand: AppState.shared.brand, title: text)
                case .singer:
                    return  self.searchUseCase.getSearchingSinger(brand: AppState.shared.brand, singer: text)
                }
            }
            .map { response in
                return response.data
            }
        
        return Output(searchingResult: searchingResult)
    }
}

extension SearchViewModel {
    //MARK: - Input
    struct Input {
        let searchedText: Observable<String>
        let tapSearching: Observable<Void>
    }
    
    //MARK: - Output
    struct Output {
        let searchingResult: Observable<[SongInfo]>
    }
}
