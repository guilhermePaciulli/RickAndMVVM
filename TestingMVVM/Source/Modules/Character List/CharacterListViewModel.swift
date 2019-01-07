//
//  CharacterListViewModel.swift
//  TestingMVVM
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import UIKit

struct CharacterListViewModel {
    
    var title: String = "Characters"
    var characters: [CharacterViewModel]
    
    init(characters: [CharacterViewModel]) {
        self.characters = characters
    }
    
    func fetchCharacters(completion: @escaping (ResultViewModel<[Character]>) -> ()) {
        APIClient.shared.send(GetCharacters(), completion: { results in
            switch results {
            case .success(let charResults):
                completion(ResultViewModel.success(charResults.results))
                break
            case .failure(let error):
                completion(ResultViewModel.failure(ErrorViewModel(title: error.message, description: "Sorry for the problem")))
                break
            }
        })
    }
    
}

struct CharacterViewModel {
    
    var name: String!
    var image: UIImage!
    
    init(character: Character) {
        self.name = character.name
        //        self.image =
    }
}
