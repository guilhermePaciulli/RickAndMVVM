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

struct CharacterListViewModel {
    
    var title: String = "Characters"
    var feed: Observable<[CharacterViewModel]>
    var onError: Observable<Error>
    var load = PublishSubject<Void>()
    
    init() {
        let charFeed = Observable<[CharacterViewModel]>.create{ observer in
            APIClient.shared.send(GetCharacters(), completion: { results in
                switch results {
                case .success(let charResults):
                    observer.onNext(charResults.results.map({ CharacterViewModel(character: $0) }))
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(ErrorViewModel(error: error))
                }
            })
            
            return Disposables.create()
        }
        
        let response = self.load.startWith(()).flatMapLatest({ _ in
            return charFeed.materialize()
        }).share().observeOn(MainScheduler.instance)

        
        
        
    }
    
}

struct CharacterViewModel {
    
    var name: String!
    var image: UIImage!
    
    init(character: Character) {
        self.name = character.name
//            self.image =
    }
}

enum RequestError {
    case fourOfour
    case fourOfive
    case fourOten
}
