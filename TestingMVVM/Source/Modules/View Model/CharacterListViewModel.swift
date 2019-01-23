//
//  CharacterListViewModel.swift
//  TestingMVVM
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxSwiftExt

struct CharacterListViewModel {
    
    var title: String = "Characters"
    var feed: Observable<[CharacterViewModel]>
    var onError: Observable<Error>
    private var load = PublishSubject<Void>()
    
    init() {
        let charFeed = Observable<[CharacterViewModel]>.create { observer in
            
//            APIClient.shared.send(GetCharacters(), completion: { results in
//                switch results {
//                case .success(let charResults):
//                    observer.onNext(charResults.results.map({ CharacterViewModel(character: $0) }))
//                    observer.onCompleted()
//                case .failure(let error):
//                    observer.onError(ErrorViewModel(error: error))
//                }
//            })
            
            observer.onNext([CharacterViewModel(name: "Rick", image: URL(string: "https://pbs.twimg.com/profile_images/897250392022540288/W1T-QjML_400x400.jpg")!)])
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        let response = self.load.startWith(()).flatMapLatest({ _ in
            return charFeed.materialize()
        }).share().observeOn(MainScheduler.instance)

        
        self.feed = response.elements()
        self.onError = response.errors()
        
    }
    
}

struct CharacterViewModel {
    
    var name: String
    var image: URL
    
    init(character: Character) {
        self.name = character.name
        self.image = character.image
    }
    
    init(name: String, image: URL) {
        self.name = name
        self.image = image
    }
    
}
