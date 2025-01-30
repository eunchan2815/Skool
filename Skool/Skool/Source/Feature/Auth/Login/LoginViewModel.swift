import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String? = nil
    @Published var isLoggedIn = false
    @Published var userName = ""
    @Published var classNum = ""
    @Published var grade = ""
    var isFormValid: Bool {
        email.isEmpty || password.isEmpty
    }
    
    
    private let db = Firestore.firestore()
    
    init() {
        if let storedEmail = UserDefaults.standard.string(forKey: "userEmail"),
           let storedUserName = UserDefaults.standard.string(forKey: "userName"),
           let storedClassNum = UserDefaults.standard.string(forKey: "classNum"),
           let storedGrade = UserDefaults.standard.string(forKey: "grade") {
            
            self.email = storedEmail
            self.userName = storedUserName
            self.classNum = storedClassNum
            self.grade = storedGrade
            self.isLoggedIn = true
        }
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "이메일과 비밀번호를 입력해주세요."
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            
            guard let self = self, let user = result?.user else {
                self?.errorMessage = "로그인에 실패했습니다."
                return
            }
            
            self.fetchUserData(userId: user.uid)
        }
    }
    
    func fetchUserData(userId: String) {
        db.collection("users").document(userId).getDocument { [weak self] document, error in
            if let error = error {
                self?.errorMessage = "사용자 정보를 불러오는 데 실패했습니다: \(error.localizedDescription)"
                return
            }
            
            guard let self = self, let data = document?.data() else {
                self?.errorMessage = "사용자 데이터가 없습니다."
                return
            }
            
            let name = data["name"] as? String ?? "이름 없음"
            let classNum = data["classNum"] as? String ?? "반 정보 없음"
            let grade = data["grade"] as? String ?? "학년 정보 없음"
            
            UserDefaults.standard.set(self.email, forKey: "userEmail")
            UserDefaults.standard.set(name, forKey: "userName")
            UserDefaults.standard.set(classNum, forKey: "classNum")
            UserDefaults.standard.set(grade, forKey: "grade")
            
            self.userName = name
            self.classNum = classNum
            self.grade = grade
            self.isLoggedIn = true
            
            print("로그인 성공: \(name), 학년: \(grade), 반: \(classNum)")
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "userEmail")
            UserDefaults.standard.removeObject(forKey: "userName")
            UserDefaults.standard.removeObject(forKey: "classNum")
            UserDefaults.standard.removeObject(forKey: "grade")
            
            print("로그아웃 성공")
        } catch {
            self.errorMessage = "로그아웃 실패: \(error.localizedDescription)"
        }
    }
}
