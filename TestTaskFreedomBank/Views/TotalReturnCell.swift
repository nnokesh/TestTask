//
//  SecondCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//


import UIKit

final class TotalReturnCell: UITableViewCell {
    
    static let identifier = "SecondCell"
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Общая доходность за все время"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let dataLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "В среднем за день"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let dataLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Доходность в процентах годовых"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "63,89%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    let percentLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0,1%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    let percentLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2,11%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    let percentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dataStackView)
        contentView.addSubview(percentStackView)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        
        [dataLabel, dataLabel2, dataLabel3].forEach { dataStackView.addArrangedSubview($0) }
        
        [percentLabel, percentLabel2, percentLabel3].forEach { percentStackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
        dataStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        dataStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        dataStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        percentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        percentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        percentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
      ])
    }
}
        
      

