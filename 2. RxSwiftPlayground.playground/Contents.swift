import UIKit
import RxSwift
import PlaygroundSupport

/// 1. ignoreElements
/// ignoreElements()는 기존의 elements를 무시하고 onCompleted()를 실행한다.
/// subscribe를 실행하기 전에 ignoreElements()가 실행되어 onNext() 호출은 실패한다.
/// 다만 onCompleted()까지 ignore가 아니기때문에 [Subscription is called]만이 출력된다.
//let strikes = PublishSubject<String>()
//let disposeBag = DisposeBag()
//
//strikes
//    .ignoreElements()
//    .subscribe { _ in
//        print("[Subscription is called]")
//    }.disposed(by: disposeBag)
//
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")
//strikes.onCompleted()


/// 2. elements at
///  elementAt(index)는 index 위치의 값을 반환한다.
//let strikes = PublishSubject<String>()
//let disposeBag = DisposeBag()
//
//strikes.elementAt(2) // 세번째 인자가 들어오기 전까지는 'You are out!'이 출력되지 않는다.
//    .subscribe(onNext: { _ in
//        print("You are out!")
//    }).disposed(by: disposeBag)
//
//strikes.onNext("X")
//strikes.onNext("X")
//strikes.onNext("X")


/// 3.  filter
/// 조건에 따라 elements를 반환한다.
//let disposeBag = DisposeBag()
//
//Observable.of(1, 2, 3, 4, 5, 6, 7)
//    .filter { $0 % 2 == 0 }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)



/// 4. skip
/// skip의 갯수에 따라 elements를 건너뛰어 나머지를 반환한다.
//let disposeBag = DisposeBag()
//
//Observable.of("A", "B", "C", "D", "E", "F")
//    .skip(3)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)



/// 5. skipWhile
/// 조건을 만족하는 동안 elements를 건너뛰어 나머지를 반환한다.
//let disposeBag = DisposeBag()
//
//Observable.of(2, 1, 2, 3, 4, 4)
//    .skipWhile { $0 % 2 == 0 }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)


/// 6. skipUntil
/// 특정 trigger를 걸어 이벤트가 발생하기 전까지 skip해버린다.
//let disposeBag = DisposeBag()
//
//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject.skipUntil(trigger) // trigger에 이벤트가 발생하기 전까지 skip한다.
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//subject.onNext("A")
//subject.onNext("B")
//
//trigger.onNext("X") // 트리거 걸기
//
//subject.onNext("C") // 출력



/// 7. take
/// count 수만큼 elements가 순차적으로 출력된다.
//let disposeBag = DisposeBag()
//
//Observable.of(1, 2, 3, 4, 5, 6)
//    .take(3)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)



/// 8. takeWhile
/// 조건을 만족하는동안의 elements를 반환한다.
/// return은 미사용해도 무관하다.
//let disposeBag = DisposeBag()
//
//Observable.of(2, 4, 6, 7, 8, 10)
//    .takeWhile { return $0 % 2 == 0 }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)



/// 9. takeUntil
/// trigger 이벤트가 발생하기전  onNext()를 호출한다.
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")

subject.onNext("C")
