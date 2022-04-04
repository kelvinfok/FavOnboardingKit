//
//  File.swift
//  
//
//  Created by Kelvin Fok on 20/3/22.
//

import UIKit

class OnboardingViewController: UIViewController {
  
  var nextButtonDidTap: ((Int) -> Void)?
  var getStartedButtonDidTap: (() -> Void)?
  
  private let slides: [Slide]
  private let tintColor: UIColor
  
  private lazy var transitionView: TransitionView = {
    let view = TransitionView(slides: slides, tintColor: tintColor)
    return view
  }()
  
  private lazy var buttonContainerView: ButtonContainerView = {
    let view = ButtonContainerView(tintColor: tintColor)
    view.nextButtonDidTap = { [weak self] in
      guard let this = self else { return }
      this.nextButtonDidTap?(this.transitionView.slideIndex)
      this.transitionView.handleTap(direction: .right)
    }
    view.getStartedButtonDidTap = getStartedButtonDidTap
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
    setupGesture()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    transitionView.start()
  }
  
  func stopAnimation() {
    transitionView.stop()
  }
  
  private func setupViews() {
    view.backgroundColor = .white

    view.addSubview(stackView)
    
    stackView.snp.makeConstraints { make in
      make.edges.equalTo(self.view)
    }
    
    buttonContainerView.snp.makeConstraints { make in
      make.height.equalTo(120)
    }
  }
  
  private func setupGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap(_:)))
    transitionView.addGestureRecognizer(tapGesture)
  }
  
  @objc private func viewDidTap(_ tap: UITapGestureRecognizer) {
    let point = tap.location(in: view)
    let midPoint = view.frame.size.width / 2
    if point.x > midPoint {
      transitionView.handleTap(direction: .right)
    } else {
      transitionView.handleTap(direction: .left)
    }
  }
}
