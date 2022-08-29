//
//  MainViewController.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 22.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

protocol MainDisplayLogic: AnyObject {
    func display(viewModel: Main.Something.ViewModel.ViewModelType)
}

class MainViewController: UIViewController, MainDisplayLogic {
  var interactor: MainBusinessLogic?
  var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = MainInteractor()
    let presenter = MainPresenter()
    let router = MainRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#E5E5E5")
        configureHierarchy()
        collectionView.backgroundColor = UIColor(hexString: "#E5E5E5")
        doReuest()
    }
  
  // MARK: Do something
  
    enum SectionKind: Int, CaseIterable {
        case category, homeStore, bestSaller
    }
    
    private var categoryModel: [CategoryModel] = []
    private var bestSallerModel: [BestSellerModel] = []
    private var homeStoreModel: [HomeStoreModel] = []
    
    var dataSource: UICollectionViewDiffableDataSource<SectionKind, AnyHashable>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<SectionKind, AnyHashable>! = nil
    
    static let titleElementKind = "title-element-kind"
    
    private var collectionView: UICollectionView!
   
    func doReuest() {
        interactor?.doReuest(request: .load)
    }
    
    func display(viewModel: Main.Something.ViewModel.ViewModelType) {
        
        switch viewModel {
        case .showData(category: let category, bestSaller: let bestSaller, homeStrore: let homeStore):
            DispatchQueue.main.async {
                self.categoryModel = category
                self.bestSallerModel = bestSaller
                self.homeStoreModel = homeStore
                self.reloadData()
            }
        }
    }
}

//MARK: - create collectionView
extension MainViewController {
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let section: NSCollectionLayoutSection
            
            switch sectionIndex {
            case 0:
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                      heightDimension: .absolute(117))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
            case 1:
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.91),
                                                      heightDimension: .absolute(182))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
            case 2:
                let itemSize1 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .fractionalHeight(1.0))
                let item1 = NSCollectionLayoutItem(layoutSize: itemSize1)
                let groupSize1 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(227))
                let lastGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize1, subitem: item1, count: 2)
                lastGroup.interItemSpacing = .fixed(14)
            
                section = NSCollectionLayoutSection(group: lastGroup)
                section.interGroupSpacing = 12
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)

                let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
                let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: titleSize,
                    elementKind: MainViewController.titleElementKind,
                    alignment: .topLeading)
                section.boundarySupplementaryItems = [titleSupplementary]
                return section
            default:
                fatalError()
            }
            
            section.interGroupSpacing = 20
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            section.orthogonalScrollingBehavior = .paging
            
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: MainViewController.titleElementKind,
                alignment: .top)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20

        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: sectionProvider, configuration: config)
        return layout
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        collectionView.register(BestSellerViewCell.self, forCellWithReuseIdentifier: BestSellerViewCell.reuseIdentifier)
        collectionView.register(HomeStoreViewCell.self, forCellWithReuseIdentifier: HomeStoreViewCell.reuseIdentifier)
        collectionView.register(TitleSupplementaryView.self, forSupplementaryViewOfKind: MainViewController.titleElementKind, withReuseIdentifier: TitleSupplementaryView.reuseIdentifier)
        
//        tabView = TabView()
//        tabView.translatesAutoresizingMaskIntoConstraints = false
//        tabView.backgroundColor = UIColor.init(red: 198/255, green: 46/255, blue: 54/255, alpha: 1)
//        tabView.layer.cornerRadius = 32
//        tabView.clipsToBounds = true
        
        view.addSubview(collectionView)
//        view.addSubview(tabView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            tabView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//            tabView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//            tabView.heightAnchor.constraint(equalToConstant: 64),
//            tabView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
            ])
        
//        actView = UIActivityIndicatorView(frame: CGRect(x: view.center.x, y: view.center.y, width: 20, height: 20))
//        actView.startAnimating()
//        view.addSubview(actView)
        
        setupDataSource()
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionKind, AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, model) -> UICollectionViewCell? in
            let section = SectionKind(rawValue: indexPath.section)!
            switch section {
            case .category:
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
                let dat = model as! CategoryModel
                cell.addData(title: dat.title, description: "", image: dat.image)
                return cell
            case .bestSaller:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerViewCell.reuseIdentifier, for: indexPath) as! BestSellerViewCell
                let dat = model as! BestSellerModel
                cell.addData(title: dat.title, price: "\(dat.discount_price)", oldPrice: "\(dat.price_without_discount)")
                cell.imageView.kf.indicatorType = .activity
                KF.url(URL(string: dat.picture))
                    .set(to: cell.imageView)
                cell.clipsToBounds = true
                cell.layer.cornerRadius = 10
                return cell
            case .homeStore:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeStoreViewCell.reuseIdentifier, for: indexPath) as! HomeStoreViewCell
                 let dat = model as! HomeStoreModel
                 cell.showNewLabel(dat.is_new ?? false)
                 cell.addData(title: dat.title, description: dat.subtitle)//, image: dat.image)
                cell.imageView.kf.indicatorType = .activity
                KF.url(URL(string: dat.picture))
                    .set(to: cell.imageView)
                cell.clipsToBounds = true
                cell.layer.cornerRadius = 10
                 return cell
            }
        })
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, index) in
            let supplementary = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleSupplementaryView.reuseIdentifier, for: index) as! TitleSupplementaryView
            
            let section = SectionKind(rawValue: index.section)!
            
            switch section {
            case .category:
                supplementary.label.text = "Select Category"
                return supplementary
            case .bestSaller:
                supplementary.label.text = "Best Seller"
                return supplementary
            case .homeStore:
                supplementary.label.text = "Hot sales"
                return supplementary
            }
        }
    }
    
    private func reloadData() {
        currentSnapshot = NSDiffableDataSourceSnapshot<SectionKind, AnyHashable>()
        
        SectionKind.allCases.forEach { (sectionKind) in
            switch sectionKind {
            case .bestSaller:
                currentSnapshot.appendSections([.bestSaller])
                currentSnapshot.appendItems(bestSallerModel)
            case .category:
                currentSnapshot.appendSections([.category])
                currentSnapshot.appendItems(categoryModel)
            case .homeStore:
                currentSnapshot.appendSections([.homeStore])
                currentSnapshot.appendItems(homeStoreModel)
            }
        }

        dataSource.apply(currentSnapshot, animatingDifferences: false)
//        self.actView.stopAnimating()
//        self.actView.isHidden = true
    }
}
