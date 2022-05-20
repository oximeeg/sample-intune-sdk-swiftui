//
//  ContentView.swift
//

import IntuneMAMSwift
import SwiftUI

struct ContentView: View {

  @State var account = ""

  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button(
          action: { login() },
          label: { Text("Login") }
        )
        Spacer()
        Button(
          action: { logout() },
          label: { Text("Logout") }
        )
        Spacer()
      }
      Text(account)
    }
    .onAppear(perform: loadAccount)
  }

  func login() {
    IntuneMAMEnrollmentManager.instance().loginAndEnrollAccount(nil)
  }

  func logout() {
    IntuneMAMEnrollmentManager.instance().deRegisterAndUnenrollAccount(account, withWipe: true)
  }

  func loadAccount() {
    if let account = IntuneMAMEnrollmentManager.instance().enrolledAccount() {
      self.account = account
    } else {
      self.account = "no login"
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
