//
//  File.swift
//  
//
//  Created by Kelvin Fok on 20/3/22.
//

import UIKit
import SnapKit

class ButtonContainerView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    backgroundColor = .systemPink
  }
  
  
}
