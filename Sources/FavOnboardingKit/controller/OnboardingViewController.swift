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
  
  private lazy var transitionView: TransitionView = {
    let view = TransitionView()
    return view
  }()
  
  private lazy var buttonContainerView: ButtonContainerView = {
    let view = ButtonContainerView()
    return view
  }()
  
  private lazy var stackView: UIStackView = {
    let view = UIStackView(arrangedSubviews: [transitionView, buttonContainerView])
    view.axis = .vertical
    return view
  }()
  
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
    setupViews()
  }
  
  private func setupViews() {
    view.backgroundColor = .red

    view.addSubview(stackView)
    
    stackView.snp.makeConstraints { make in
      make.edges.equalTo(self.view)
    }
    
    buttonContainerView.snp.makeConstraints { make in
      make.height.equalTo(120)
    }
  }
}
