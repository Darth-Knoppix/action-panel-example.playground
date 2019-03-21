//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        addProfileButton(to: view)
        
        self.view = view
    }
    
    func addProfileButton(to parentView: UIView) -> UIButton {
        let button = UIButton()
        let accentColour = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        
        // Visual setup
        button.setTitle("Show Profile", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(accentColour, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = accentColour.cgColor
        button.layer.cornerRadius = 8
        
        parentView.addSubview(button)
        
        // Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 36).isActive = true
        button.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -36).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -36).isActive = true
        
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        return button
    }
    
    func addTitle(to parentView: UIView, withLeftPadding leftPad: CGFloat) {
        // Title
        let innerLabel = UILabel()
        
        // Visual setup
        innerLabel.text = "Seth Corker"
        innerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        parentView.addSubview(innerLabel)
        
        // Constraints
        innerLabel.translatesAutoresizingMaskIntoConstraints = false
        innerLabel.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: -8).isActive = true
        innerLabel.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: leftPad + 16 + 8).isActive = true
        innerLabel.widthAnchor.constraint(equalToConstant: 80)
        innerLabel.heightAnchor.constraint(equalToConstant: 20)
        
        // Subtitle
        let subtitleLabel = UILabel()
        
        subtitleLabel.text = "Developer"
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        
        parentView.addSubview(subtitleLabel)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: innerLabel.bottomAnchor, constant: 0).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: innerLabel.leftAnchor, constant: 0).isActive = true
    }
    
    func addProfileImage(to parentView: UIView, withSize imageSize: CGFloat) -> UIImageView {
        let profile = UIImageView(image:  UIImage(named: "Profile.png"))
        
        parentView.addSubview(profile)
        
        return profile
    }
    
    func addProfileView(to parentView: UIView) -> UIView {
        let imageSize: CGFloat = 64
        let margin: CGFloat = 8.0
        let innerActionView = UIView(frame: CGRect.init(x: margin, y: margin, width: parentView.bounds.width - margin, height: view.bounds.height - margin))
        
        innerActionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
        innerActionView.layer.cornerRadius = margin
        
        let profile = addProfileImage(to: innerActionView, withSize: imageSize)
        
        // Profile Constraints
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.centerYAnchor.constraint(equalTo: innerActionView.centerYAnchor, constant: 0).isActive = true
        profile.leftAnchor.constraint(equalTo: innerActionView.leftAnchor, constant: 8).isActive = true
        profile.bottomAnchor.constraint(equalTo: innerActionView.bottomAnchor, constant: 10)

        parentView.addSubview(innerActionView)
        

        addTitle(to: innerActionView, withLeftPadding: imageSize)
        
        innerActionView.translatesAutoresizingMaskIntoConstraints = false
        innerActionView.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -margin).isActive = true
        innerActionView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 45).isActive = true
        innerActionView.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: margin).isActive = true
        innerActionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return innerActionView
    }
    
    func createAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Profile", message: nil, preferredStyle: .actionSheet)
        
        alert.view.translatesAutoresizingMaskIntoConstraints = false
        alert.view.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        
        let profileView = addProfileView(to: alert.view)
        
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Share", comment: "Share user profile"), style: .default, handler: { _ in
            print("Share Profile")
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Go to website", comment: "Open user's website"), style: .default, handler: { _ in
            print("Open website")
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Close profile sheet"), style: .cancel, handler: { _ in
            print("Cancel")
        }))
        
        alert.view.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: CGFloat(alert.actions.count * 61)).isActive = true
        
        return alert
    }
    
    @objc func showAlert() {
        let alert = createAlert();
        
        self.present(alert, animated: true, completion: nil)
    }
}
// Present the view controller in the Live View window
let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 375, height: 812) //iPhone X
PlaygroundPage.current.liveView = vc
