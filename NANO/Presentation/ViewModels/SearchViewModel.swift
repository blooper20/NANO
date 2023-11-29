//
//  SearchViewModel.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import Foundation
import RxSwift

class SearchViewModel: ViewModel {
    
    //MARK: - Declaration
    var disposeBag = DisposeBag()
    let search = SearchUseCase.shared
    let appState = AppState.shared
    
    //MARK: - Transform
    func transform(input: Input) -> Output {
        let searchingResult = input.tapSearching
            .withLatestFrom(input.searchedText)
            .flatMap { text in
                return self.search.getSearchTitle(brand: self.appState.brand, title: text)
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
