//
//  ViewController.swift
//  RandomPhotoApp
//
//  Created by Andrea Domenico Giuliano on 08/08/21.
//

import UIKit

class ViewController: UIViewController {

    private let randomPhotoImageView: UIImageView = {
        let randomPhotoImageView = UIImageView()
        
        randomPhotoImageView.contentMode = .scaleAspectFill
        randomPhotoImageView.backgroundColor = .white
        
        return randomPhotoImageView
    }()
    
    private let randomPhotoImageButton: UIButton = {
        let randomPhotoImageButton = UIButton()
        
        //  Button title
        let rPBTitle = NSLocalizedString("New Photo", comment: "")
        randomPhotoImageButton.setTitle(rPBTitle, for: .normal)
        randomPhotoImageButton.setTitleColor(.black, for: .normal)
        
        
        // Button background
        randomPhotoImageButton.backgroundColor = .white
        
        return randomPhotoImageButton
    }()
    
    let backGroundColors : [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appTitle = NSLocalizedString("Random Photo", comment: "")
        title = appTitle
        
        view.backgroundColor = .systemGray
        
        //  Random Photo View
        view.addSubview(randomPhotoImageView)
        let photoXValue : Int = 0
        let photoYValue : Int = 0
        let photoWidthValue : Int = 320
        let photoHeightValue : Int = 320
        randomPhotoImageView.frame = CGRect(x: photoXValue,
                                            y: photoYValue,
                                            width: photoWidthValue,
                                            height: photoHeightValue)
        randomPhotoImageView.center = view.center
        
        // Random Photo Button
        view.addSubview(randomPhotoImageButton)
        randomPhotoImageButton.addTarget(self,
                                         action: #selector(didTapRPButton),
                                         for: .touchUpInside)
        
        // Random Photo Function
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let buttonXValue : Int = 30
        let buttonYValue : Int = Int(view.frame.size.height - 150 - view.safeAreaInsets.bottom)
        let buttonWidthValue : Int = Int(view.frame.size.width - 60)
        let buttonHeightValue : Int = 55
        randomPhotoImageButton.frame = CGRect(x: buttonXValue,
                                              y: buttonYValue,
                                              width: buttonWidthValue,
                                              height: buttonHeightValue)
    }
    
    // Function for the button
    // @objc is necessary to attach at the button
    @objc func didTapRPButton()
    {
        getRandomPhoto()
        
        changeRandomBackgroundColor()
        
        return
    }
    
    func changeRandomBackgroundColor()
    {
        let actualBackgroundColor = view.backgroundColor
        var newBackgroundColor = backGroundColors.randomElement()
        
        while (actualBackgroundColor == newBackgroundColor) {
            newBackgroundColor = backGroundColors.randomElement()
        }
        
        view.backgroundColor = newBackgroundColor
        
        return
    }
    
    // Get Random photo core function
    func getRandomPhoto()
    {
        let urlString = "https://source.unsplash.com/random/600x600"
        
        //  ! indicate that we assume that the url is valid (exist)
        let url = URL(string: urlString)!
        
        //  If the data is null, break the function
        guard let imageData =
                try? Data(contentsOf: url)
        else
        {
            return
        }
        
        randomPhotoImageView.image =  UIImage(data: imageData)
    }
}

