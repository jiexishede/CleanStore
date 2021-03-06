//
//  ListOrdersRouter.swift
//  CleanStore
//
//  Created by Raymond Law on 10/31/15.
//  Copyright (c) 2015 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ListOrdersRoutingLogic
{
  func routeToShowOrder(segue: UIStoryboardSegue?)
  func routeToCreateOrder(segue: UIStoryboardSegue?)
}

protocol ListOrdersDataPassing
{
  var dataStore: ListOrdersDataStore? { get }
}

class ListOrdersRouter: NSObject, ListOrdersRoutingLogic, ListOrdersDataPassing
{
  weak var viewController: ListOrdersViewController?
  var dataStore: ListOrdersDataStore?
  
  // MARK: Routing
  
  func routeToShowOrder(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! ShowOrderViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToShowOrder(source: dataStore!, destination: &destinationDS)
    } else {
      let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "ShowOrderViewController") as! ShowOrderViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToShowOrder(source: dataStore!, destination: &destinationDS)
      navigateToShowOrder(source: viewController!, destination: destinationVC)
    }
  }
  
  func routeToCreateOrder(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! CreateOrderViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToCreateOrder(source: dataStore!, destination: &destinationDS)
    } else {
      let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "CreateOrderViewController") as! CreateOrderViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToCreateOrder(source: dataStore!, destination: &destinationDS)
      navigateToCreateOrder(source: viewController!, destination: destinationVC)
    }
  }
  
  // MARK: Navigation
  
  func navigateToShowOrder(source: ListOrdersViewController, destination: ShowOrderViewController)
  {
    source.show(destination, sender: nil)
  }
  
  func navigateToCreateOrder(source: ListOrdersViewController, destination: CreateOrderViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToShowOrder(source: ListOrdersDataStore, destination: inout ShowOrderDataStore)
  {
    let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
    destination.order = source.orders?[selectedRow!]
  }
  
  func passDataToCreateOrder(source: ListOrdersDataStore, destination: inout CreateOrderDataStore)
  {
  }
}
