import Foundation

class ReviewListViewState: ObservableObject {
    @Published var favoriteColor = 0
    @Published var path: [ReviewListViewPath] = []
        
    @Published var showingPostCover = false
    
    
    @Published var showingSignInAlert = false
    @Published var showingSignUpFullScreen = false

    
    private let authRepository = AuthRepository()
    
    
    private let repository = Repository()
    
    func onAppear() { }
    
    
    func tapped() {
        path.append(.reviewDetail(title: "ssss"))
    }
    
    
    func postButtonTapped() {
        guard let user = authRepository.getUser() else {
            return
        }
        if user.isAnonymous {
            // 匿名ユーザーではあれです
            showingSignInAlert = true
            return
        }
        
        showingPostCover = true
    }
    
    
    func signInTapped() {
        showingSignUpFullScreen = true
    }
    
    
    

    func matigaeta() {
        showingPostCover = true
    }

    func check() {
        showingPostCover = true

    }
}
