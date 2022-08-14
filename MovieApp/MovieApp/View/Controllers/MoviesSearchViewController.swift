//
//  MoviesSearchViewController.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/11/22.
//

import UIKit

protocol MovieSearchViewing: AnyObject {
    func loadData()
    func showLoading()
    func hideLoading()
}

final class MoviesSearchViewController: UIViewController {
    var presenter: MoviesSearchViewPresenting!
    @IBOutlet private weak var movieListTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var activityView =  UIActivityIndicatorView(style: .medium)
    
    private enum Constant {
        static let cellIdentifier = String(describing: MovieTableViewCell.self)
        static let viewTitle = "Movie Search"
        static let estimatedRowHeight = 110.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.title = Constant.viewTitle
        searchBar.delegate = self
    }
    
    private func setUpTableView() {
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
        movieListTableView.register(
            UINib(
                nibName: Constant.cellIdentifier,
                bundle: nil
            ), forCellReuseIdentifier: Constant.cellIdentifier
        )
        movieListTableView.estimatedRowHeight = Constant.estimatedRowHeight
        movieListTableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func search(_ sender: UIButton) {
        presenter.fetchMovies(for: searchBar.text)
    }
}

/// MARK:- UITableViewDelegate & UITableViewDataSource Methods
extension MoviesSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier) as? MovieTableViewCell else {
            fatalError()
        }
        cell.setUpWithModel(
            model: presenter.movie,
            indexpath: indexPath
        )
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        presenter.didSelect(atIndex: indexPath)
        
        //unselect previous selection
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return presenter.movie?.results.count ?? 0
    }
}

/// MARK:- MovieSearchViewing Methods
extension MoviesSearchViewController: MovieSearchViewing {
    func showLoading() {
        activityView.center = self.view.center
        view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func hideLoading() {
        activityView.stopAnimating()
    }
    
    func loadData() {
        movieListTableView.reloadData()
    }
}

/// MARK:- UISearchBarDelegate Methods
extension MoviesSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.fetchMovies(for: searchBar.text)
        searchBar.resignFirstResponder()
    }
}
