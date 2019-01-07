//
//  DateFormatter+Extensions.swift
//  TestingMVVM
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var standarizedDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter
    }
    
    static var verboseDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter
    }
    
}
