
import UIKit

public protocol FavOnboardingKitDelegate: AnyObject {
  func nextButtonDidTap(atIndex index: Int)
  func getStartedButtonDidTap()
}

public class FavOnboardingKit {
  
  private let slides: [Slide]
  private let tintColor: UIColor
  private var rootVC: UIViewController?
  
  public weak var delegate: FavOnboardingKitDelegate?
  
  private lazy var onboardingViewController: OnboardingViewController = {
    let controller = OnboardingViewController(slides: slides, tintColor: tintColor)
    controller.modalTransitionStyle = .crossDissolve
    controller.modalPresentationStyle = .fullScreen
    controller.nextButtonDidTap = { [weak self] index in
      self?.delegate?.nextButtonDidTap(atIndex: index)
    }
    controller.getStartedButtonDidTap = { [weak self] in
      self?.delegate?.getStartedButtonDidTap()
    }
    return controller
  }()
  
  public init(slides: [Slide], tintColor: UIColor) {
    self.slides = slides
    self.tintColor = tintColor
  }
  
  public func launchOnboarding(rootVC: UIViewController) {
    self.rootVC = rootVC
    rootVC.present(onboardingViewController, animated: true, completion: nil)
  }
  
  public func dismissOnboarding() {
    onboardingViewController.stopAnimation()
    if rootVC?.presentedViewController == onboardingViewController {
      onboardingViewController.dismiss(animated: true)
    }
  }
  
}
