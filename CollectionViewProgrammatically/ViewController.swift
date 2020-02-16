//  Created by Roman Cebula on 15/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import UIKit

class ViewController: UIViewController {
  
  fileprivate let cellID = "cell"
  
  private let collection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    collection.backgroundColor = .systemGray
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.isScrollEnabled = true
    return collection
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupCollectionConstraints()
  }

  fileprivate func setupView(){
    collection.delegate = self
    collection.dataSource = self
    collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    view.backgroundColor = .white
    view.addSubview(collection)
  }
  
  fileprivate func setupCollectionConstraints(){
    collection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    collection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    collection.heightAnchor.constraint(equalToConstant: 400).isActive = true
    collection.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collection.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
    cell.backgroundColor = .white
    cell.layer.cornerRadius = 5
    cell.layer.shadowOpacity = 3
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: 250 )
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
  }
}
