//
//  ViewController.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

/// The main view controller of the application.
final class ViewController: UIViewController {

    // MARK: - Properties
    
    let model = Models()
    lazy var circleViewController = CircleViewController()
    lazy var chartViewController = ChartViewController()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: model.itemsCircleSegmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupUI()
        createConstraints()
    }
    
    // MARK: - Setup Methods
    
    private func setupNavigation() {
        // Set the navigation controller as the root view controller
        let navigationController = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navigationController
              
        // Customize the title label
        let titleLabel = UILabel()
        let attributedText = NSMutableAttributedString(string: "Аналитика\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        let secondText = NSAttributedString(string: "Счет GL 546178", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        attributedText.append(secondText)
        titleLabel.attributedText = attributedText
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    private func setupUI() {
        // Set the background color of the view
        view.backgroundColor = .white
        
        // Add the segmented control to the view
        view.addSubview(segmentedControl)
        
        // Add the circle view controller as a child view controller
        addChild(circleViewController)
        view.addSubview(circleViewController.view)
        circleViewController.didMove(toParent: self)
        circleViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createConstraints() {
        // Set up constraints for the segmented control and circle view controller
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            circleViewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            circleViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
            
    // MARK: - Actions
    
    @objc func segmentedControlValueChanged(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            // Switch to the circle view controller
            
            // Remove the chart view controller if it is currently displayed
            if chartViewController.parent != nil {
                chartViewController.willMove(toParent: nil)
                chartViewController.view.removeFromSuperview()
                chartViewController.removeFromParent()
            }
            
            // Add the circle view controller if it is not yet displayed
            if circleViewController.parent == nil {
                addChild(circleViewController)
                view.addSubview(circleViewController.view)
                circleViewController.didMove(toParent: self)
                circleViewController.view.translatesAutoresizingMaskIntoConstraints = false
                
                // Set up constraints for the circle view controller
                NSLayoutConstraint.activate([
                    circleViewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
                    circleViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    circleViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    circleViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            }
        } else {
            // Switch to the chart view controller
            
            // Remove the circle view controller if it is currently displayed
            if circleViewController.parent != nil {
                circleViewController.willMove(toParent: nil)
                circleViewController.view.removeFromSuperview()
                circleViewController.removeFromParent()
            }
            
            // Add the chart view controller if it is not yet displayed
            if chartViewController.parent == nil {
                addChild(chartViewController)
                view.addSubview(chartViewController.view)
                chartViewController.didMove(toParent: self)
                chartViewController.view.translatesAutoresizingMaskIntoConstraints = false
                
                // Set up constraints for the chart view controller
                NSLayoutConstraint.activate([
                    chartViewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
                    chartViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    chartViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    chartViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            }
        }
    }
}
