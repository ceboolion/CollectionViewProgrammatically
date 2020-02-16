//  Created by Roman Cebula on 15/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  private let image: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "person")
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    image.layer.cornerRadius = image.layer.frame.height / 2
    image.backgroundColor = .systemGray
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  private let label: UILabel = {
    let label = UILabel()
    label.text = "User"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
   
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView(){
    addSubview(image)
    addSubview(label)
    image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    image.heightAnchor.constraint(equalToConstant: 100).isActive = true
    image.widthAnchor.constraint(equalToConstant: 100).isActive = true
    label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
    label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
  }
}
