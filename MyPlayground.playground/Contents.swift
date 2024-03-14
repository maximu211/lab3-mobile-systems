// SEMAPHORE
//import UIKit
//import Foundation
//
//let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
//var accountBalance = 1000
//
//let semaphore = DispatchSemaphore(value:1)
//
//func withdraw(amount: Int)
//{
//    concurrentQueue.async
//        {
//            semaphore.wait()
//            defer
//            {
//                semaphore.signal()
//            }
//
//        if accountBalance >= amount
//        {
//            Thread.sleep(forTimeInterval:1)
//            accountBalance -= amount
//            print("Withdrawal successful. Remeining balance: \(accountBalance)")
//
//        }
//        else
//        {
//            print("Insufficient funds")
//        }
//    }
//}
//
//func refillBalance(amount: Int)
//{
//    concurrentQueue.async
//        {
//            semaphore.wait()
//            defer
//            {
//                semaphore.signal()
//            }
//
//            Thread.sleep(forTimeInterval:1)
//            accountBalance += amount
//            print("Refill successful. Remaining balance: \(accountBalance)")
//    }
//}
//
//for _ in 1...5
//{
//    withdraw(amount:150)
//    refillBalance(amount:200)
//}


////// DISPATCH QUEUE

//import UIKit
//import Foundation
//
//var accountBalance = 1000
//
//let myQueue = DispatchQueue(label: "com.example.myqueue")
//
//func withdraw(amount: Int)
//{
//    myQueue.async {
//        if accountBalance >= amount
//        {
//            Thread.sleep(forTimeInterval: 1)
//            accountBalance -= amount
//            print("Withdrawal successful. Remaining balance: \(accountBalance)")
//        }
//        else
	//        {
//            print("Insufficient funds")
//        }
//    }
//}
//
//func refillBalance(amount: Int)
//{
//    myQueue.async {
//        Thread.sleep(forTimeInterval: 1)
//        accountBalance += amount
//        print("Refill successful. Remaining balance: \(accountBalance)")
//    }
//}
//
//for _ in 1...5
//{
//    withdraw(amount:150)
//    refillBalance(amount:200)
//}

////// OPERATION QUEUE

import UIKit
import Foundation

var accountBalance = 1000

let myQueue = OperationQueue()
myQueue.maxConcurrentOperationCount = 1

func withdraw(amount: Int)
{
    let withdrawalOperation = BlockOperation {
        if accountBalance >= amount
        {
            Thread.sleep(forTimeInterval: 1)
            accountBalance -= amount
            print("Withdrawal successful. Remaining balance: \(accountBalance)")
        }
        else
        {
            print("Insufficient funds")
        }
    }
    myQueue.addOperation(withdrawalOperation)
}

func refillBalance(amount: Int)
{
    let refillOperation = BlockOperation {
        Thread.sleep(forTimeInterval: 1)
        accountBalance += amount
        print("Refill successful. Remaining balance: \(accountBalance)")
    }
    myQueue.addOperation(refillOperation)
    
}

for _ in 1...5
{
    withdraw(amount:150)
    refillBalance(amount:200)
}
