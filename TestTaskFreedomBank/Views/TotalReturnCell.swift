//
//  SecondCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//


import UIKit

final class TotalReturnCell: UITableViewCell {
    
    static let identifier = "SecondCell"
    
    let allProfitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Общая доходность за все время"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let averagePerDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "В среднем за день"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let percentagePerAnnumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Доходность в процентах годовых"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let dataVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let profitPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "63,89%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    let averagePercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0,1%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    let annumPercentLabel: UILabel = {
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
        
        setupUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(dataVerticalStackView)
        contentView.addSubview(percentStackView)
        
        [allProfitLabel, averagePerDayLabel, percentagePerAnnumLabel].forEach { dataVerticalStackView.addArrangedSubview($0) }
        
        [profitPercentLabel, averagePercentLabel, annumPercentLabel].forEach { percentStackView.addArrangedSubview($0) }
    }
    
    private func makeConstraints() {
        
        [allProfitLabel, averagePerDayLabel, percentagePerAnnumLabel].forEach { dataVerticalStackView.addArrangedSubview($0) }
        
        [profitPercentLabel, averagePercentLabel, annumPercentLabel].forEach { percentStackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
        dataVerticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        dataVerticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        dataVerticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        
        percentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        percentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        percentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
      ])
    }
}
        
      

