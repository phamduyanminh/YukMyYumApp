//
//  AuthViewModel.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-30.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isUserSignInSuccessful: Bool = false
    @Published var isUserRegisterAccountSuccessful: Bool = false
    
    init(){
        print(#function, "getting auth user")
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    //Sign-in
    func signIn(withEmail email: String, password: String) async throws{
        print(#function, "Logging user in")
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            self.isUserSignInSuccessful = true
            await fetchUser()
            print(#function, "Signed in")
        }catch{
            print(#function, "Failed to sign user in with error: \(error.localizedDescription)")
        }
    }
    
    //Create user
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        print(#function, "Created user")
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            self.isUserRegisterAccountSuccessful = true
            await fetchUser()
        }catch{
            print(#function, "Failed to created user with error: \(error.localizedDescription)")
        }
    }
    
    //Sign-out
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            print("Signed user out")
        }catch{
            print(#function, "Inable to sign user out: \(error.localizedDescription)")
        }
    }
    
    //Delete account
    func deleteAccount(){
        
    }
    
    //Init user session
    func initUserSession(){
        self.userSession = Auth.auth().currentUser
    }
    
    //Fetch user info
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: current user is \(self.currentUser)")
    }
    
    
    
}
