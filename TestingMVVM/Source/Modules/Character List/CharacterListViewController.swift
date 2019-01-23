//
//  CharacterListViewController.swift
//  TestingMVVM
//
//  Created by Guilherme Paciulli on 21/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterListViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var viewModel: CharacterListViewModel!
    var reuseIdentifier = "characterListCollectionViewCell"
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeView()
        self.setUpData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func initializeView() {
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.delegate = self
        self.view.addSubview(self.collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: self.collectionView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: self.collectionView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint.init(item: self.collectionView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint.init(item: self.collectionView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        self.view.addConstraints([top, right, bottom, left])
        
    }
    
    private func setUpData() {
        self.collectionView.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: self.reuseIdentifier)
        
        self.viewModel = CharacterListViewModel()
        self.viewModel.feed.bind(to: self.collectionView.rx.items(cellIdentifier: self.reuseIdentifier, cellType: CharacterCollectionCell.self)) { _, char, cell in
            cell.configureWith(character: char)
        }.disposed(by: self.disposeBag)
    }
    
}

extension CharacterListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 2 - 50.0, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
