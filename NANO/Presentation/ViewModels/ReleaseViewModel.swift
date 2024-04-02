//
//  ReleaseViewModel.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import Foundation
import RxSwift
import RxCocoa

final class ReleaseViewModel: ViewModel {
    
    //MARK: - Declaration
    var disposeBag = DisposeBag()
    let release = ReleaseUseCase.shared
    let appState = AppState.shared
    
    //MARK: - Transform
    func transform(input: Input) -> Output {
        let releaseSongs = input.viewDidLoad.flatMap { _ in
            return self.release.getRelease(brand: self.appState.brand)
        }
        .map { response in
            return response.data
        }.asDriver(onErrorJustReturn: .init())
        
        return Output(releaseSongs: releaseSongs)
    }
}

extension ReleaseViewModel {
    
    //MARK: - Input
    struct Input {
        let viewDidLoad: Observable<Void>
    }
    
    //MARK: - Output
    struct Output {
        let releaseSongs: Driver<[SongInfo]>
    }
}
