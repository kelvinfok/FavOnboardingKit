//
//  File.swift
//  
//
//  Created by Kelvin Fok on 20/3/22.
//

import UIKit

class OnboardingViewController: UIViewController {
  
  private let slides: [Slide]
  private let tintColor: UIColor
  
  init(slides: [Slide], tintColor: UIColor) {
    self.slides = slides
    self.tintColor = tintColor
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }
}
