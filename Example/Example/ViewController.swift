//
//  ViewController.swift
//  Example
//
//  Created by Carlos Mejía on 12/02/20.
//  Copyright © 2020 Mejia Garcia. All rights reserved.
//

import UIKit
import EasyBinding

struct ViewModel {
    let isLoading = Var(true)
    let title = Var("The New App")
    let exampleImage = Var(UIImage(named: "example1"))
    
    /**
     Example method to change the view model values and see the real time changes in the screen.
     */
    mutating func updateViewModel() {
        isLoading.value.toggle()
        title.value = "The \(isLoading.value ? "New" : "Old") App"
        
        exampleImage.value = UIImage(named: "example\(isLoading.value ? "1" : "2")")
    }
}

class ViewController: UIViewController {
    // MARK: - UI References
    @IBOutlet weak var exampleImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - UI Actions
   
    @IBAction func toggleIndicatorAction() {
       viewModel.updateViewModel()
    }
    
    // MARK: - Properties
    private lazy var viewModel: ViewModel = {
       return ViewModel()
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.isLoading.bindTo(activityIndicator, to: .state)
        
        viewModel.title.bindTo(navigationController?.navigationBar.topItem, to: .title)
        viewModel.title.bindTo(label, to: .text)
        
        viewModel.isLoading.bindTo(label, to: .visibility)
        
        viewModel.exampleImage.bindTo(exampleImageView, to: .image)
    }
}

