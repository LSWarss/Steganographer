//
//  SearchBarCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 24/11/2021.
//

import UIKit

final class SearchBarCell: UITableViewCell, UISearchBarDelegate {

    var presenter: DashboardPresenter?

    private let reuseableCell = "searchBarCellId"

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search..."
        return searchBar
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseableCell)

        searchBar.delegate = self
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        contentView.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    // This method updates filteredData based on the text in the Search Box
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           presenter?.filter(with: searchText)
       }

}   
