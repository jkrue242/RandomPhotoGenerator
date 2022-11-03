//
//  ViewController.swift
//  RandomPhotoGenerator
//
//  Created by Joseph Krueger on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    // image
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // button
    private let changeImageButton: UIButton = {
        let changeImageButton = UIButton()
        changeImageButton.backgroundColor = .white
        changeImageButton.setTitle("New Image", for: .normal)
        changeImageButton.setTitleColor(.black, for: .normal)
        return changeImageButton
    }()
    
    // color options for background
    private let colors: [UIColor]=[
        .systemRed,
        .systemCyan,
        .systemBlue,
        .systemPink,
        .systemTeal,
        .systemPurple,
        .systemYellow
    ]
    
    // if app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        // add image to ui
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y:0, width:300, height:300)
        imageView.center = view.center
        
        // add button to ui
        view.addSubview(changeImageButton)
        
        // attach photo generation behavior to button
        changeImageButton.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        GetRandomPhoto()
    }
    
    // sets position of button
    override func viewDidLayoutSubviews() {
        changeImageButton.frame = CGRect(x:30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height:55)
    }
    
    // function to attach to button for behavior
    @objc func ButtonPressed(){
        // generate random photo
        GetRandomPhoto()
        // change background color
        view.backgroundColor = colors.randomElement()
    }
    
    // get random photo function
    func GetRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

