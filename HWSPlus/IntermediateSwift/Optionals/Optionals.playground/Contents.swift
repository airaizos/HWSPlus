import UIKit
import SwiftUI
extension String {
    
    func separator() -> Void {
        print("\n *-*-*-*-*-*-*-*-*-* \(self) *-*-*-*-*-*-*-*-*-* \n")
    }
}

/// 6 diferentes maneras de tratar opcionales

/// #Nil coalescing
"Nil coalescing".separator()

func username(for id: Int) -> String? {
    if id == 13 {
        return "Taylor Swift"
    }
    return nil
}
/// Classic
let user = username(for: 556) ?? "Anonymous"
print(user)

/// Try?
let cache = (try? String(contentsOfFile: "cache.txt")) ?? ""
print(cache)

/// as?
/// usando el tipado condicional y si falla proveer un default

let friends = UserDefaults.standard.array(forKey: "friends") as? [String] ?? []

"Functional Approach".separator()

/// compactMap()

let numberStrings = ["1","2","Three"]
let numberInts = numberStrings.compactMap { Int($0) }
print(numberInts)

let urlStrings = ["https://apple.com","https://swift.org","","emoji"]
let secureUrls = urlStrings.compactMap {
    if $0.hasPrefix("https://") {
        return URL(string: $0)
    } else {
        return nil
    }
}
print(secureUrls)


"Lazy properties".separator()

final class MainViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    
    lazy var collectionViewFunc = makeCollectionView()
    
    
    func makeCollectionView() -> UICollectionView {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }
}

"Dependency Injection".separator()

struct Product {
    let name: String = "Hacking with Swift"
}

class PurchaseViewController: UIViewController {
    var product: Product
    
    init?(coder: NSCoder, product: Product) {
        self.product = product
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Debes crear este viewController con un producto")
    }
    
    
    func buy(product: Product) {
        guard let vc = storyboard?.instantiateViewController(identifier: "Purchase", creator: { coder in
            PurchaseViewController(coder: coder, product: product)
        }) else {
            fatalError("Fallo al abrir PurchaseViewController from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

"Initializers".separator()

extension URL {
    init(_ string: StaticString) {
        if let url = URL(string: "\(string)") {
            self = url
        } else {
            fatalError("Illegarl URL: \(string)")
        }
    }
}

extension NSRegularExpression {
    convenience init(_ pattern: StaticString) {
        do {
            try self.init(pattern: "\(pattern)")
        } catch {
            preconditionFailure("Illegarl regex \(pattern)")
        }
    }
}

"Throwing functions".separator()

/// No sabemos porque ha fallado, solo devuelve nil
func encrypt(pin: String) -> String? {
    if pin == "12345" {
        print("Tengo la misma clave en mi candado")
        return nil
    }
    return "Encryption complete"
}

/// Para lo que creamos un enum

enum PasswordError: Error {
    case obvious
}

/// Reescribimos la funcion para que siempre devuelva un string, pero un error si algo va mal

func encrypt(key: String) throws -> String {
    if key == "12345" {
        print("Tengo la misma clave en mi candado")
        throw PasswordError.obvious
    }
    return "Encryption complete"
}

try? encrypt(key: "12345")

/// Añadimos una extension para que las strings se conformen con LocalizedError
extension String: LocalizedError {
    public var errorDescription: String? {
        self
    }
}

/// y así podemos lanzar las strings directamente

func encrypt(code: String) throws -> String {
    if code == "12345" {
        throw "código demasiado fácil"
    }
    return "Encryption complete"
}

do {
    try print(encrypt(code: "12345"))
} catch let error {
    print("Error: \(error)")
}

"Enums".separator()


/// Dejarlo así es ambiguo. Que significa si es nil. Puede ser que recomiende otros productos, o que muestre producto no encontrado.
struct Producto { }
struct ProductView: View {
    var selectedProduct: Producto?
    
    var body: some View {
        Text("Hola, mundo").padding()
    }
}

/// Se puede reescribir asi

enum ViewingMode {
    case selected(product: Producto)
    case recommended
}

struct ProductoView: View {
    var mode: ViewingMode
    
    var body: some View {
        Text("hola tu!").padding()
    }
}
