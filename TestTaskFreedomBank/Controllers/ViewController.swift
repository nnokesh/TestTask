//
//  ViewController.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

final class ViewController: UIViewController {

    let model = Models()
    let firstView = CircleViewController()
    let secondView = ChartViewController()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: model.itemsCircleSegmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationController = UINavigationController(rootViewController: self)

        UIApplication.shared.windows.first?.rootViewController = navigationController
              
        let titleLabel = UILabel()
        let attributedText = NSMutableAttributedString(string: "Аналитика\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        let secondText = NSAttributedString(string: "Счет GL 546178", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        attributedText.append(secondText)
        titleLabel.attributedText = attributedText
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // По умолчанию отображаем первое представление
        addChild(firstView)
        view.addSubview(firstView.view)
        firstView.didMove(toParent: self)
        firstView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstView.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            firstView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func segmentedControlValueChanged(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            // Удалить второе представление, если оно есть
            if secondView.parent != nil {
                secondView.willMove(toParent: nil)
                secondView.view.removeFromSuperview()
                secondView.removeFromParent()
            }
            
            // Добавить первое представление, если оно еще не добавлено
            if firstView.parent == nil {
                addChild(firstView)
                view.addSubview(firstView.view)
                firstView.didMove(toParent: self)
                firstView.view.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    firstView.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
                    firstView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    firstView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    firstView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            }
        } else {
            // Удалить первое представление, если оно есть
            if firstView.parent != nil {
                firstView.willMove(toParent: nil)
                firstView.view.removeFromSuperview()
                firstView.removeFromParent()
            }
            
            // Добавить второе представление, если оно еще не добавлено
            if secondView.parent == nil {
                addChild(secondView)
                view.addSubview(secondView.view)
                secondView.didMove(toParent: self)
                secondView.view.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    secondView.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
                    secondView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    secondView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    secondView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            }
        }
    }
}

