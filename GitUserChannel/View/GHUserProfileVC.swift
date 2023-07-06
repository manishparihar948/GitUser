//
//  GHUserProfileVC.swift
//  GitUserChannel
//
//  Created by Manish Parihar on 05.07.23.
//

import SwiftUI

struct GHUserProfileVC: View {
    
   // var userDetails : GHUserDetail
    let gitUserList : GHUserList
    
    let helper = Helper()
    
    var body: some View {
        Text(gitUserList.login)
    }
}

struct GHUserProfileVC_Previews: PreviewProvider {
    static var previews: some View {
        GHUserProfileVC(gitUserList: GHUserList.example1())
    }
}

