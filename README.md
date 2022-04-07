# FavOnboardingKit

FavOnboardingKit provides an onboarding flow that is simple and easy to implement.

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)

## Requirements

- iOS 15.0 or later
- Xcode 13.0 or later
- Swift 5.0 or later


## Installation
There are two ways to use FavOnboardingKit in your project:
- using Swift Package Manager
- manual install (build frameworks or embed Xcode Project)

### Swift Package Manager

To integrate FavOnboardingKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/kelvinfok/FavOnboardingKit.git", .upToNextMajor(from: "1.0.0"))
]
```

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

### Manually

If you prefer not to use Swift Package Manager, you can integrate FavOnboardingKit into your project manually.

---

## Usage

### Quick Start

```swift
import UIKit
import FavOnboardingKit

class ViewController: UIViewController, FavOnboardingKitDelegate {
  
  private var onboardingKit: FavOnboardingKit?

  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.async {
      self.onboardingKit = FavOnboardingKit(
        slides: [
          .init(image: UIImage(named: "imSlide1")!,
                title: "Personalised offers at 40,000+ places"),
          .init(image: UIImage(named: "imSlide2")!,
                title: "Stack your rewards every time you pay"),
          .init(image: UIImage(named: "imSlide3")!,
                title: "Enjoy now, FavePay Later"),
          .init(image: UIImage(named: "imSlide4")!,
                title: "Earn cashback with your physical card"),
          .init(image: UIImage(named: "imSlide5")!,
                title: "Save and earn cashback with Deals or eCards")
        ],
        tintColor: UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1.0))
      self.onboardingKit?.delegate = self
      self.onboardingKit?.launchOnboarding(rootVC: self)
    }
  }
  
  // MARK: - FavOnboardingKitDelegate {
  func nextButtonDidTap(atIndex index: Int) {
    print("next button is tapped at index: \(index)")
  }
  
  func getStartedButtonDidTap() {
    onboardingKit?.dismissOnboarding()
    onboardingKit = nil
    transit(viewController: AnotherViewController())
  }
  
  private func transit(viewController: UIViewController) {
    let foregroundScenes = UIApplication.shared.connectedScenes.filter({
      $0.activationState == .foregroundActive
    })
    
    let window = foregroundScenes
      .map({ $0 as? UIWindowScene })
      .compactMap({ $0 })
      .first?
      .windows
      .filter({ $0.isKeyWindow })
      .first
    
    guard let uWindow = window else { return }
    uWindow.rootViewController = viewController
    
    UIView.transition(
      with: uWindow,
      duration: 0.3,
      options: [.transitionCrossDissolve],
      animations: nil,
      completion: nil)
  }
}
```

## Credits

- Kelvin Fok
