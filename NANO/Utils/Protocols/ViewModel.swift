//
//  ViewModel.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/17.
//

import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}
