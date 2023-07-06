//
//  GHUserListVC.swift
//  GitUserChannel
//
//  Created by Manish Parihar on 05.07.23.
//

import SwiftUI

struct GHUserListVC: View {
    
    @StateObject var viewModel = GHUserViewModel()
        
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
               
                List(viewModel.gitUserList) { userlist in
                       // GHUserRow(viewModel.gitUserList: userlist)
                        Text(userlist.login)
                    }
                
            }
            .navigationTitle("Git Users")
            .onAppear {
                if viewModel.gitUserList.isEmpty {
                    Task {
                        await viewModel.fetchUserLists()
                    }
                }
            }
        }
    }
}


struct GHUserListVC_Previews: PreviewProvider {
    static var previews: some View {
        GHUserListVC()
    }
}

/*
 // MARK: - List Row
 struct GHUserRow: View {
 
 let darkGrayColor = UIColor.gray
 // let gitUserList : GHUserList
 let viewModel = GHUserViewModel()
 
 let helper = Helper()
 
 var body: some View {
 VStack(alignment: .leading) {
 
 // Display Name
 Text(viewModel.gitUserList.login)
 .font(.system(size: 16, weight: .bold, design: .monospaced))
 .foregroundColor(.blue)
 .padding(.bottom, 2)
 }
 .frame(height: 80)
 }
 }
 */
