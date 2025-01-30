import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignupViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var grade = ""
    @Published var classNum = ""
    @Published var signupSuccess = false 
    
    var allValid : Bool {
        username.isEmpty || !checkEmail(str: email) ||
        email.isEmpty ||
        password.isEmpty ||
        password.count < 7 ||
        grade.isEmpty ||
        classNum.isEmpty
    }
    
    var usernameVaild : Bool {
        username.isEmpty
    }
    
    var emailValid : Bool {
        !checkEmail(str: email)
    }
    
    var passwordValid : Bool {
        password.isEmpty || password.count < 7
    }
        
    var gradeValid : Bool {
        grade.isEmpty
    }
    
    var classNumValid : Bool {
        classNum.isEmpty
    }
    
    private var db = Firestore.firestore()
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let self = self, let user = result?.user else {
                return
            }
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = self.username
            changeRequest.commitChanges { error in
                if let error = error {
                    print("프로필 업데이트 실패: \(error.localizedDescription)")
                } else {
                    print("사용자 프로필 업데이트 완료")
                }
            }
            
            self.saveUserData(userId: user.uid)
            self.signupSuccess = true
        }
    }
    
    private func saveUserData(userId: String) {
        let userRef = db.collection("users").document(userId)
        
        userRef.setData([
            "name": username,
            "email": email,
            "grade": grade,
            "classNum": classNum
        ]) { error in
            if let error = error {
                print("사용자 데이터 저장 실패: \(error.localizedDescription)")
            } else {
                print("사용자 데이터 저장 성공")
            }
        }
    }
    
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
}
