import Foundation

actor User {
    func login() {
        Task {
            if authenticate(user:"taytay89", password:"n3wy0rk") {
                print("Successfully logged in")
            } else {
                print("Sorry, something went wrong")
            }
        }
    }
}

func authenticate(user: String, password: String) -> Bool {
    return true
}

let user = User()
await user.login()


actor DetachedUser {
    func login() {
        Task.detached {
            if await self.authenticate(user: "taytay89", password: "n3wy0rk"){
                print("Task Detached. Successfully logged in")
            } else {
                print("Sorry, something went wrong")
            }
        }
    }
}

let detachedUser = DetachedUser()
await detachedUser.login()
///No piede acceder al método authenticate
