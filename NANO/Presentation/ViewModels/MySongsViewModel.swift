//
//  MySongsViewModel.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import Foundation
import RxSwift

class MySongsViewModel: ViewModel {
    
    //MARK: - Declaration
    var disposeBag = DisposeBag()
    let release = ReleaseUseCase.shared
    let appState = AppState.shared
    
    //MARK: - Transform
    func transform(input: Input) -> Output {
        let mySongs = input.viewDidLoad.flatMap { _ in
            return self.release.getRelease(brand: self.appState.brand)
        }
        .map { response in
            return response.data
        }
        
        return Output(mySongs: mySongs)
    }
}

extension MySongsViewModel {
    
    //MARK: - Input
    struct Input {
        let viewDidLoad: Observable<Void>
    }
    
    //MARK: - Output
    struct Output {
        let mySongs: Observable<[SongInfo]>
    }
}

