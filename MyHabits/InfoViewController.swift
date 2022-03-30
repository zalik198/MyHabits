//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Shom on 29.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.indicatorStyle = .black
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.toAutoLayout()
        return contentView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.toAutoLayout()
        titleLabel.text = "Привычка за 21 день"
        titleLabel.contentMode = .scaleAspectFit
        titleLabel.font = .boldSystemFont(ofSize: 20)
        return titleLabel
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.toAutoLayout()
        textView.isScrollEnabled = false
        textView.text = myTextView
        textView.font = .systemFont(ofSize: 17)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(titleLabel, textView)
        
        initialLayout()
        
    }
    
    
    //MARK: Initial Layout
    func initialLayout() {
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 150),
                                     //При прокрутке вниз не скролистя до конца!Исправить!!!
                                     
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                                     contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                     contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     
                                     titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
                                     titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     titleLabel.widthAnchor.constraint(equalToConstant: 218),
                                     titleLabel.heightAnchor.constraint(equalToConstant: 24),
                                     
                                     textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 62),
                                     textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     textView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16),
                                     textView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
                                    ])
    }
    
}


