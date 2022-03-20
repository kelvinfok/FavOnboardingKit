//
//  File.swift
//  
//
//  Created by Kelvin Fok on 20/3/22.
//

import UIKit

class AnimatedBarView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
