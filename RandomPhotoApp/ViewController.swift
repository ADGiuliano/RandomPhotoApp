//
//  ViewController.swift
//  RandomPhotoApp
//
//  Created by Andrea Domenico Giuliano on 08/08/21.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
         
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appTitle = "Random Photo"
        title = appTitle
        
        view.backgroundColor = .systemGray
        view.addSubview(imageView)
        
        let xValue = 0
        let yValue = 0
        let widthValue = 320
        let heightValue = 320
        
        imageView.frame = CGRect(x: xValue,
                                 y: yValue,
                                 width: widthValue,
                                 height: heightValue)
        
        imageView.center = view.center
        
        getRandomPhoto()
    }
    
    func getRandomPhoto()
    {
        let urlString = "https://source.unsplash.com/random/600x600"
        
        //  The ! indicate that we assume that the url is valid (exist)
        let url = URL(string: urlString)!
        
        // if the data is null, return null (return)
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image =  UIImage(data: imageData)
        
    }
}

