//
//  LoginViewController.swift
//  Hack2018
//
//  Created by CharlesOlivier Demers on 18-01-20.
//  Copyright © 2018 Charles-Olivier Demers. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import VideoSplashKit

class LoginViewController: VideoSplashViewController, FBSDKLoginButtonDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kWidth = self.view.frame.width
        kHeight = self.view.frame.height
        IPHONE_X = kHeight == 812
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["public_profile", "email", "user_friends", "user_about_me"]
        loginButton.delegate = self
    
//        self.view.addSubview(loginButton)
        
        fetchUserInfo()
        
        setupView()
        
    }
    
    func setupView() {
        UIApplication.shared.statusBarStyle = .lightContent
        
        if let path = Bundle.main.path(forResource: "login_video", ofType: "mp4") {
            let url = URL(fileURLWithPath: path)
            videoFrame = view.frame
            fillMode = .resizeAspectFill
            alwaysRepeat = true
            sound = false
            startTime = 0
            alpha = 0.6
            backgroundColor = UIColor.black
            contentURL = url
        }
        
        let y: CGFloat = 150.0
        let title = UILabel()
        title.frame = CGRect(x: 0, y: y, width: kWidth, height: 100)
        title.text = "NAO".lz()
        title.textColor = .white
        title.textAlignment = .center
        title.font = UIFont(name: "Arial", size: 50)
        title.sizeToFit()
        title.frame = CGRect(x: self.view.frame.width / 2 - title.frame.width / 2, y: title.frame.origin.y, width: title.frame.width, height: title.frame.height)
        self.view.addSubview(title)
        
        let tempSpacing: CGFloat = 20
        let line = UIView()
        line.frame = CGRect(x: title.frame.origin.x - tempSpacing / 2, y: title.frame.maxY + 5, width: title.frame.width + tempSpacing, height: 1)
        line.backgroundColor = .white
        self.view.addSubview(line)
        
        let buttonHeight: CGFloat = 100
        let spacing: CGFloat = 5
        
        let buttonView = UIView()
        
        if(IPHONE_X) {
            buttonView.frame = CGRect(x: 0, y: kHeight - buttonHeight, width: kWidth, height: buttonHeight)
        } else {
            buttonView.frame = CGRect(x: 0, y: kHeight - buttonHeight - spacing, width: kWidth - spacing * 2, height: buttonHeight)
        }
        
        buttonView.backgroundColor = UIColor(red: 42 / 255, green: 93 / 255, blue: 149 / 255, alpha: 1)
        self.view.addSubview(buttonView)
        
        let loginLabel = UILabel()
        loginLabel.frame = CGRect(x: 0, y: 0, width: kWidth, height: buttonHeight)
        loginLabel.text = "LOGIN_FB".lz()
        loginLabel.textColor = .white
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont(name: "Arial", size: 20)
        buttonView.addSubview(loginLabel)
        
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        fetchUserInfo()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logout")
    }
    
    func fetchUserInfo() {
        if(FBSDKAccessToken.current() != nil) {
            print("USer is logged")
            
            let fbRequest = FBSDKGraphRequest.init(graphPath: "me?fields=id,name,email,friends", parameters: nil)
            fbRequest!.start(completionHandler: { (_: FBSDKGraphRequestConnection?, result: Any?, error: Error?) in
                
                if error != nil {
                    print("Error")
                    print(error!)
                    
                    displayAlert(viewController: self, title: "Erreur", message: "Fetching user info - 01")
                } else if (result != nil) {
                    //  NOM
                    //  PHOTO
                    //  FRIENDS
                    //  ID
                    //  EMAIL
                    
                    print(result!)
                }
                
            })
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
