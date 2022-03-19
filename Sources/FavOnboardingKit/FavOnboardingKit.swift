
import UIKit

public class FavOnboardingKit {
  
  private var onboardingViewController: OnboardingViewController = {
    let controller = OnboardingViewController()
    controller.modalTransitionStyle = .crossDissolve
    controller.modalPresentationStyle = .fullScreen
    return controller
  }()
  
  public init() {
    
  }
  
  public func launchOnboarding(rootVC: UIViewController) {
    rootVC.present(onboardingViewController, animated: true, completion: nil)
  }
  
  public func dismissOnboarding() {
    
  }
  
}
