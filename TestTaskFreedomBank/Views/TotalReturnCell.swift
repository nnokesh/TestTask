//
//  SecondCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

/**
 A custom table view cell used to display total return information.
 */
final class TotalReturnCell: UITableViewCell {
    
    /// A reusable identifier for the cell.
    static let identifier = "TotalReturnCell"
    
    /// The label displaying the total profit value.
    let allProfitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Общая доходность за все время"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    /// The label displaying the average profit per day value.
    let averagePerDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "В среднем за день"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    /// The label displaying the annual percentage profit value.
    let percentagePerAnnumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Доходность в процентах годовых"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    /// A stack view to hold the data labels vertically.
    let dataVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    /// The label displaying the total profit percentage.
    let profitPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "63,89%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    /// The label displaying the average profit percentage per day.
    let averagePercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0,1%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    /// The label displaying the annual profit percentage.
    let annumPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2,11%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGreen
        return label
    }()
    
    /// A stack view to hold the percentage labels vertically.
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
    
    /**
     Sets up the cell's UI elements.
     */
    private func setupUI() {
        contentView.addSubview(dataVerticalStackView)
        contentView.addSubview(percentStackView)
        
        [allProfitLabel, averagePerDayLabel, percentagePerAnnumLabel].forEach { dataVerticalStackView.addArrangedSubview($0) }
        [profitPercentLabel, averagePercentLabel, annumPercentLabel].forEach { percentStackView.addArrangedSubview($0) }
    }
    
    /**
     Applies constraints to the cell's UI elements.
     */
    private func makeConstraints() {
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
