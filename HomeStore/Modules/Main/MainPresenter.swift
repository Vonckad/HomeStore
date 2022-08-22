//
//  MainPresenter.swift
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

protocol MainPresentationLogic {
    func presentSomething(response: Main.Something.Response.ResponseType)
}

class MainPresenter: MainPresentationLogic {
  weak var viewController: MainDisplayLogic?
  
  // MARK: Do something
  
    func presentSomething(response: Main.Something.Response.ResponseType) {
      viewController?.displaySomething(viewModel: .showData)
  }
}