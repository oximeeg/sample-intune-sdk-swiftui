//
//  SceneDelegate.swift
//

import MSAL
import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }

    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = UIHostingController(
      rootView: ContentView()
    )
    self.window = window
    window.makeKeyAndVisible()
  }

  func scene(
    _ scene: UIScene,
    openURLContexts URLContexts: Set<UIOpenURLContext>
  ) {
    guard let urlContext = URLContexts.first else { return }

    let url = urlContext.url
    let sourceApp = urlContext.options.sourceApplication

    MSALPublicClientApplication.handleMSALResponse(url, sourceApplication: sourceApp)
  }

}
