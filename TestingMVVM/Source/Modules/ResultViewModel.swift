//
//  APIErrorViewModel.swift
//  TestingMVVM
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation

enum ResultViewModel<Value> {
    case success(Value)
    case failure(ErrorViewModel)
}

struct ErrorViewModel {
    let title: String?
    let description: String?
}
