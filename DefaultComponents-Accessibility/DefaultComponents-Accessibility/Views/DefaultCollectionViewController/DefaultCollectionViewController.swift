//
//  DefaultCollectionViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

class DefaultCollectionViewController: DefaultViewController {
    
    var isAccessible: Bool
    var dataSouce: DataSource!
    var snapshot: Snapshot!
    var sections: [String]?
    var items: [Item]?
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    // MARK: Initialize
    init(isAccessible: Bool) {
        self.isAccessible = isAccessible
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureView()
        configureDataSource()
    }
}

// MARK: Configuration
private extension DefaultCollectionViewController {
    func configureSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func configureView() {
        view.backgroundColor = .white
        view.addPinnedSubview(collectionView, height: nil)
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSouce = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration(elementKind: Supplementary.title
            .name, handler: supplementaryRegistrationHandler)
        dataSouce.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: indexPath)
        }
        
        updateSnapshot()
        collectionView.dataSource = dataSouce
    }
}


extension DefaultCollectionViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        view.becomeFirstResponder()
    }
}

// MARK: Keyboard Notification
extension DefaultCollectionViewController {
    func registerKeyboardNotifications(){
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else { return }
        
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardFrame.height, right: 0.0)
        collectionView.contentInset = contentInset
        collectionView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let contentInset = UIEdgeInsets.zero
        
        collectionView.contentInset = contentInset
        collectionView.scrollIndicatorInsets = contentInset
    }
}
