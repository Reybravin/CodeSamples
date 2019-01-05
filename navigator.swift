//Navigator protocol

protocol Navigator {
   associatedtype Destination
   func navigate(to destination: Destination)
}

