//
//  ThirdCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

///A custom table view cell displaying information about the standard deviation of daily returns.
final class DeviationCell: UITableViewCell {
    
    // MARK: - Properties
    
    /// The reuse identifier for the deviation cell.
    static let identifier = "DeviationCell"
    
    // MARK: - UI Components
    
    /// The label displaying the description of the data.
    let dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cтандартное отклонение дневной доходности"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    /// The label displaying the deviation percentage.
    let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+/-1,89%"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        contentView.addSubview(dataLabel)
        contentView.addSubview(percentLabel)
    }
    
    // MARK: - Constraint Setup
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            dataLabel.widthAnchor.constraint(equalToConstant: 311),
            
            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            percentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

