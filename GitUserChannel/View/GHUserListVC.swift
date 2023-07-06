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
            VStack {
                List(viewModel.gitUserList, id: \.self)  { userlist in
                    NavigationLink {
                        GHUserProfileVC(gitUserList: userlist)
                    } label: {
                        GHUserRow(gitUserList: userlist)
                    }
                          //  GHUserRow(gitUserList: userlist)
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


 // MARK: - List Row
 struct GHUserRow: View {
 
     let darkGrayColor = UIColor.gray
     let gitUserList : GHUserList
 
     let helper = Helper()
     
     let imageSize : CGFloat = 80
 
     var body: some View {
         HStack{
             // Image Display
             if !gitUserList.avatarUrl.isEmpty {
                 AsyncImage(url: URL(string: gitUserList.avatarUrl)) { phase in
                     if let image = phase.image {
                         image.resizable()
                             .scaledToFill()
                             .frame(width: imageSize, height: imageSize)
                             .clipped()
                     } else if phase.error != nil {
                         Text(phase.error?.localizedDescription ?? "error")
                             .foregroundColor(Color.pink)
                             .frame(width: imageSize, height: imageSize)
                     } else {
                         ProgressView()
                              .frame(width: imageSize, height: imageSize)
                      }
                 }
             } else {
                 Color.gray.frame(width: imageSize, height: imageSize)
             }
             
             VStack (alignment: .leading, spacing: 5) {
                 // Display Name
                 Text(gitUserList.login.uppercased())
                     .font(.system(size: 16, weight: .bold, design: .monospaced))
                     .foregroundColor(.blue)
                     .padding(.bottom, 2)
             }
         }
         .frame(height: 80)
     }
 }

