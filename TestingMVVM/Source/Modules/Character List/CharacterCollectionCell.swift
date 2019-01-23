//
//  CharacterCollectionCell.swift
//  TestingMVVM
//
//  Created by Guilherme Paciulli on 22/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CharacterCollectionCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    func configureWith(character: CharacterViewModel) {
        self.configure(withTitle: character.name, andImage: character.image)
    }
    
    private func configure(withTitle title: String, andImage image: URL) {
        self.setImage(image: image)
        self.setTitleLabel(title: title)

        self.addConstraints([NSLayoutConstraint(item: self.titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 15),
                             NSLayoutConstraint(item: self.titleLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 15),
                             NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.imageView, attribute: .bottom, multiplier: 1, constant: 10),
                             NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 15),
                             NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.8, constant: 1),
                             NSLayoutConstraint(item: self.imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)])
    }
    
    private func setTitleLabel(title: String) {
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18.0)
        titleLabel.minimumScaleFactor = 0.8
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    private func setImage(image: URL) {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.kf.setImage(with: image) // refactor (?)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
    }
    
}
